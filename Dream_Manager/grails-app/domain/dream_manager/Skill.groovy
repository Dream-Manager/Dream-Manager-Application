package dream_manager

class Skill {

	String description = ""
	
	String toString() {
		description
	}
	
	static belongsTo = [user:User]
	
    static constraints = {
    }
}
