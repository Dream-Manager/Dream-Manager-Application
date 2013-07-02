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
	
    def private getTokenForProvider (String provider) { 
		return OAuthKey.withCriteria{ 
			eq('user', User.findByUsername(SecurityUtils.subject.principal))
			eq('provider', provider) }?.accessToken
	}
			
	def getFromTwitter (resource) {
		return OauthService.getTwitterResource(getTokenForProvider('twitter'), resource)
	}
}
