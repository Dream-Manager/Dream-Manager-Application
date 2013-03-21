package dream_manager
import org.apache.shiro.subject.Subject
import grails.converters.*
import org.apache.shiro.SecurityUtils
import org.bouncycastle.asn1.ocsp.ResponseData;

class DreamController {

	static scaffold = Dream
	
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
		def dreamInstance = new Dream(params)
		def user = User.findByUsername(SecurityUtils.subject.principal)
		dreamInstance.user = user
		
		if(!dreamInstance.hasErrors() && dreamInstance.save()) {
			flash.message = "Success"
			render(view:'show',model: dreamInstance)
		}
	}	
	
	/**
	 * Creates a new Dream record for the current user
	 * @param params All required fields for the Dream object
	 */
	def createAjax = {
		def dreamInstance = new Dream(params)
		def user = User.findByUsername(SecurityUtils.subject.principal)
		dreamInstance.user = user
		
		def output = ""
		def cssClass = ""
		
		if(!dreamInstance.hasErrors() && dreamInstance.save()) {
			output = "Dream Saved"
			cssClass = "ui-state-highlight"
		}
		else{
			output = "Failed to Save Dream: "+ dreamInstance.renderErrors()
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
