import org.apache.shiro.crypto.hash.Sha256Hash
import dream_manager.*

class BootStrap {
	
    def init = { servletContext ->
        def user = new User(username: "adminuser@gmail.com", passwordHash: new Sha256Hash("password").toHex(), firstName:"James", lastName:"HARRIS", email:"adminuser@gmail.com", password:"password", confirmPassword:"password", avatarLocation:null, streetAddress1:null, streetAddress2:null,poBox:null, dateOfBirth:null, city:null, state:null, zipcode:85219,isManager:false  )
        user.addToPermissions("*:*")
        user.save()
    }

    def destroy = {
    }
}