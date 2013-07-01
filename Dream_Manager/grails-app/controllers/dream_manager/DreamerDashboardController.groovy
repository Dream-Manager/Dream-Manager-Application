package dream_manager
import org.apache.shiro.subject.Subject

class DreamerDashboardController {
	def shiroSecurityService
    def index() {
		// Verify social connection keys are persisted and loaded
		OAuthResourceService.updateSessionKeys()
	}
	
	
	def shorterm() { }
	def longterm() { }
	def help() { }
}
