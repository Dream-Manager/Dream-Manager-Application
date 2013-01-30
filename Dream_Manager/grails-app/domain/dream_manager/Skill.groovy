package dream_manager

class Skill {

	String description = ""
	
	static belongsTo = [user:User]
	
    static constraints = {
    }
}
