package dream_manager

class DreamController {

	static scaffold = Dream
	
	def showCreateAjax = {
		render (view: "createAjax")
	}
	
	def updateAjax = {
		// Get existing Dream record
		def dreamInstance = Dream.get( params.id )
		if(dreamInstance) {
			// Assign new attributes to record
			dreamInstance.properties = params
			// If savable and no error
			if(!dreamInstance.hasErrors() && dreamInstance.save()) {
				// Render success message
				flash.message = "Success"
			} else {
				// Render failure message
				flash.message = "Failure"
			}
		} else {
			// Existing Dream not found
			flash.message = "Dream not found with id ${params.id}"
		}
		  
	}
	  
	def createAjax = {
		// Create new Dream record
		def dreamInstance = new Dream(params)
		// If saved with no errors
		if(!dreamInstance.hasErrors() && dreamInstance.save()) {
			// Render success response
			flash.message = "Success"
		} else {
			// Render failure response
			flash.message = "Failure"
		}  
	}
	
	
}
