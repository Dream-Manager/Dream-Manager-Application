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
	 * @param taskIDs array of task ids
	 */
	def sortIDs(taskIDs){
		
		def taskToUpdate = Task.createCriteria().list{'in'("id",taskIDs)}
		Hibernate.initialize(taskToUpdate)
		for(int i = 0; i<taskIDs.size(); i++){
			Task.get(taskIDs[i]).orderNumber=i+1
		}
		
	}
		
	
	
}
