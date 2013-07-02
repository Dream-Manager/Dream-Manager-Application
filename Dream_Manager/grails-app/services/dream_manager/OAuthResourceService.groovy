package dream_manager
import org.scribe.builder.*
import org.scribe.builder.api.*
import org.scribe.model.*
import org.scribe.oauth.*
import org.apache.shiro.subject.Subject
import org.apache.shiro.SecurityUtils

class OAuthResourceService {
	
	def OauthService
	
    def private getTokenForProvider (String provider) { 
		def record = OAuthKey.withCriteria { 
			and {
				eq('user', User.findByUsername(SecurityUtils.subject.principal))
				eq('provider', provider)
			} 
		}?.get(0)
		org.scribe.model.Token token = new org.scribe.model.Token (record.accessKey, record.accessSecret)
		return token 
	}
			
	def getFromTwitter (resource) {
		return OauthService.getTwitterResource(getTokenForProvider('twitter'), resource);
	}
}
