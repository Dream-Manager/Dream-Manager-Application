package dream_manager

import java.util.Date;

class Task {

    String name
	Date estimatedCompletion
	Boolean completed = false
	int percentComplete = 0
	String description
	int orderNumber
	
	// Each DreamTask is related to a Dream
	static belongsTo = [dream:Dream]

	String toString() {
		name
	}
	
    static constraints = {
		description nullable: true
		estimatedCompletion nullable: true
		
    }
}
