package dream_manager
import grails.test.mixin.*
import org.junit.*
import dream_manager.User;

@TestFor(User)
class UserTests {

	@Before
	void before() {
		// Populate User table
		new User (
			firstName:"John",
			lastName:"Smith",
			password:"1234567890",
			email:"john@smith.com").save()
	}
	
	@After
	void after() {
		// Clear User records
		User.createCriteria().list{}*.delete()
	}

	// Test toString() method
    void testToString() {
		assertEquals("John Smith",User.get(1).toString())
    }
}
