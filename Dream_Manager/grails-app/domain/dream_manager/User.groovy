package dream_manager

class User {

	String firstName
	String lastName
	String email
	String password
	String avatarLocation
	String streetAddress1
	String streetAddress2
	String poBox
	String city
	String state
	int zipcode
	
	
	
	// Each User has many Dreams
	static hasMany = [userToDream:UserToDream]
    
	static constraints = {
    }
}
