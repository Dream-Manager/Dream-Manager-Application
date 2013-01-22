package dreammanager

class Dream {
	
	String description
	Date created = Date.toTimestamp()
	Date lastUpdated = Date.toTimestamp()
	Date completed = null
	int progress = 0
	String notes
	
	// Each Dream is related to a user
	UserToDream userToDream
	
    static constraints = {
		userToDream unique: true
		completed nullable: true
		notes nullable: true	
    }
}
