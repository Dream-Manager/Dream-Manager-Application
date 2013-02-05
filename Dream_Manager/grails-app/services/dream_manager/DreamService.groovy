package dream_manager
import org.hibernate.Hibernate

class DreamService {

	def serviceMethod() {
	}

	def dreamTaskSearch(boolean completed, User currentuser){
	}
	/**
	 * Updates a dreams completion status to be based on the tasks it has if it has any.
	 * @param The id of the dream to be updated.
	 *
	 */
	def markCompletionBasedOnTasks (id)  {
		Hibernate.initialize(Dream)
		def dreamToUpdate = Dream.get(id)
		def totalPercent = 0
		each(task: dreamToUpdate.getTasks()){ totalPercent += task.percentComplete }
		totalPercent /= dreamToUpdate.tasks.size()
		dreamToUpdate.percentComplete = totalPercent
		dreamToUpdate.save(flush:true)
	}
}
