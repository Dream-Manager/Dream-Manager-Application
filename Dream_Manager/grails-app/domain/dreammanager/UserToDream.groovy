package dreammanager

class UserToDream {

	static belongsTo = [user:User]
	static hasOne = [dream:Dream]
	
    static constraints = {
    }
}
