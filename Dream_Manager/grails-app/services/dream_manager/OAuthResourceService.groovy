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
		def session = RequestContextHolder.currentRequestAttributes().getSession()
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
	
	def updateSessionKeys () {
		OAuthKey.findAllByUser(User.findByUsername(SecurityUtils.subject.principal)).each {
			validateKey(it)
			//set session
		}
	}
	
	def removeKey (String provider) {
		def session = RequestContextHolder.currentRequestAttributes().getSession()
		// if key exists in session and/or database
		//	remove
	}
		
	def accessResource (method, provider, resource) {
		//OauthService.${method}${provider}Resource(getSessionKey(provider), resource)
	}
}
