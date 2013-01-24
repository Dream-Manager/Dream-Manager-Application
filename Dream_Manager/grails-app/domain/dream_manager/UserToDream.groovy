package dream_manager

class UserToDream {

	static belongsTo = [user:User]
	static hasOne = [dream:Dream]
	
    static constraints = {
    }
}
