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

		def adminUser = new User(username: "adminuser@gmail.com", passwordHash: new Sha256Hash("password").toHex(), firstName:"James", lastName:"Harris", avatarLocation:null, streetAddress1:null, streetAddress2:null,poBox:null, dateOfBirth:null, city:null, state:null, zipcode:85219,isManager:false, passwordChangeRequiredOnNextLogon:false, isAdmin:true)
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
		
		def testUser = new User(username: "dreammanager.noreply@gmail.com",passwordHash: new Sha256Hash('password').toHex(), firstName:"Kevin", lastName:"Gary", avatarLocation:null, streetAddress1:"123 Fake Street", streetAddress2:null,poBox:null, dateOfBirth:null, city:"Mesa", state:"AZ", zipcode:85212,isManager:false, passwordChangeRequiredOnNextLogon:false , isAdmin:false)
		
				testUser.save(flush: true, failOnError: true)
		
				// Add role to the standard user
				assert testUser.addToRoles(userRole)
				.save(flush: true, failOnError: true)
				
				new Dream (
					name:"Climb Mount Everest",
					category:"Adventure",
					lastUpdated:new Date(),
					notes:"Need to buy hiking boots",
					percentComplete: 30,
					estimatedCompletion: "05/20/2014",
					isShortTerm: false,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				
				new Dream (
					name:"Get a Bigger Baseball Bat",
					category:"Material",
					lastUpdated:new Date(),
					notes:"Make sure it has a Yankees logo",
					percentComplete: 15,
					estimatedCompletion: "05/02/2013",
					isShortTerm: true,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				
				new Dream (
					name:"Get Permission to Use Bat at work",
					category:"Professional",
					lastUpdated:new Date(),
					notes:"Students are really getting on my nerves...",
					percentComplete: 5,
					estimatedCompletion: "05/1/2013",
					isShortTerm: true,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				
				new Dream (
					name:"Push Lazy Students to Finish Projects",
					category:"Professional",
					lastUpdated:new Date(),
					notes:"Yell at students more",
					percentComplete: 80,
					estimatedCompletion: "05/2/2013",
					isShortTerm: true,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				
				new Dream (
					name:"Take a Women's Studies Class",
					category:"Intellectual",
					lastUpdated:new Date(),
					notes:"Get more in touch with my feminine side",
					percentComplete: 50,
					estimatedCompletion: "06/25/2013",
					isShortTerm: true,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				
				new Dream (
					name:"Complete an Anger Management Course",
					category:"Emotional",
					lastUpdated:new Date(),
					notes:"Stop Beating My Students with said bat",
					percentComplete: 60,
					estimatedCompletion: "03/25/2014",
					isShortTerm: false,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				


	}

	def destroy = {
	}
}