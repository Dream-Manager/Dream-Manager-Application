package dream_manager
import org.hibernate.Hibernate

class TaskService {

    def serviceMethod() {

    }
	
	def getMaxOrder(long dream){
		def taskList = Task.withCriteria{eq('dream', Dream.findById(dream))}
		taskList.size()+1
	}
	
	/**
	 * Sets the order on a set of tasks
	 * @param	taskIDs	ArrayList of task IDs in order to be set
	 */
	def sortIDs(taskIDs){
				
		def tasksToUpdate = Task.createCriteria().list{ 
			'in'('id', taskIDs.collect{ it.toLong() } ) 
		} 
		Hibernate.initialize(tasksToUpdate)
		
		// Remove once working
		return tasksToUpdate?.size()
		
		for(int i = 0; i<taskIDs.size(); i++){
			Task.get(taskIDs[i]).orderNumber=i+1
		}
		
	}
		
	
	
}
