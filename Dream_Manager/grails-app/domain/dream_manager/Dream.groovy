package dream_manager

class Dream {
	
	String name
	String category
	Date estimatedCompletion
	Boolean isShortTerm = true
	Date created
	Date lastUpdated
	Date completed = null
	String notes
	
	String toString() {
		name
	}
	
	// Each Dream is related to a user
	static belongsTo = [user:User]
	
	// Each Dream can have many Tasks
	static hasMany = [tasks:DreamTask]
	
    static constraints = {
		completed nullable: true
		notes nullable: true	
    }
}
