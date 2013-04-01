package dream_manager
import java.util.Date


import org.apache.shiro.subject.Subject
import grails.converters.*
import org.apache.shiro.SecurityUtils
import org.springframework.dao.DataIntegrityViolationException

class DreamController {

	static scaffold = Dream
	
	static layout = "application"
	
	def show = {
		def dream = Dream.get(params.id)
		def currentUser = User.findByUsername(SecurityUtils.subject.principal)
		def dreamersManager = User.findById(dream.user.id)?.manager
		if(dream.user != currentUser && dreamersManager != currentUser)
			redirect(controller: "dreamerDashboard")	
		else 
			render(view:"show", model: [dreamInstance : dream])
	}
	
	def showCreateAjax = {
		render (view: "createAjax")
	}
	
	def update = {
		def dreamInstance = Dream.get( params.id )
		if(dreamInstance) {
			dreamInstance.properties = params
			dreamInstance.lastUpdated = new Date()
			
			if(!dreamInstance.hasErrors() && dreamInstance.save()) {
				flash.message = "Success"
			} else {
				flash.message = "Failure"
			}
		} else {
			flash.message = "Dream not found with id ${params.id}"
		}
	}
	  
	/**
	 * Creates a new Dream record for the current user
	 * @param params All required fields for the Dream object
	 * Redirects the user to the "show" view for the created record on completion.
	 */
	def create = {
		def dreamInstance = new Dream(name: params.name,
									  category:params.category,
									  isShortTerm: params.isShortTerm,
									  notes: params.notes)									  
		def user = User.findByUsername(SecurityUtils.subject.principal)
		if(params.estimatedCompletion)
			dreamInstance.estimatedCompletion = DateFormat.parse(params.estimatedCompletion)
		dreamInstance.user = user
		if(!dreamInstance.hasErrors() && dreamInstance.save()) {
			flash.message = "Success"
			render(view:'show',model: dreamInstance)
		}
	}	
	/**
	 * Deletes the dream with the given id.
	 * @param id
	 * @return
	 */
	def delete(Long id) {
		def dreamInstance = Dream.get(id)
		if (!dreamInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'dream.label', default: 'Dream'),
				id
			])
			redirect(controller: "dreamerDashboard")
			return
		}

		try {
			dreamInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'dream.label', default: 'Dream'),
				id
			])
			redirect(controller: "dreamerDashboard")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'dream.label', default: 'Dream'),
				id
			])
			redirect(controller: "dreamerDashboard")
		}
	}
	
	
	
	/**
	 * Creates a new Dream record for the current user
	 * @param params All required fields for the Dream object
	 */
	def createAjax = {
		def dreamInstance = new Dream(name: params.name,
									  category:params.category,
									  isShortTerm: params.isShortTerm,
									  notes: params.notes)
		def user = User.findByUsername(SecurityUtils.subject.principal)
		dreamInstance.user = user
		if(params.estimatedCompletion) 
			dreamInstance.estimatedCompletion = Date.parse("MM/dd/yy",params.estimatedCompletion)
		
		
		def output = ""
		def cssClass = ""
		
		if(!dreamInstance.hasErrors() && dreamInstance.save()) {
			output = "Dream Saved"
			cssClass = "ui-state-highlight"
		}
		else{
			output = "Failed to Save Dream: "+ dreamInstance.errors.allErrors.collect{g.message([error:it])}
			cssClass = "ui-state-error"
		}
		
		render ("<div class='"+cssClass+"'>"+output+"</div>")
	}
	
	/**
	 * Executes a search of the current user's dreams.
	 * @param ajaxSearchDreamsTerm	A term to be searched on
	 * @return Table of results in HTML
	 */
	def ajaxSearchDreams = {
		def dreamList = Dream.withCriteria { 
			eq('user',User.findByUsername(SecurityUtils.subject.principal))
			ilike('name', '%' + params.ajaxSearchDreamsTerm + '%')
			order("category", "asc")
			order("name", "asc")
		}
		render(view:'ajaxSearchDreams.gsp', model: ['dreams': dreamList], contentType: 'text/plain')
	}
	
	def ajaxUpcomingDreams = {
		def dreamList = Dream.withCriteria {
			eq('user',User.findByUsername(SecurityUtils.subject.principal))
			isNotNull("estimatedCompletion")
			Date currentDate = new Date()
			ge("estimatedCompletion", currentDate)
			maxResults(3)
			order("estimatedCompletion", "asc")
			order("name", "asc")
		}
		render(view:'ajaxUpcomingDreams.gsp', model: ['dreams': dreamList], contentType: 'text/plain')
	}

	def shortermDreams = {
		def dreamList = Dream.withCriteria {
			eq('user',User.findByUsername(SecurityUtils.subject.principal))
			isNotNull("estimatedCompletion")
			Date currentDate = new Date()
			ge("estimatedCompletion", currentDate)
			maxResults(3)
			order("estimatedCompletion", "asc")
			order("name", "asc")
		}
		render(view:'shortermDreams.gsp', model: ['dreams': dreamList], contentType: 'text/plain')
	}
	
	/**
	 * Executes a search of the current user's dreams for an Autocomplete field.
	 * @param term	A term to be searched on.
	 * @return A JSON array of dream names.
	 */
	def ajaxSearchDreamsAutocomplete = {
		def dreams = Dream.withCriteria {
			eq('user',User.findByUsername(SecurityUtils.subject.principal))
			ilike('name', '%' + params.term + '%')
		}
		render (dreams*.name) as JSON
	}
}
