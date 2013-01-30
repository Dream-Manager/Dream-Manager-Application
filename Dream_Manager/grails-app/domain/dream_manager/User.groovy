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
	
	
	
	// Each User has many Dreams, Skills
	static hasMany = [dream:Dream, skill:Skill]
	
	// Each User has one manager
	static belongsTo = [manager: User]
	
	static constraints = {
		manager nullable: true
    }
}
