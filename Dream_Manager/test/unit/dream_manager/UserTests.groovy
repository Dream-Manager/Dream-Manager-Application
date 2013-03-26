package dream_manager
import grails.test.mixin.*
import org.apache.shiro.crypto.hash.Sha256Hash
import org.junit.*
import dream_manager.User;

@TestFor(User)
class UserTests {

	@Before
	void before() {
		/*
		// Delete any extra records
		User.findAll().delete()

		// Populate User table
		new User (
				username: "adminuser@gmail.com",
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
				isManager:false ).save()
		*/
	}

	// Test toString() method
	void testToString() {
		//assertEquals("John Smith",User.get(1).toString())
	}
}
