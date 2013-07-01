package dream_manager

class OAuthResourceController {
	
	static layout = "application"
	
	def OAuthResourceService
	
	def postToTwitter = {
		
		//	OAuthResourceService.accessResource("post", "twitter", "test")
		OAuthResourceService.saveSessionKey('twitter')
	}
}
