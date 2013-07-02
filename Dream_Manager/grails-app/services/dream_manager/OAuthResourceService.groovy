package dream_manager
import org.scribe.builder.*
import org.scribe.builder.api.*
import org.scribe.model.*
import org.scribe.oauth.*
import org.apache.shiro.subject.Subject
import org.apache.shiro.SecurityUtils
import org.springframework.web.context.request.RequestContextHolder

class OAuthResourceService {
	
	def OauthService
	
    def getSessionKey (String provider) { 
		def session = RequestContextHolder.currentRequestAttributes().getSession()
		String sessionKey = OauthService.findSessionKeyForAccessToken(provider)
		return session[sessionKey]
	}
	
	def saveSessionKey (String provider) {
		def session = RequestContextHolder.currentRequestAttributes().getSession()
		String sessionKey = OauthService.findSessionKeyForAccessToken(provider)
		
		def key = new OAuthKey (
			user: User.findByUsername(SecurityUtils.subject.principal),
			sessionKey: sessionKey,
			accessKey: session[sessionKey],
			provider: provider			
		)
		
		if(!key.hasErrors() && key.save())
			return key.id
		else log.error(session.user + " " + key.sessionKey + " " + key.accessKey + " " + key.provider + " " + key.user.id)
	}
	
	def loadSessionKeys (session) {
		//def session = RequestContextHolder.currentRequestAttributes().getSession()
		OAuthKey.findAllByUser(User.findByUsername(SecurityUtils.subject.principal)).each {
			session[it.sessionKey] = it.accessKey
		}
	}
			
	def accessResource (method, provider, resource) {
		//OauthService.${method}${provider}Resource(getSessionKey(provider), resource)
	}
}
