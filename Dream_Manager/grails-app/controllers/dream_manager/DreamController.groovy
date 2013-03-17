package dream_manager
import org.apache.shiro.subject.Subject
import org.apache.shiro.SecurityUtils

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
}
