package dream_manager

import java.util.Date;
import org.apache.shiro.crypto.hash.Sha256Hash

@TestFor(DreamController)
@Mock([Dream,User])
class DreamControllerTests {
	
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
		
		def dream = Dream.get(1)
		params.id = dream.id
		params.category = "Emotional"
		
		controller.update()
		assert response.text.contains("Success")
		
		// Testing Jenkins and Barkeep, need pushed change.
	}
}
