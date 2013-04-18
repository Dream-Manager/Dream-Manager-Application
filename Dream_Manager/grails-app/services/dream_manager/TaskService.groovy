package dream_manager

class TaskService {

    def serviceMethod() {

    }
	
	def getMaxOrder(int dream){
		def taskList = Task.withCriteria{eq('dream', Dream.findById(dream))}
		taskList.size()+1
	}
	
	
}
