package dream_manager

class SocialTagLib {

	static namespace = "dreamManager"
	def OauthService
	
	def socialConnections = { attrs ->	
		out << "<div class='socialConnections'>"
		
		// Twitter
		if(!session['twitter:oasAccessToken'])
			out	<< oauth.connect( provider:"twitter", { g.img(dir:'images',file:'twitter-bird-light-bgs.png',width:'28',height:'28') + "Connect to Twitter" } )
		else 
			out << "<a href='http://www.twitter.com'>" + g.img(dir:'images',file:'twitter-bird-light-bgs.png',width:'28',height:'28') + "TwitterUserName" + "[TwitterUserIcon]" + "</a>" 
		
		out << "</div>"
	}
}
