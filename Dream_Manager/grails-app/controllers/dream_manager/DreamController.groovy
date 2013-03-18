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
	  
	def create = {
		def dreamInstance = new Dream(params)
		def user = User.findByUsername(SecurityUtils.subject.principal)
		dreamInstance.user = user
		
		if(!dreamInstance.hasErrors() && dreamInstance.save()) {
			flash.message = "Success"
			render(view:'show',model: dreamInstance)
		}
	}	
	
	def createAjax = {
		def dreamInstance = new Dream(params)
		def user = User.findByUsername(SecurityUtils.subject.principal)
		dreamInstance.user = user
		
		if(!dreamInstance.hasErrors() && dreamInstance.save()) {
			flash.message = "Success"
		}
	}
	
	def ajaxSearchDreams = {
		def dreamList = Dream.withCriteria { 
			eq('user',User.findByUsername(SecurityUtils.subject.principal))
			ilike('name', '%' + params.ajaxSearchDreamsTerm + '%')
		}
		render(view:'ajaxSearchDreams.gsp', model: ['dreams': dreamList])
	}
	
	def ajaxSearchDreamsAutocomplete = {
		def dreams = Dream.withCriteria {
			eq('user',User.findByUsername(SecurityUtils.subject.principal))
			ilike('name', '%' + params.term + '%')
		}
		render (dreams*.name) as JSON
	}
}
