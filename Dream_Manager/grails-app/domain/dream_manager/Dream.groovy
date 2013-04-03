package dream_manager

class Dream {
	
	String name
	String category
	Date estimatedCompletion = null
	Boolean isShortTerm = true
	Date created = new Date()
	Date lastUpdated
	Date completed = null
	String notes
	int percentComplete = 0
	Boolean isComplete = false
	
	String toString() {
		name
	}
	
	// Each Dream is related to a user
	static belongsTo = [user:User]
	
	// Each Dream can have many Tasks
	static hasMany = [tasks:DreamTask]
	
    static constraints = {
		completed nullable: true
		estimatedCompletion nullable: true
		notes nullable: true	
		percentComplete nullable: true
		category inList: ["Adventure","Character","Creative","Emotional","Financial","Intellectual","Legacy","Material","Physical","Professional","Psychological","Spiritual"]
    }
}
