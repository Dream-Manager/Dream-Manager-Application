package dream_manager
import java.util.Date;
import org.apache.shiro.crypto.hash.Sha256Hash
import grails.test.mixin.*
import org.junit.*

@TestFor(DreamController)
class DreamControllerTests {

	@Before
	void before() {
		Dream.findAll().delete()
		User.findAll().delete()

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
				
		// Populate Dream table
		new Dream (
			name:"Test Dream #1",
			category:"Adventure",
			lastUpdated:new Date(),
			notes:"Example Notes",
			user:User.findByUsername("testuser@gmail.com")
		).save()
	}	
	
	void testUpdate () {
		def controller = new DreamController()
		controller.metaClass.getParams = {->
				return ["id":1]
		}
		controller.update()
		def response = controller.response.contentAsString
		assertTrue response.contains("Success")
	}
}
