package dream_manager

class Dream {
	
	String description
	Date created
	Date lastUpdated
	Date completed = null
	int progress = 0
	String notes
	
	// Each Dream is related to a user
	static belongsTo = [user:User]
	
    static constraints = {
		completed nullable: true
		notes nullable: true	
    }
}
