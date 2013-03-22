import org.apache.shiro.crypto.hash.Sha256Hash
import dream_manager.*

class BootStrap {

	def init = { servletContext ->

		// Create the admin role
		def adminRole = new Role(name: 'ROLE_ADMIN').save(flush: true, failOnError: true)

		// Create the dream manager role
		def managerRole = new Role(name: 'ROLE_MANAGER').save(flush: true, failOnError: true)

		// Create the user role
		def userRole = new Role(name: 'ROLE_USER').save(flush: true, failOnError: true)

		def adminUser = new User(username: "adminuser@gmail.com", passwordHash: new Sha256Hash("password").toHex(), firstName:"James", lastName:"HARRIS", avatarLocation:null, streetAddress1:null, streetAddress2:null,poBox:null, dateOfBirth:null, city:null, state:null, zipcode:85219,isManager:false, passwordChangeRequiredOnNextLogon:false, isAdmin:true, confirmedByManager:true, confirmedByDreamer:true)
		adminUser.save(flush: true, failOnError: true)

		// Add roles to the admin user
		assert adminUser.addToRoles(adminRole)
		.addToRoles(userRole)
		.save(flush: true, failOnError: true)


		def managerUser = new User(username: "manageruser@gmail.com", passwordHash: new Sha256Hash("password").toHex(), firstName:"Rob", lastName:"Miller", avatarLocation:null, streetAddress1:null, streetAddress2:null,poBox:null, dateOfBirth:null, city:null, state:null, zipcode:85219,isManager:true , passwordChangeRequiredOnNextLogon:false , isAdmin:false)
		managerUser.save(flush: true, failOnError: true)

		// Add roles to the manager user
		assert managerUser.addToRoles(managerRole)
		.addToRoles(userRole)
		.save(flush: true, failOnError: true)

		// Create an standard user

		def standardUser = new User(username: "standarduser@gmail.com",passwordHash: new Sha256Hash('password').toHex(), firstName:"Joe", lastName:"Smoe", avatarLocation:null, streetAddress1:null, streetAddress2:null,poBox:null, dateOfBirth:null, city:null, state:null, zipcode:85219,isManager:false, passwordChangeRequiredOnNextLogon:false , isAdmin:false)

		standardUser.save(flush: true, failOnError: true)

		// Add role to the standard user
		assert standardUser.addToRoles(userRole)
		.save(flush: true, failOnError: true)


	}

	def destroy = {
	}
}