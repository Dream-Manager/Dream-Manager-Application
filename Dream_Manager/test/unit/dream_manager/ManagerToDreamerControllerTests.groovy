package dream_manager

import org.apache.shiro.crypto.hash.Sha256Hash
import org.junit.Before

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ManagerToDreamerController)
@Mock([User,ManagerRequest])
class ManagerToDreamerControllerTests {
	@Before
	void before() {
		// Populate User table
		new User (
				username: "testuser@gmail.com",
				passwordHash: new Sha256Hash("password").toHex(),
				firstName:"John",
				lastName:"Smith",
				avatarLocation:null,
				streetAddress1:null,
				streetAddress2:null,
				poBox:null,
				dateOfBirth:null,
				city:null,
				state:null,
				zipcode:85219,
				isManager:false
				).save()
	}


	void testClaimDreamer() {
	}
}
