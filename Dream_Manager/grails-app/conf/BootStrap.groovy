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
		
		
		//Our Test user for demonstration purposes
		def testUser = new User(username: "dreammanager.noreply@gmail.com",passwordHash: new Sha256Hash('password').toHex(), firstName:"Kevin", lastName:"Gary", avatarLocation:null, streetAddress1:"123 Fake Street", streetAddress2:null,poBox:null, dateOfBirth:null, city:"Mesa", state:"AZ", zipcode:85212,isManager:false, passwordChangeRequiredOnNextLogon:false , isAdmin:false)
		
				testUser.save(flush: true, failOnError: true)
		
				// Add role to the standard user
				assert testUser.addToRoles(userRole)
				.save(flush: true, failOnError: true)
				
				//Climb Mount Everest Dream
				new Dream (
					name:"Climb Mount Everest",
					category:"Adventure",
					lastUpdated:new Date(),
					notes:"Need to buy hiking boots",
					estimatedCompletion: "05/20/2014",
					percentComplete: 42,
					isShortTerm: false,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				
				new Task (
					name:"Buy Hiking Boots",
					description:"Sale on boots next weekend",
					percentComplete: 45,
					estimatedCompletion: "05/10/2014",
					dream:Dream.findByName("Climb Mount Everest")
				).save()
				
				new Task (
					name:"Find a Guide",
					description:"",
					percentComplete: 20,
					estimatedCompletion: "03/20/2014",
					dream:Dream.findByName("Climb Mount Everest")
				).save()
				
				new Task (
					name:"Build up Cardio",
					description:"Be able to run 10 miles",
					percentComplete: 60,
					estimatedCompletion: "04/10/2014",
					dream:Dream.findByName("Climb Mount Everest")
				).save()
				
				//But a new bat
				new Dream (
					name:"Buy a new Baseball Bat",
					category:"Material",
					lastUpdated:new Date(),
					notes:"Make sure it has a Yankees logo",
					estimatedCompletion: "07/02/2013",
					percentComplete: 83,
					isShortTerm: true,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				
				new Task (
					name:"Save up 100 Dollars",
					description:"Has to be a nice bat.",
					percentComplete: 65,
					estimatedCompletion: "06/3/2013",
					dream:Dream.findByName("Buy a new Baseball Bat")
				).save()
				
				new Task (
					name:"Find a bat with a Yankees Logo on it",
					description:"My favorite!!!",
					percentComplete: 100,
					estimatedCompletion: "06/1/2013",
					dream:Dream.findByName("Buy a new Baseball Bat")
				).save()

				new Dream (
					name:"Get Permission to Use Bat at work",
					category:"Professional",
					lastUpdated:new Date(),
					notes:"Students are really getting on my nerves...",
					estimatedCompletion: "06/20/2013",
					percentComplete: 25,
					isShortTerm: true,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				
				new Task (
					name:"Ask boss if I can use bat on students",
					description:"Why else would I need it.",
					percentComplete: 45,
					estimatedCompletion: "05/3/2013",
					dream:Dream.findByName("Get Permission to Use Bat at work")
				).save()
				
				new Task (
					name:"Create speech for when boss turns me down",
					description:"Lets be real, he is going to turn me down.",
					percentComplete: 30,
					estimatedCompletion: "05/1/2013",
					dream:Dream.findByName("Get Permission to Use Bat at work")
				).save()
				
				new Task (
					name:"Go above the bosses head",
					description:"",
					percentComplete: 0,
					estimatedCompletion: "05/5/2013",
					dream:Dream.findByName("Get Permission to Use Bat at work")
				).save()
				
				new Dream (
					name:"Push Lazy Students to Finish Projects",
					category:"Professional",
					lastUpdated:new Date(),
					notes:"Lets face it, students are lazy...",
					estimatedCompletion: "05/2/2013",
					percentComplete: 45,
					isShortTerm: true,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				
				new Task (
					name:"Yell at students more",
					description:"Students love a good yelling.",
					percentComplete: 95,
					estimatedCompletion: "04/26/2013",
					dream:Dream.findByName("Push Lazy Students to Finish Projects")
				).save()
				
				new Task (
					name:"Tell James to be stop talking",
					description:"That James sure can talk.",
					percentComplete: 40,
					estimatedCompletion: "04/28/2013",
					dream:Dream.findByName("Push Lazy Students to Finish Projects")
				).save()
				
				new Task (
					name:"Threaten to beat students with the bat",
					description:"",
					percentComplete: 0,
					estimatedCompletion: "04/30/2013",
					dream:Dream.findByName("Push Lazy Students to Finish Projects")
				).save()
				
				new Dream (
					name:"Go to a Yankees Game!!!",
					category:"Spiritual",
					lastUpdated:new Date(),
					notes:"Witness my favorite team in action.",
					estimatedCompletion: "06/25/2014",
					percentComplete: 83,
					isShortTerm: false,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				
				new Task (
					name:"Save money to afford premium tickets",
					description:"",
					percentComplete: 50,
					estimatedCompletion: "04/30/2014",
					dream:Dream.findByName("Go to a Yankees Game!!!")
				).save()
				
				new Task (
					name:"Buy a Jeter Jersey",
					description:"My Hero",
					percentComplete: 100,
					estimatedCompletion: "04/30/2013",
					dream:Dream.findByName("Go to a Yankees Game!!!")
				).save()
				
				new Task (
					name:"Boo the Red Sox at Yankee Stadium",
					description:"Red Sox suck!!!",
					percentComplete: 100,
					estimatedCompletion: "04/30/2014",
					dream:Dream.findByName("Go to a Yankees Game!!!")
				).save()
				
				new Dream (
					name:"Take a Women's Studies Class",
					category:"Intellectual",
					lastUpdated:new Date(),
					notes:"Get more in touch with my feminine side",
					percentComplete: 10,
					estimatedCompletion: "06/25/2013",
					isShortTerm: true,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				
				new Dream (
					name:"Complete an Anger Management Course",
					category:"Emotional",
					lastUpdated:new Date(),
					notes:"Stop Beating My Students with said bat",
					percentComplete: 20,
					estimatedCompletion: "03/25/2014",
					isShortTerm: false,
					user:User.findByUsername("dreammanager.noreply@gmail.com")
				).save()
				


	}

	def destroy = {
	}
}