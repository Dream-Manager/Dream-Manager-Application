package dream_manager

class OAuthKey {

	static belongsTo = [user: User]
	
	String sessionKey
	String accessKey
	String provider
	Date dateCreated = new Date()
}
