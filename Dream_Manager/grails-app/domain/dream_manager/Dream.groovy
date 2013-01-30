package dream_manager

class Dream {
	
	String name
	Date estimatedCompletion
	Date created
	Date lastUpdated
	Date completed = null
	Integer progress = 0
	String notes
	
	// Each Dream is related to a user
	UserToDream userToDream
	
    static constraints = {
		userToDream unique: true
		completed nullable: true
		notes nullable: true	
    }
}
