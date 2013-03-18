class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		// "/"(controller:"dreamerDashboard",view:"/index")
		// "/controllers"(view:"/index")
		"500"(view:'/error')
	}
}
