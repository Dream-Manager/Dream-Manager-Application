package dream_manager

import java.security.SecureRandom
import org.springframework.dao.DataIntegrityViolationException
import org.apache.shiro.SecurityUtils
import org.apache.shiro.subject.Subject
import grails.util.Environment  
/**
 * This controller handles all the requests for dreamers acquiring and losing managers. 
 * The relation ship is binary and requires both sides approve, however only one person has to terminate it. 
 * A manager may claim a user that is already claimed and if the dreamer accepts the previous manager will be 
 * replaced with the new.
 */
class ManagerToDreamerController {
	/**
	 * This allows Managers to request to be a users Dream Manager
	 */
	def claimDreamer = {
		def manager = User?.findByUsername(SecurityUtils.subject.principal)
		def user = User?.get(params.id)
		def previousClaim = ManagerRequest?.findByUser(user)
		if(previousClaim!=null) {
			previousClaim?.delete(failOnError:true, flush: true)
		}
		if(user.manager==null){
			if(manager!=user){
				def managerRequest = new ManagerRequest(requestInitiator:manager, manager:manager,user:user,requestDate : new Date(),token:new BigInteger(130, new SecureRandom()).toString(32)).save(failOnError:true, flush: true)
				if (Environment.getCurrent()!=Environment.TEST){
					sendMail {
						to user.username
						from grailsApplication.config.grails.mail.username
						subject "A Dream Manager has decided to help you out!"
						body "Hello ${user.toString()},\n\n${manager.toString()} has decided to help you achieve your dreams.\n\nTo accept ${manager.firstName} ${manager.lastName} as your dream manager click here: ${createLink(absolute:true, controller:'managerToDreamer',action:'acceptManagerDreamerRelationshipRequest',id:managerRequest.token)}\n\n\n\n To reject this request click here: ${createLink(absolute:true, controller:'managerToDreamer',action:'rejectManagerDreamerRelationshipRequest',id:managerRequest.token)} \n\n\n\nGood Luck With Your Dreams!".toString()
					}
				}
				redirect(uri: "/#tabs-3")
				flash.message = "Request to manage ${user.firstName} ${user.lastName} has been sent."
			}
			else{
				redirect(uri: "/#tabs-3")
				flash.message = "Cannot Claim Yourself"
			}
		}
		else{
			redirect(uri: "/#tabs-3")
			flash.message = "Cannot Claim already Managed User"
		}
	}
	/**
	 * This allows Dreamers to request to be a managed by Dream Manager
	 */
	def requestManager = {
		def user = User?.findByUsername(SecurityUtils.subject.principal)
		def manager =  User?.get(params.manager.id)
		//def previousClaim = ManagerRequest.findByUser(user)
		if(user!=manager){
			if(ManagerRequest?.findByUser(user)) {
				ManagerRequest.findByUser(user).delete(fulsh:true)
			}
			if(manager){
				def managerRequest = new ManagerRequest(requestInitiator:user, manager:manager,user:user,requestDate : new Date(),token:new BigInteger(130, new SecureRandom()).toString(32)).save(failOnError:true, flush: true)
				flash.message = "Request made"
				redirect(uri:'/')
			}
			else {
				flash.message = "Request Failed ${previousClaim.toString()}"
				redirect(uri:'/')
			}
		}
		else{
			redirect(uri:'/')
			flash.message = "Cannot request Yourself"
		}
	}

	/**
	 * This allows both dreamers and managers to accept a request for a relation.
	 */
	def acceptManagerDreamerRelationshipRequest = {
		def relationshipRequest = null
		if (params?.id){
			relationshipRequest = ManagerRequest?.findByToken(params.id)
			if (relationshipRequest==null){
				relationshipRequest = ManagerRequest?.findByUser(User.get(params?.id))
			}
		}
		if (relationshipRequest==null){
			relationshipRequest = ManagerRequest?.findByUser(User?.findByUsername(SecurityUtils.subject.principal))
		}
		if (relationshipRequest && (User?.findByUsername(SecurityUtils.subject.principal)!=relationshipRequest.requestInitiator)) {
			def dreamer = relationshipRequest.user
			dreamer.manager = relationshipRequest.manager
			dreamer.managerConfirmed = true
			dreamer.nagToGetDreamManager = false
			if(!dreamer.save(flush: true)){
				flash.message = "Error not saving relation."
				redirect(uri:'/')
			}
			redirect(uri:'/')
			flash.message = "${relationshipRequest.manager.toString()}  is now ${dreamer.toString()}'s manager."
			relationshipRequest?.delete()
		} else {
			flash.message = "Not a valid request."
			redirect(uri:'/')
		}
	}
	/**
	 * This allows a Manager to stop managing a dreamer.
	 */
	def unclaimDreamer = {
		def manager = User.findByUsername(SecurityUtils.subject.principal)
		def user = User.get(params.id)
		user.managerConfirmed = false
		user.manager = null
		user.nagToGetDreamManager = true
		if(user.save(flush:true)){
			redirect(uri: "/#tabs-3")
			flash.message = "${user.firstName} ${user.lastName} is no longer yours to manage."
			if (Environment.getCurrent()!=Environment.TEST){
				sendMail {
					to user.username
					from grailsApplication.config.grails.mail.username
					subject "Dream Manager Status"
					body "Hello ${user.toString()},\n\nUnfortunately ${manager.toString()} is no longer your Dream Manager.\n\n\n\n Good luck with your dreams.".toString()
				}
			}
		}else{
			redirect(uri: "/#tabs-3")
			flash.message = "Failed to unclaim dreamer."
		}
	}
	/**
	 * This allows Dreamer to remove his manager.
	 */
	def removeManager = {
		def user = User.findByUsername(SecurityUtils.subject.principal)
		def manager = user.manager.toString()
		user.managerConfirmed = false
		user.manager = null
		user.nagToGetDreamManager = true
		if(		user.save(flush:true)){
			redirect(uri: "/")
			flash.message = "${user.toString()} you are no longer managed by ${manager}"
		}else{
			redirect(uri: "/")
			flash.message = "Failed to remove Manager."
		}
	}
	/**
	 * This allows either dreamer or manager to reject the request for a relationship.
	 */
	def rejectManagerDreamerRelationshipRequest = {

		def relationshipRequest = null
		if (params?.id){
			relationshipRequest = ManagerRequest?.findByToken(params.id)
		}
		if (relationshipRequest==null){
			relationshipRequest = ManagerRequest?.findByUser(User.findByUsername(SecurityUtils.subject.principal))
		}
		if (relationshipRequest){
			redirect(uri:'/')
			flash.message = "Request for ${relationshipRequest.manager.toString()}  to manage ${relationshipRequest.user.toString()}'s dreams has been rejected."
			relationshipRequest?.delete(flush:true)
		}
	}
	def displayManagers = {
		render(view:"displayManagers" , model: ["userInstance": User.findByUsername(SecurityUtils.subject.principal)])
	}
	def nagToGetManager = {
		def user= User?.findByUsername(SecurityUtils.subject.principal)
		def managers = User?.withCriteria {
			eq('isManager',true)
		}
		if(user.nagToGetDreamManager&&(ManagerRequest?.findByUser(user)==null)&&(Math.random()>0.9)&&managers){
			render( view:"nagToGetManager", model: ["userInstance": user])
		}else{
			redirect(uri:'/')
		}
	}

	def stopNagging = {
		def user= User?.findByUsername(SecurityUtils.subject.principal)
		user.nagToGetDreamManager = false;
		user.save(failOnError:true, flush:true)
		render ""
	}
}
