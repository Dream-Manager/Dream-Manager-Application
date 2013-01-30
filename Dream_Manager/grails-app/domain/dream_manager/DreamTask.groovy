package dream_manager

class DreamTask {
	
	String name
	Date estimatedCompletion
	Integer size
	Boolean completed = false
	String description
	
	// Each DreamTask is related to a Dream
	static belongsTo = [dream:Dream]

	String toString() {
		name
	}
	
    static constraints = {
    }
}
