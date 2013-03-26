package dream_manager

import org.apache.shiro.SecurityUtils

class DreamManagerTagLib {
	static namespace = "dreamManager"

	def hasManager = {attrs, body ->
		def user = User?.findByUsername(SecurityUtils.subject.principal)
		if (user?.manager){
			out << body()
		}
	}
	def hasNoManager = {attrs, body ->
		def user = User?.findByUsername(SecurityUtils.subject.principal)
		if (!user?.manager){
			out << body()
		}
	}

	def requestManagerDreamerRelationFromManager = {attrs, body ->

		def claim = ManagerRequest?.findByUser(User?.get(attrs["id"]))
		if((claim?.requestInitiator==User?.findByUsername(SecurityUtils.subject.principal))){
			out << body()
		}
	}
	def requestManagerDreamerRelatiomFromDreamer = {attrs, body ->

		def claim = ManagerRequest?.findByUser(User?.get(attrs["id"]))
		if((claim?.requestInitiator!=User?.findByUsername(SecurityUtils.subject.principal))){
			out << body()
		}
	}

	def hasNoRequestManagerDreamerRelation = {attrs, body ->
		if(!ManagerRequest?.findByUser(User?.findByUsername(SecurityUtils.subject.principal))){
			out << body()
		}
	}

	def hasRequestManagerDreamerRelation = {attrs, body ->
		if(ManagerRequest?.findByUser(User?.findByUsername(SecurityUtils.subject.principal))){
			out << body()
		}
	}

	def currentUserInitiatedRequest = {attrs, body ->
		def requestRelation = ManagerRequest?.findByUser(User?.findByUsername(SecurityUtils.subject.principal))
		if(requestRelation?.requestInitiator==User?.findByUsername(SecurityUtils.subject.principal)){
			out << body()
		}
	}
	
	def currentUserNotInitiatedRequest = {attrs, body ->
		def requestRelation = ManagerRequest?.findByUser(User?.findByUsername(SecurityUtils.subject.principal))
		if(requestRelation?.requestInitiator!=User?.findByUsername(SecurityUtils.subject.principal)){
			out << body()
		}
	}
}
