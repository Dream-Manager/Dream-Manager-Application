class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		//"/"(view:"/index")
		
		"/" (controller:"dreamerDashboard")
		"/controllers" (view:"/index")

		"500"(view:'/error')
		name home: "/dreamerDashboard"(view:"/dreamerDashboard/index")
	}
}
