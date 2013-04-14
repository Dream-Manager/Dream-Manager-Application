package dream_manager

import org.apache.shiro.crypto.hash.Sha256Hash
import org.junit.Before

import grails.test.mixin.*
import org.junit.*
import java.security.SecureRandom
import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.AuthenticationException
import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.crypto.hash.Sha256Hash
import org.apache.shiro.subject.Subject
import org.apache.shiro.web.util.SavedRequest
import org.apache.shiro.web.util.WebUtils
import org.apache.shiro.grails.ConfigUtils
import org.apache.shiro.util.ThreadContext
import org.apache.shiro.SecurityUtils

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ManagerToDreamerController)
@Mock([User,ManagerRequest,Role])
class ManagerToDreamerControllerTests {
	@Before
	void before() {
		def shiroSecurityManager
		// Populate User table
		def adminRole = new Role(name: 'ROLE_ADMIN').save(flush: true, failOnError: true)

		// Create the dream manager role
		def managerRole = new Role(name: 'ROLE_MANAGER').save(flush: true, failOnError: true)

		// Create the user role
		def userRole = new Role(name: 'ROLE_USER').save(flush: true, failOnError: true)

		def adminUser = new User(username: "adminuser@gmail.com", passwordHash: new Sha256Hash("password").toHex(), firstName:"James", lastName:"Harris", avatarLocation:null, streetAddress1:null, streetAddress2:null,poBox:null, dateOfBirth:null, city:null, state:null, zipcode:85219, passwordChangeRequiredOnNextLogon:false, isAdmin:true, isManager:true)
		adminUser.save(flush: true, failOnError: true)

		// Add roles to the admin user
		assert adminUser.addToRoles(adminRole).
		addToRoles(managerRole)
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

		def standardUser2 = new User(username: "standarduser2@gmail.com",passwordHash: new Sha256Hash('password').toHex(), firstName:"Joe", lastName:"Smoe", avatarLocation:null, streetAddress1:null, streetAddress2:null,poBox:null, dateOfBirth:null, city:null, state:null, zipcode:85219,isManager:false, passwordChangeRequiredOnNextLogon:false , isAdmin:false, manager:User.get(1), managerConfirmed:true)

		standardUser2.save(flush: true, failOnError: true)

		// Add role to the standard user
		assert standardUser2.addToRoles(userRole)
		.save(flush: true, failOnError: true)
	}

	/*
	 * Tests when a manager trys to claim a user in the correct way.
	 */
	void testClaimDreamer() {
		def shiroSecurityManager
		def subject = [ getPrincipal: { "manageruser@gmail.com" },
			isAuthenticated: { true }
		] as Subject
		ThreadContext.put( ThreadContext.SECURITY_MANAGER_KEY,
				[ getSubject: { subject } ] as SecurityManager )
		SecurityUtils.metaClass.static.getSubject = { subject }

		params.id = 1
		def manager = User.findByUsername(SecurityUtils.subject.principal)
		controller.claimDreamer()
		assertEquals ManagerRequest.findByUser(User.get(1)).requestInitiator, manager
	}
	/*
	 * Tests when a manager tries to claim themself.
	 */
	void testClaimDreamer2() {
		def shiroSecurityManager
		def subject = [ getPrincipal: { "manageruser@gmail.com" },
			isAuthenticated: { true }
		] as Subject
		ThreadContext.put( ThreadContext.SECURITY_MANAGER_KEY,
				[ getSubject: { subject } ] as SecurityManager )
		SecurityUtils.metaClass.static.getSubject = { subject }

		params.id = 2
		def manager = User.findByUsername(SecurityUtils.subject.principal)
		controller.claimDreamer()
		assertEquals ManagerRequest.findByUser(User.get(2)), null
	}
	/*
	 * Tests when a manager tries to claim an already claimed user.(This isn't allowed)
	 */
	void testClaimDreamer3() {
		def shiroSecurityManager
		def subject = [ getPrincipal: { "manageruser@gmail.com" },
			isAuthenticated: { true }
		] as Subject
		ThreadContext.put( ThreadContext.SECURITY_MANAGER_KEY,
				[ getSubject: { subject } ] as SecurityManager )
		SecurityUtils.metaClass.static.getSubject = { subject }

		params.id = 4
		def manager = User.findByUsername(SecurityUtils.subject.principal)
		controller.claimDreamer()
		assertEquals ManagerRequest.findByUser(User.get(4)), null
	}
	/*
	 * Tests when a manager releases a user.
	 */
	void testUnclaimDreamer() {
		def shiroSecurityManager
		def subject = [ getPrincipal: { "adminuser@gmail.com" },
			isAuthenticated: { true }
		] as Subject
		ThreadContext.put( ThreadContext.SECURITY_MANAGER_KEY,
				[ getSubject: { subject } ] as SecurityManager )
		SecurityUtils.metaClass.static.getSubject = { subject }

		params.id = 4
		def manager = User.findByUsername(SecurityUtils.subject.principal)
		controller.unclaimDreamer()
		assertEquals User.get(4).manager, null
	}

	/*
	 * Tests when a dreamer Accepts a relationship.
	 */
	void testAcceptManagerDreamerRelationshipRequest() {
		def shiroSecurityManager
		def subject = [ getPrincipal: { "manageruser@gmail.com" },
			isAuthenticated: { true }
		] as Subject
		ThreadContext.put( ThreadContext.SECURITY_MANAGER_KEY,
				[ getSubject: { subject } ] as SecurityManager )
		SecurityUtils.metaClass.static.getSubject = { subject }

		params.id = 1
		def manager = User.findByUsername(SecurityUtils.subject.principal)
		def managerRequest = new ManagerRequest(requestInitiator:manager, manager:manager,user:User.get(1),requestDate : new Date(),token:new BigInteger(130, new SecureRandom()).toString(32)).save(failOnError:true, flush: true)
		subject = [ getPrincipal: { "adminuser@gmail.com" },
			isAuthenticated: { true }
		] as Subject
		ThreadContext.put( ThreadContext.SECURITY_MANAGER_KEY,
				[ getSubject: { subject } ] as SecurityManager )
		SecurityUtils.metaClass.static.getSubject = { subject }
		controller.acceptManagerDreamerRelationshipRequest()
		assertEquals User.findByUsername(SecurityUtils.subject.principal).manager , manager
	}
	
	/*
	 * Tests when an accept contoller request is called and there is no request for user.
	 */
	void testAcceptManagerDreamerRelationshipRequest2() {
		def shiroSecurityManager
		def subject = [ getPrincipal: { "manageruser@gmail.com" },
			isAuthenticated: { true }
		] as Subject
		ThreadContext.put( ThreadContext.SECURITY_MANAGER_KEY,
				[ getSubject: { subject } ] as SecurityManager )
		SecurityUtils.metaClass.static.getSubject = { subject }

		params.id = 3
		def manager = User.findByUsername(SecurityUtils.subject.principal)
		subject = [ getPrincipal: { "adminuser@gmail.com" },
			isAuthenticated: { true }
		] as Subject
		ThreadContext.put( ThreadContext.SECURITY_MANAGER_KEY,
				[ getSubject: { subject } ] as SecurityManager )
		SecurityUtils.metaClass.static.getSubject = { subject }
		
		controller.acceptManagerDreamerRelationshipRequest()
		assertEquals User.findByUsername(SecurityUtils.subject.principal).manager , null
	}
	/*
	 * Tests when a dreamer Rejects a relationship.
	 */
	void testRejectManagerDreamerRelationshipRequest() {
		def shiroSecurityManager
		def subject = [ getPrincipal: { "manageruser@gmail.com" },
			isAuthenticated: { true }
		] as Subject
		ThreadContext.put( ThreadContext.SECURITY_MANAGER_KEY,
				[ getSubject: { subject } ] as SecurityManager )
		SecurityUtils.metaClass.static.getSubject = { subject }

		params.id = 1
		def manager = User.findByUsername(SecurityUtils.subject.principal)
		def managerRequest = new ManagerRequest(requestInitiator:manager, manager:manager,user:User.get(1),requestDate : new Date(),token:new BigInteger(130, new SecureRandom()).toString(32)).save(failOnError:true, flush: true)
		subject = [ getPrincipal: { "adminuser@gmail.com" },
			isAuthenticated: { true }
		] as Subject
		ThreadContext.put( ThreadContext.SECURITY_MANAGER_KEY,
				[ getSubject: { subject } ] as SecurityManager )
		SecurityUtils.metaClass.static.getSubject = { subject }
		controller.rejectManagerDreamerRelationshipRequest()
		assertEquals ManagerRequest.findByUser(User.findByUsername(SecurityUtils.subject.principal)) , null
	}	
}
