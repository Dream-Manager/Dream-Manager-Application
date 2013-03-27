package dream_manager

import org.apache.shiro.SecurityUtils

class DreamManagerTagLib {
	static namespace = "dreamManager"

	def linkToAction = { attrs, body ->
		out << "/"+grailsApplication.config.grails.project.groupId+"/"+attrs["controller"]+"/"+attrs["action"]
	} 
	
	def hasManager = { attrs, body ->
		def user = User?.findByUsername(SecurityUtils.subject.principal)
		if (user?.manager){
			out << body()
		}
	}
	def hasNoManager = { attrs, body ->
		def user = User?.findByUsername(SecurityUtils.subject.principal)
		if (!user?.manager){
			out << body()
		}
	}

	def requestManagerDreamerRelationFromManager = { attrs, body ->

		def relationRequest = ManagerRequest?.findByUser(User?.get(attrs["id"]))
		def currentLoggedInManager = User?.findByUsername(SecurityUtils.subject.principal)
		if(relationRequest?.requestInitiator==currentLoggedInManager){
			out << body()
		}
	}
	def requestManagerDreamerRelatiomFromDreamer = { attrs, body ->
		def relationRequest = ManagerRequest?.findByUser(User?.get(attrs["id"]))
		def currentLoggedInManager = User?.findByUsername(SecurityUtils.subject.principal)
		if((relationRequest?.requestInitiator==relationRequest?.user)&&(relationRequest?.manager==currentLoggedInManager)){
			out << body()
		}
	}

	def hasNoRequestManagerDreamerRelation = { attrs, body ->
		def relationRequest = ManagerRequest?.findByUser(User?.get(attrs["id"]))
		if(!relationRequest){
			out << body()
		}
	}

	def hasRequestManagerDreamerRelation = { attrs, body ->
		def relationRequest = ManagerRequest?.findByUser(User?.get(attrs["id"]))
		if(relationRequest){
			out << body()
		}
	}

	def currentUserInitiatedRequest = { attrs, body ->
		def currentUser = User?.findByUsername(SecurityUtils.subject.principal)
		def requestRelation = ManagerRequest?.findByUser(currentUser)
		if(requestRelation?.requestInitiator==currentUser){
			out << body()
		}
	}

	def currentUserNotInitiatedRequest = { attrs, body ->
		def currentUser = User?.findByUsername(SecurityUtils.subject.principal)
		def requestRelation = ManagerRequest?.findByUser(currentUser)
		if(requestRelation?.requestInitiator!=currentUser){
			out << body()
		}
	}
	def currentUserHasRequest = { attrs, body ->
		def currentUser = User?.findByUsername(SecurityUtils.subject.principal)
		def requestRelation = ManagerRequest?.findByUser(currentUser)
		if(requestRelation){
			out << body()
		}
	}
	def currentUserHasNoRequest = { attrs, body ->
		def currentUser = User?.findByUsername(SecurityUtils.subject.principal)
		def requestRelation = ManagerRequest?.findByUser(currentUser)
		if(!requestRelation){
			out << body()
		}
	}
}
