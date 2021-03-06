package dream_manager

import org.springframework.dao.DataIntegrityViolationException
import org.apache.shiro.SecurityUtils

class TaskController {

	def taskService
	def dreamService

	static allowedMethods = [save: "POST", update: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[taskInstanceList: Task.list(params), taskInstanceTotal: Task.count()]
	}

	def create() {
		[taskInstance: new Task(params)]
	}

	def save() {

		def taskInstance = new Task(
				name:params.name,
				percentComplete:params.percentComplete,
				description:params.description,
				dream:Dream.get(params.dream.id)			
			)
		
		if(!params.orderNumber)
			taskInstance.orderNumber = taskService.getMaxOrder(params.dream.id.toLong())
		if(params.estimatedCompletion)
			taskInstance.estimatedCompletion = Date.parse("MM/dd/yyyy",params.estimatedCompletion)
		if (!taskInstance.save(flush: true)) {
			render(view: "create", model: [taskInstance: taskInstance])
			return
		}

		flash.message = "Task for Dream ${taskInstance.dream.name} created."
		dreamService.markCompletionBasedOnTasks(taskInstance.dream.id)
		redirect(controller:"dreamerDashboard")
	}

	def show(Long id) {
		def taskInstance = Task.get(id)
		if (!taskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'task.label', default: 'Task'),
				id
			])
			redirect(action: "list")
			return
		}

		[taskInstance: taskInstance]
	}

	def edit(Long id) {
		def taskInstance = Task.get(id)
		if (!taskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'task.label', default: 'Task'),
				id
			])
			redirect(action: "list")
			return
		}

		[taskInstance: taskInstance]
	}

	def update(Long id, Long version) {
		def taskInstance = Task.get(id)
		if (!taskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'task.label', default: 'Task'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (taskInstance.version > version) {
				taskInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'task.label', default: 'Task')] as Object[],
						"Another user has updated this Task while you were editing")
				render(view: "edit", model: [taskInstance: taskInstance])
				return
			}
		}

		taskInstance.name = params.name
		taskInstance.estimatedCompletion = (!params.estimatedCompletion?null:Date.parse("MM/dd/yyyy",params.estimatedCompletion))
		taskInstance.description = params.description
		taskInstance.percentComplete = params.percentComplete.toInteger()
		
		if (!taskInstance.save(flush: true)) {
			render(view: "edit", model: [taskInstance: taskInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'task.label', default: 'Task'),
			taskInstance.id
		])
		dreamService.markCompletionBasedOnTasks(taskInstance.dream.id)
		redirect(action: "show", id: taskInstance.id)
	}

	def delete(Long id) {
		def taskInstance = Task.get(id)
		if (!taskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'task.label', default: 'Task'),
				id
			])
			redirect(controller: "dreamerDashboard")
			return
		}

		try {
			taskInstance.delete(flush: true)
			dreamService.markCompletionBasedOnTasks(taskInstance.dream.id)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'task.label', default: 'Task'),
				id
			])
			redirect(controller: "dreamerDashboard")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'task.label', default: 'Task'),
				id
			])
			redirect(controller: "dreamerDashboard")
		}
	}

	/**
	 * Sets the order on a set of tasks
	 * @param	taskIDs	String containing a common delimited list of IDs of tasks
	 */
	def reorderTasks(String taskIDs){

		def idStringArray=taskIDs?.split(",")

		if(idStringArray) {
			def idLongArray = []
			for(i in idStringArray)
				idLongArray.push(i.toLong())
			// Once working, remove this render
			render taskService.sortIDs(idLongArray)
		}
	}

	def ajaxUpcomingTasks = {
		def taskList = Task.withCriteria {
			dream{user{eq('id',User.findByUsername(SecurityUtils.subject.principal).id)}}
			isNotNull("estimatedCompletion")
			Date currentDate = new Date()
			ge("estimatedCompletion", currentDate)
			maxResults(3)
			order("estimatedCompletion", "asc")
			order("name", "asc")
		}
		if(taskList.size()>0)
			render(view:'ajaxUpcomingTasks.gsp', model: ['tasks': taskList], contentType: 'text/plain')
	}
	
	def markComplete(long id){
		def taskInstance = Task.get(id)
		taskInstance.percentComplete = 100
		taskInstance.save();
		dreamService.markCompletionBasedOnTasks(taskInstance.dream.id)
		redirect (controller:"dreamerDashboard")
	}
}
