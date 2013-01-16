package dreammanager

class User {

	String firstName
	String lastName
	String email
	String avatarLocation
	
	// Each User has many Dreams
	static hasMany = [userToDream:UserToDream]
    
	static constraints = {
    }
}
