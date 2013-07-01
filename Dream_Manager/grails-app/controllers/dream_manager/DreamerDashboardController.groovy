package dream_manager
import org.apache.shiro.subject.Subject

class DreamerDashboardController {
	
	def shiroSecurityService
	def OAuthResourceService
	
    def index() {
		// Verify social connection keys are persisted and loaded
		OAuthResourceService.loadSessionKeys(session)
	}
	
	
	def shorterm() { }
	def longterm() { }
	def help() { }
}
