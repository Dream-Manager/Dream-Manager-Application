package dreammanager

class Dream {
	
	String description
	Date created
	Date lastUpdated
	Date completed
	int progress
	String notes
	
	// Each Dream is related to a user
	UserToDream userToDream
	
    static constraints = {
		userToDream unique: true
    }
}
