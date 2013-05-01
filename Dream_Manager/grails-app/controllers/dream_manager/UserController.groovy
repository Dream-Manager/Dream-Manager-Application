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

	/**
	 * returns the id of the current logged in user
	 * @return the users id
	 */
	def getCurrentUserId ={
		def user = User.findByUsername(SecurityUtils.subject.principal).id
		render user
	}

	/**
	 * returns the currently logged in users first name
	 * @return the users first name
	 */
	def getCurrentUserFirstName = {
		def user = User.findByUsername(SecurityUtils.subject.principal).firstName
		render user
	}

	/**
	 * Executes a search of users, with users that are managed by the current user in a separate table.
	 * @param ajaxSearchUsersTerm	A term to be searched on
	 * @return Table of results in HTML
	 */
	def ajaxSearchUsers = {
		def managedUsers = User.withCriteria {
			eq('manager',User.findByUsername(SecurityUtils.subject.principal))
			or {
				ilike('firstName', '%' + params.ajaxSearchUsersTerm + '%')
				ilike('lastName', '%' + params.ajaxSearchUsersTerm + '%')
			}
			order("lastName", "asc")
		}

		def otherUsers = User.withCriteria {
			isNull('manager')
			ne('username', SecurityUtils.subject.principal)
			or {
				ilike('firstName', '%' + params.ajaxSearchUsersTerm + '%')
				ilike('lastName', '%' + params.ajaxSearchUsersTerm + '%')
			}
			order("lastName", "asc")
		}
		render(view:'ajaxSearchUsers.gsp', model: ['managedUsers': managedUsers, 'otherUsers': otherUsers], contentType: 'text/plain')
	}

	/**
	 * creates a new user record 
	 * @param username 	the email address of the user
	 * @param firstName	the first name of the user
	 * @param lastName	the last name of the user
	 * @param email		the email of the user
	 * @param passwordHash	the hashed password
	 * @param avatarLocation	the location of the profile image
	 * @param streetAddress1	the address of the user
	 * @param streetAddress2	the address of the user
	 * @param poBox		users PO box
	 * @param dateOfBirth	users date of birth
	 * @param city		current city user lives in
	 * @param state		current state user lives in
	 * @param zipcode	users zipcode
	 * @param isManager	if user is manager or not
	 * @param admin		if user is an administrator
	 */
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

	/**
	 * saves the information to the database
	 * @param username 	the email address of the user
	 * @param firstName	the first name of the user
	 * @param lastName	the last name of the user
	 * @param email		the email of the user
	 * @param passwordHash	the hashed password
	 * @param avatarLocation	the location of the profile image
	 * @param streetAddress1	the address of the user
	 * @param streetAddress2	the address of the user
	 * @param poBox		users PO box
	 * @param dateOfBirth	users date of birth
	 * @param city		current city user lives in
	 * @param state		current state user lives in
	 * @param zipcode	users zipcode
	 * @param isManager	if user is manager or not
	 * @param isAdmin if user is an administrator
	 */
	def save() {
		if (params.password != params.passwordConfirm) {
			redirect(controller: 'user', action: 'create')
			flash.message = "Passwords do not match"
			render('index')
		}

		// Passwords match. Let's attempt to save the user
		else {
			def userInstance = new User(params)
			userInstance.addToRoles(Role.findByName('ROLE_USER'))
			if (params?.isAdmin){
				userInstance.addToRoles(Role.findByName('ROLE_ADMIN'))
			}
			else{
				userInstance.removeFromRoles(Role.findByName('ROLE_ADMIN'))
			}
			if(params?.isManager){
				userInstance.addToRoles(Role.findByName('ROLE_MANAGER'))
			}
			else{
				userInstance.removeFromRoles(Role.findByName('ROLE_MANAGER'))
			}

			if (!userInstance.save(flush: true)) {
				render(view: "create", model: [userInstance: userInstance])
				return
			}

			flash.message = message(code: 'default.created.message', args: [
				message(code: 'user.label', default: 'User'),
				userInstance.id
			])
			redirect(action: "show", id: userInstance.id)
		}
	}

	def show(Long id) {
		def userInstance = User.get(id)
		if (!userInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'user.label', default: 'User'),
				id
			])
			redirect(action: "list")
			return
		}

		// Only show dream list on profile to manager of user
		def currentUser = User.findByUsername(SecurityUtils.subject.principal)
		def usersManager = User.findById(userInstance.id)?.manager
		if(usersManager != currentUser)
			userInstance.dreams = null
			
		[userInstance: userInstance]
	}
	/**
	 * When a manager creates a user this is called to save it to database. 
	 * @param username 	the email address of the user
	 * @param firstName	the first name of the user
	 * @param lastName	the last name of the user
	 * @param email		the email of the user
	 * @param avatarLocation	the location of the profile image
	 * @param streetAddress1	the address of the user
	 * @param streetAddress2	the address of the user
	 * @param poBox		users PO box
	 * @param dateOfBirth	users date of birth
	 * @param city		current city user lives in
	 * @param state		current state user lives in
	 * @param zipcode	users zipcode
	 * @param isManager	if user is manager or not
	 * @param isAdmin if user is an administrator
	 */
	def managerCreateUser = {
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
		UserInstance.addToRoles(Role.findByName('ROLE_USER'))
		if (params?.isAdmin){
			UserInstance.addToRoles(Role.findByName('ROLE_ADMIN'))
		}
		else{
			UserInstance.removeFromRoles(Role.findByName('ROLE_ADMIN'))
		}
		if(params?.isManager){
			UserInstance.addToRoles(Role.findByName('ROLE_MANAGER'))
		}
		else{
			UserInstance.removeFromRoles(Role.findByName('ROLE_MANAGER'))
		}
		sendMail {
			to UserInstance.username
			from grailsApplication.config.grails.mail.username
			subject "Your account was successfully created!"
			body "Hello ${UserInstance.toString()},\n\nYour account was successfully created!\n\nHere is your password : ${password}\n\n${createLink(absolute:true,uri:'/')}\n\nGood Luck With Your Dreams!".toString()
		}
		flash.message = message(code: 'default.created.message', args: [
			message(code: 'User.label', default: 'User'),
			UserInstance.id
		])
		redirect(action: "show", id: UserInstance.id)
	}

	def edit(Long id) {
		def userInstance = User.get(id)
		if (!userInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'user.label', default: 'User'),
				id
			])
			redirect(action: "list")
			return
		}

		[userInstance: userInstance]
	}

	def editCurrentProfile () {
		def userInstance = User.findByUsername(SecurityUtils.subject.principal)
		if (!userInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'user.label', default: 'User'),
				id
			])
			redirect(action: "list")
			return
		}

		render(view:'edit', model: [userInstance: userInstance])
	}


	def update(Long id, Long version) {
		def userInstance = User.get(id)
		if (!userInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'user.label', default: 'User'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (userInstance.version > version) {
				userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'user.label', default: 'User')] as Object[],
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

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'user.label', default: 'User'),
			userInstance.id
		])
		redirect(action: "show", id: userInstance.id)
	}

	def delete(Long id) {
		def userInstance = User.get(id)
		if (!userInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'user.label', default: 'User'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			userInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'user.label', default: 'User'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'user.label', default: 'User'),
				id
			])
			redirect(action: "show", id: id)
		}
	}

	/**
	 * creates a new user and logs them in
	 * @param username 	the email address of the user
	 * @param firstName	the first name of the user
	 * @param lastName	the last name of the user
	 * @param email		the email of the user
	 * @param passwordHash	the hashed password
	 * @param avatarLocation	the location of the profile image
	 * @param streetAddress1	the address of the user
	 * @param streetAddress2	the address of the user
	 * @param poBox		users PO box
	 * @param dateOfBirth	users date of birth
	 * @param city		current city user lives in
	 * @param state		current state user lives in
	 * @param zipcode	users zipcode
	 * @param isManager	if user is manager or not
	 * @param admin		if user is an administrator
	 */
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
				passwordHash: new Sha256Hash(params.password).toHex(),
				avatarLocation:null,
				streetAddress1:params.streetAddress1,
				streetAddress2:params.streetAddress2,
				poBox:params.poBox,
				dateOfBirth:params.dateOfBirth,
				city:params.city,
				state:params.state,
				zipcode:params.zipCode)
				// Add USER role to new user
				def role = Role.findByName('ROLE_USER')
				user.addToRoles(role)
				if (user.save(flush: true)) {
					// Login user
					def authToken = new UsernamePasswordToken(user.username, params.password)
					SecurityUtils.subject.login(authToken)
					
					def dreamInstance = new Dream(
						name:"Example Dream - Create Your First Dream",
						category:"Character",
						lastUpdated:new Date(),
						notes:"This is the first dream to accomplish on your way to accomplishing many more.",
						percentComplete: 0,
						isShortTerm: true,
						user:User.findByUsername(params.username)
					).save()
					
					new Task (
						name:"Click on the Plus button on the dashboard",
						description:"The Plus button is located next to the right of the Dreamer Dashboard Title",
						percentComplete: 0,
						orderNumber: 1,
						dream:dreamInstance
					).save()
					
					new Task (
						name:"Fill out the form",
						description:"Only the name is required for a new dream",
						percentComplete: 0,
						orderNumber: 2,
						dream:dreamInstance
					).save()
					
					new Task (
						name:"Click the save button",
						description:"",
						percentComplete: 0,
						orderNumber: 3,
						dream:dreamInstance
					).save()
					
					new Task (
						name:"Click the minus button to exit dream creation",
						description:"The minus button is where the plus button was",
						percentComplete: 0,
						orderNumber: 4,
						dream:dreamInstance
					).save()
					
					new Task (
						name:"Add tasks to your new dream",
						description:"Open the accordian and click the plus button to add tasks.",
						percentComplete: 0,
						orderNumber: 5,
						dream:dreamInstance
					).save()
					
					def dreamLong = new Dream(
						name:"Complete 25 Dreams",
						category:"Legacy",
						lastUpdated:new Date(),
						notes:"",
						percentComplete: 0,
						isShortTerm: false,
						user:User.findByUsername(params.username)
					).save()
					
					new Task (
						name:"Complete 5 Dreams",
						description:"",
						percentComplete: 0,
						orderNumber: 1,
						dream:dreamLong
					).save()
					
					new Task (
						name:"Complete 10 Dreams",
						description:"",
						percentComplete: 0,
						orderNumber: 2,
						dream:dreamLong
					).save()
					
					new Task (
						name:"Complete 15 Dreams",
						description:"",
						percentComplete: 0,
						orderNumber: 3,
						dream:dreamLong
					).save()
					
					new Task (
						name:"Complete 20 Dreams",
						description:"",
						percentComplete: 0,
						orderNumber: 4,
						dream:dreamLong
					).save()
					
					new Task (
						name:"Complete 25 Dreams",
						description:"",
						percentComplete: 0,
						orderNumber: 5,
						dream:dreamLong
					).save()
					
					
					
					redirect(controller:'DreamerDashboard', action:'index')
					flash.message = "Account created"
				}
				else {
					redirect(action: 'register')
					flash.message = "Account not created "
				}
			}
		}
	}

	/**
	 * registers a new user
	 * @param username 	the email address of the user
	 * @param firstName	the first name of the user
	 * @param lastName	the last name of the user
	 * @param email		the email of the user
	 * @param passwordHash	the hashed password
	 * @param avatarLocation	the location of the profile image
	 * @param streetAddress1	the address of the user
	 * @param streetAddress2	the address of the user
	 * @param poBox		users PO box
	 * @param dateOfBirth	users date of birth
	 * @param city		current city user lives in
	 * @param state		current state user lives in
	 * @param zipcode	users zipcode
	 * @param isManager	if user is manager or not
	 * @param admin		if user is an administrator
	 */
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


