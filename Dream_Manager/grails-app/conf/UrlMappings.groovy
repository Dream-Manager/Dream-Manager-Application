class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"500"(view:'/error')
		
		 
		"/" (view:"/index")
		// "/" (controller:"dreamerDashboard")
		// "/controllers"(view:"/index")
		
	}
}
