package dream_manager

class OAuthResourceController {
	
	static layout = "application"
	
	def callback () {		

		OAuthResourceService.saveSessionKey(params.provider)
		OAuthResourceService.getTwitterResource(params.provider, "test")
	}	
}
