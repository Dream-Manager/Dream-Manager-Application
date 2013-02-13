package dream_manager

class DreamController {

	static scaffold = Dream
	
	def showCreateAjax = {
		render (view: "createAjax")
	}
}
