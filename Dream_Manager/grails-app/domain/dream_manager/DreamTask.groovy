package dream_manager

class DreamTask {
	
	String name
	Date estimatedCompletion
	Boolean completed = false
	int percentComplete = 0
	String description
	
	// Each DreamTask is related to a Dream
	static belongsTo = [dream:Dream]

	String toString() {
		name
	}
	
    static constraints = {
		name nullable: false
		description nullable: true
		estimatedCompletion nullable: true
		
    }
}
