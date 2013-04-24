package dream_manager

import java.util.Date;
import org.apache.shiro.crypto.hash.Sha256Hash
import org.apache.shiro.subject.Subject
import org.apache.shiro.crypto.hash.Sha256Hash
import org.junit.Before
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
		/*
		def dream = Dream.get(1)
		params.id = dream.id
		params.category = "Emotional"
		
		controller.update()
		assert response.text.contains("Success")
		*/
	}

	void testShorttermDreams()
	{
		def shiroSecurityManager
		
		def subject = [ getPrincipal: { "testuser@gmail.com" },
			isAuthenticated: { true }] as Subject
		ThreadContext.put( ThreadContext.SECURITY_MANAGER_KEY,
				[ getSubject: { subject } ] as SecurityManager )
		SecurityUtils.metaClass.static.getSubject = { subject }
		
		controller.shorttermDreams
		assert model.dreams == null
		assert model.dreams(name:"Swimming",category:"Physical",user:User.findByUsername("testuser@gmail.com"))

		
	}
	void testLongtermDreams ()
	{
		def shiroSecurityManager
		
		def subject = [ getPrincipal: { "testuser@gmail.com" },
			isAuthenticated: { true }] as Subject
		ThreadContext.put( ThreadContext.SECURITY_MANAGER_KEY,
				[ getSubject: { subject } ] as SecurityManager )
		SecurityUtils.metaClass.static.getSubject = { subject }
		
		controller.longtermDreams
		assert model.dreams == null

	}
	
}
