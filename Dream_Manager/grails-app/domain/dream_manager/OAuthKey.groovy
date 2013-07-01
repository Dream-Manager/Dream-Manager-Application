package dream_manager

class OAuthKey {

	static belongsTo = [user: User]
	
	String oAuthKey
	String provider
	Date dateCreated = new Date()
		
    static constraints = {}
}
