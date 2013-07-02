package dream_manager
import org.apache.shiro.subject.Subject
import org.apache.shiro.SecurityUtils
import org.scribe.model.Token

class DreamerDashboardController {
	
	def shiroSecurityService
	def OAuthResourceService
	
    def index() {
		loadSessionKeys()
		render OAuthResourceService.getFromTwitter("https://api.twitter.com/1.1/account/settings.json")
	}
	
	def shorterm() { }
	def longterm() { }
	def help() { }
	
	/** 
	 * Loads OAuth Session tokens, since Session is not available in Service layer.
	 */
	def private loadSessionKeys() {
		OAuthKey.findByUser(User.findByUsername(SecurityUtils.subject.principal)).each{
			org.scribe.model.Token token = new org.scribe.model.Token (it.accessKey, it.accessSecret)
			session[it.sessionKey] = token
		}
	}
}