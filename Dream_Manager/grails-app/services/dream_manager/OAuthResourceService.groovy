package dream_manager
import org.scribe.builder.*
import org.scribe.builder.api.*
import org.scribe.model.*
import org.scribe.oauth.*
import org.apache.shiro.subject.Subject
import org.apache.shiro.SecurityUtils

class OAuthResourceService {
	
	def OauthService
	
    def getSessionKey (String provider) { 
		String sessionKey = OauthService.findSessionKeyForAccessToken(provider)
		return session[sessionKey]
	}
	
	def saveSessionKey (String provider) {
		new OAuthKey (
			user: User.findByUsername(SecurityUtils.subject.principal),
			key: getSessionKey(provider),
			provider: provider			
		).save()
	}
	
	def loadSessionKeys () {
		OAuthKey.findAllByUser(User.findByUsername(SecurityUtils.subject.principal)).each {
			validateKey(it)
			//set session
		}
	}
	
	def validateKey (OAuthKey oAuthKey) {
		// for each key in session
		//	attempt validation
		//	if fails
		//		remove from session
	}
	
	def removeKey (String provider) {
		// if key exists in session and/or database
		//	remove
	}
		
	def getResourceFromProvider (String method, String provider, String resource) {
		OauthService.${method}${provider}Resource(getSessionKey(provider), resource)
	}
}
