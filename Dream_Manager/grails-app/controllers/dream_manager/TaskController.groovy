package dream_manager

import org.springframework.dao.DataIntegrityViolationException

class TaskController {
	
	def taskService
	def dreamService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

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
		
        def taskInstance = new Task(params)
		if(!params.orderNumber)
			taskInstance.orderNumber = taskService.getMaxOrder(params.dream.id.toLong())
        if (!taskInstance.save(flush: true)) {
            render(view: "create", model: [taskInstance: taskInstance])
            return
        }
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
		dreamService.markCompletionBasedOnTasks(taskInstance.dream.id)
        redirect(action: "show", id: taskInstance.id)
		
    }

    def show(Long id) {
        def taskInstance = Task.get(id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "list")
            return
        }

        [taskInstance: taskInstance]
    }

    def edit(Long id) {
        def taskInstance = Task.get(id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "list")
            return
        }

        [taskInstance: taskInstance]
    }

    def update(Long id, Long version) {
        def taskInstance = Task.get(id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (taskInstance.version > version) {
                taskInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'task.label', default: 'Task')] as Object[],
                          "Another user has updated this Task while you were editing")
                render(view: "edit", model: [taskInstance: taskInstance])
                return
            }
        }

        taskInstance.name = params.name
		taskInstance.estimatedCompletion = params.estimatedCompletion
		taskInstance.description = params.description
		taskInstance.percentComplete = params.percentComplete.toInteger()
		
        if (!taskInstance.save(flush: true)) {
            render(view: "edit", model: [taskInstance: taskInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
		dreamService.markCompletionBasedOnTasks(taskInstance.dream.id)
		redirect(action: "show", id: taskInstance.id)
    }

    def delete(Long id) {
        def taskInstance = Task.get(id)
        if (!taskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "list")
            return
        }

        try {
			def dreamID = taskInstance.dream.getID()
            taskInstance.delete(flush: true)
			dreamService.markCompletionBasedOnTasks(dreamID)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'task.label', default: 'Task'), id])
            redirect(action: "show", id: id)
        }
    }
	
	/**
	 * Sets the order on a set of tasks
	 * @param taskIDs string containing a common deliminated list of ids of tasks
	 */
	def reorderTasks(String taskIDs){

		def idStringArray=taskIDs?.split(",")
		//render taskIDs.size()
		//render idStringArray.length

		
		if(idStringArray) {
			def idLongArray = []
			for(i in idStringArray)
				idLongArray.push(i.toLong())	
			taskService.sortIDs(idLongArray)
		}
		render(controller:'DreamerDashboard', action:'index')
	}
}
