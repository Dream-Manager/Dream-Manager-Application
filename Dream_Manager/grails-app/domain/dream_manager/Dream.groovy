package dream_manager

class Dream {
	
	String name
	Date estimatedCompletion
	Date created
	Date lastUpdated
	Date completed = null
	Integer progress = 0
	String notes
	
	String toString() {
		name
	}
	
	// Each Dream is related to a user
	static belongsTo = [user:User]
	
    static constraints = {
		completed nullable: true
		notes nullable: true	
    }
}
