import org.apache.shiro.crypto.hash.Sha256Hash

class BootStrap {
	
    def init = { servletContext ->
        def user = new ShiroUser(username: "Admin", passwordHash: new Sha256Hash("password").toHex())
        user.addToPermissions("*:*")
        user.save()
    }

    def destroy = {
    }
}