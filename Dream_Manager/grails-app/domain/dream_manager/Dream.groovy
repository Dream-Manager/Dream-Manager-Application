package dream_manager

import grails.converters.*

class Dream {
	
	String name
	String category
	Date estimatedCompletion = null
	Boolean isShortTerm = true
	Date created = new Date()
	Date lastUpdated
	Date completed = null
	String notes
	
	String toString() {
		name
	}
	
	// Each Dream is related to a user
	static belongsTo = [user:User]
	
	// Each Dream can have many Tasks
	static hasMany = [tasks:DreamTask]
	
    static constraints = {
		completed nullable: true
		estimatedCompletion nullable: true
		notes nullable: true	
		category inList: ["Adventure","Character","Creative","Emotional","Financial","Intellectual","Legacy","Material","Physical","Professional","Psychological","Spiritual"]
    }
	
	def ajaxSearchDreams = {
		def dreams = Dream.withCriteria {
			ilike 'name', '%' + params.term + '%'
		}
		render dreams as JSON		
	}
}
