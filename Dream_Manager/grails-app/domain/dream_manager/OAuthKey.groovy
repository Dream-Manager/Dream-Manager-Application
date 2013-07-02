package dream_manager

/*
 * sessionKey/accessToken pairs for OAuth services as provided by the OAuth plugin.
 * See http://aiten.github.io/grails-oauth-scribe/guide/ for reference.
 * 
 * Session variables are saved through User/persistSesisonKeys after being retrieved,
 * and reloaded from this table on Dashboard/Index.
 */
class OAuthKey {
	static belongsTo = [user: User]
	
	String sessionKey
	String accessKey
	String accessSecret
	String provider
	Date dateCreated = new Date()
	
	static mapping = {
		accessKey sqlType: 'blob'
		accessSecret sqlType: 'blob'
	}
}