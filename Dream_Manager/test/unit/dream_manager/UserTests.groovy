package dream_manager
import grails.test.mixin.*
import org.junit.*
import dream_manager.User;

@TestFor(User)
class UserTests {
	
	@Before
	void before() {
		// Delete any extra records
		User.createCriteria().list{}*.delete()
		
		// Populate User table
		new User (
			firstName:"John",
			lastName:"Smith",
			password:"1234567890",
			email:"john@smith.com").save()
	}

	// Test toString() method
    void testToString() {
		assertEquals("John Smith",User.get(1).toString())
    }
}
