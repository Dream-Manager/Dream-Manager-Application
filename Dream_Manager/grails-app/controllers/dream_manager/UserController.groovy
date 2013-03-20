package dream_manager

import java.security.SecureRandom
import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.crypto.hash.Sha256Hash
import org.springframework.dao.DataIntegrityViolationException
import org.apache.shiro.SecurityUtils
import org.apache.shiro.subject.Subject


class UserController {
	def shiroSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }
	
	def getCurrentUserId ={
		def user = User.findByUsername(SecurityUtils.subject.principal).id
		render user
	}
	def getCurrentUserFirstName = {
		def user = User.findByUsername(SecurityUtils.subject.principal).firstName
		render user
	}
	
    def create() {
        [userInstance: new User(username: params.username,
								firstName:params.firstName,
								lastName:params.lastName,
								email:params.username,
								passwordHash:params.passwordHash,
								avatarLocation:null,
								streetAddress1:params.streetAddress1,
								streetAddress2:params.streetAddress2,
								poBox:params.poBox,
								dateOfBirth:params.dateOfBirth,
								city:params.city,
								state:params.state,
								zipcode:params.zipCode,
								isManager:false,
								admin:false)
		]
    }

    def save() {
		if (params.password != params.passwordConfirm) {
			redirect(controller: 'user', action: 'create')
			flash.message = "Passwords do not match"
			render('index')
		}

		// Passwords match. Let's attempt to save the user
		else {
        def userInstance = new User(username: params.username,
								firstName:params.firstName,
								lastName:params.lastName,
								email:params.username,
								passwordHash:shiroSecurityService.encodePassword(params.password),
								avatarLocation:null,
								streetAddress1:params.streetAddress1,
								streetAddress2:params.streetAddress2,
								poBox:params.poBox,
								dateOfBirth:params.dateOfBirth,
								city:params.city,
								state:params.state,
								zipcode:params.zipCode,
								isManager:false,
								admin:false)
		def authToken = new UsernamePasswordToken(params.username, params.password)

        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
		}
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }
	
	def ManagerSave = {
		if (!grailsApplication.config.grails.mail.username) {
			throw new RuntimeException(message(code: 'mail.plugin.not.configured', 'default' : 'Mail plugin not configured'))
		}
		def UserInstance = new User(params)
		def password = ""
		if (!UserInstance.passwordHash) {password = new BigInteger(130, new SecureRandom()).toString(32)
			UserInstance.passwordHash = new Sha256Hash(password).toHex()
		}
		UserInstance.passwordChangeRequiredOnNextLogon = true
		if (!UserInstance.save(flush: true)) {
			render(view: "create", model: [UserInstance: UserInstance])
			return
		}
		sendMail {
		   to UserInstance.email
		   from grailsApplication.config.grails.mail.username
		   subject "Your account was successfully created!"
		   body "Hello ${UserInstance.firstName} ${UserInstance.lastName},\n\nYour account was successfully created!\n\nHere is your password : ${password}\n\n${createLink(absolute:true,uri:'/')}\n\nBest Regards".toString()
		}
		flash.message = message(code: 'default.created.message', args: [message(code: 'User.label', default: 'User'), UserInstance.id])
		redirect(action: "show", id: UserInstance.id)
	}

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

	def editCurrentProfile () {
		def userInstance = User.findByUsername(SecurityUtils.subject.principal)
		if (!userInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
			redirect(action: "list")
			return
		}

		render(view:'edit', model: [userInstance: userInstance])
	}
	
	
    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def signup(){
		// Check to see if the username already exists
				def user = User.findByUsername(params.username)
				if (user) {
					redirect(action: 'register')
					flash.message = "User already exists with the username '${params.username}'"
				}
		
				// User doesn't exist with username. Let's create one
				else {
		
					// Make sure the passwords match
					if (params.password != params.passwordConfirm) {
						redirect(action: 'register')
						flash.message = "Passwords do not match"
					}
		
					// Passwords match. Let's attempt to save the user
					else {
						// Create user
						user = new User(username: params.username,
										firstName:params.firstName,
										lastName:params.lastName,
										email:params.username,
										passwordHash:shiroSecurityService.encodePassword(params.password),
										avatarLocation:null,
										streetAddress1:params.streetAddress1,
										streetAddress2:params.streetAddress2,
										poBox:params.poBox,
										dateOfBirth:params.dateOfBirth,
										city:params.city,
										state:params.state,
										zipcode:params.zipCode,
										isManager:false,
										admin:false)
						user.addToPermissions("*:*")
		
						 if (user.save(flush: true)) {
						 // Add USER role to new user
						 //user.addToRoles(Role.findByName('ROLE_USER'))
						 // Login user
							 render "SAVE"
						 def authToken = new UsernamePasswordToken(user.username, params.password)
						 SecurityUtils.subject.login(authToken)
						 redirect(controller:'DreamerDashboard', action:'index')
						 }
						 else {
							 redirect(action: 'register')
						 }
					}
				}
	}
	
	def register() {
		[userInstance: new User(username: params.username,
								firstName:params.firstName,
								lastName:params.lastName,
								email:params.username,
								passwordHash:params.passwordHash,
								avatarLocation:null,
								streetAddress1:params.streetAddress1,
								streetAddress2:params.streetAddress2,
								poBox:params.poBox,
								dateOfBirth:params.dateOfBirth,
								city:params.city,
								state:params.state,
								zipcode:params.zipCode,
								isManager:false,
								admin:false)
		]
	}
	
	
}
