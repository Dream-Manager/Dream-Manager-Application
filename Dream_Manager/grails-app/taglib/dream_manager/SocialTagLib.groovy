package dream_manager

class SocialTagLib {

	static namespace = "dreamManager"
	def OauthService
	
	def socialConnections = { attrs ->
		out << "<div class='socialConnections'>"
		
		// Twitter
		if(!OauthService.findSessionKeyForAccessToken('twitter'))
			out	<< oauth.connect( provider:"twitter", { g.img(dir:'images',file:'twitter-bird-light-bgs.png',width:'28',height:'28') + "Connect to Twitter" } )
		else 
			out << oauth.connect( provider:"twitter", { g.img(dir:'images',file:'twitter-bird-light-bgs.png',width:'28',height:'28') + "Connected to Twitter" } )
		
		out << "</div>"
	}
}
