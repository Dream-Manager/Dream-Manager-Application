package dream_manager

class DreamerDashboardController {

    def index() { render (auth.user() == 'marc' ? "Hello Marc" : 'Who are you?') 
		
	}
}
