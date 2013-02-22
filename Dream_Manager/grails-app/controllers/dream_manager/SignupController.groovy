
package dream_manager

import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.SecurityUtils
import org.apache.shiro.crypto.hash.Sha256Hash

class SignupController {
	def shiroSecurityService

	def index() {
		User user = new User()
		[user: user]
	}

	def register() {

		// Check to see if the username already exists
		def user = User.findByUsername(params.username)
		if (user) {
			flash.message = "User already exists with the username '${params.username}'"
			render('index')
		}

		// User doesn't exist with username. Let's create one
		else {

			// Make sure the passwords match
			if (params.password != params.confirmPassowrd) {
				flash.message = "Passwords do not match"
				render('index')
			}

			// Passwords match. Let's attempt to save the user
			else {
				// Create user
				user = new User(
						username: params.username,
						passwordHash: new Sha256Hash(params.password).toHex(),
						firstName:params.firstName,
						lastName:params.lastName,
						email:params.username,
						avatarLocation:null,
						streetAddress1:null,
						streetAddress2:null,
						poBox:null,
						dateOfBirth:null,
						city:null,
						state:null,
						zipcode:85219,
						isManager:false,
						admin:false
						)
				user.addToPermissions("*:*")

				 if (user.save()) {
				 // Add USER role to new user
				 //user.addToRoles(Role.findByName('ROLE_USER'))
				 // Login user
					 render "SAVE"
				 def authToken = new UsernamePasswordToken(user.username, params.password)
				 SecurityUtils.subject.login(authToken)
				 redirect(controller: 'User', action: 'index')
				 }
				 else {
					 redirect(controller: 'Signup', action: 'index')
				 }
			}
		}
	}
}