package dream_manager

import org.apache.shiro.SecurityUtils

class DreamManagerTagLib {
	static namespace = "dreamManager"

	def hasManager = {attrs, body ->
		def user = User.findByUsername(SecurityUtils.subject.principal)
		if (user?.manager){
			out << body()
		}
	}
	def hasNoManager = {attrs, body ->
		def user = User.findByUsername(SecurityUtils.subject.principal)
		if (!user?.manager){
			out << body()
		}
	}

	def requestManagerDreamerRelation = {attrs, body ->

		def claim = ManagerRequest?.findByManager(User?.findByUsername(SecurityUtils.subject.principal))
		if((claim?.user?.id==attrs["id"])){
			out << body()
		}
	}

	def noRequestManagerDreamerRelation = {attrs, body ->
		if(!ManagerRequest?.findByUser(User.get(attrs["id"]))){
			out << body()
		}
	}
}
