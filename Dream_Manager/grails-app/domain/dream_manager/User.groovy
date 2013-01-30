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
	Date dateOfBirth
	String zipcode
	
	
	
	// Each User has many Dreams
	static hasMany = [userToDream:UserToDream]
    
	static constraints = {
		firstName(blank: false, nullable: false, size:1..20)
		lastName(blank: false, nullable: false, size:1..20)
		email(email: true, blank: false, unique: true, nullable: false, size:1..30)
		password(blank: false, nullable: false)
		avatarLocation(nullable: true)
		streetAddress1(nullable: true)
		streetAddress2(nullable: true)
		poBox(nullable: true)
		city(nullable: true)
		state(nullable: true)
		dateOfBirth(nullable: true)
		zipcode (nullable:true, size:5..5, matches:"[0-9]+")
    }
}
