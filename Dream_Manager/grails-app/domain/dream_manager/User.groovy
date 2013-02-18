package dream_manager

class User {

	String firstName
	String lastName
	String email
	String password
	String confirmPassword
	String avatarLocation
	String streetAddress1
	String streetAddress2
	String poBox
	String city
	String state
	Date dateOfBirth
	String zipcode
	boolean isManager = false
	
	/**
	 * Returns a String containing the user's full name.
	 * @return      the firstName + ' ' + lastName
	 */
	String toString() {
		firstName + " " + lastName
	}
	
	// Each User has many Dreams, Skills
	static hasMany = [dreams:Dream, skills:Skill]
	
	// Each User has one manager
	static belongsTo = [manager:User]
	
	static constraints = {
		firstName(blank: false, nullable: false, size:1..20)
		lastName(blank: false, nullable: false, size:1..20)
		email(email: true, blank: false, unique: true, nullable: false, size:1..50)
		password(password: true, blank: false, nullable: false, size:6..20)
		confirmPassword(password: true, size:6..20, nullable: false, blank: false, validator: {val, obj ->obj.properties['password'] == val})
		avatarLocation(nullable: true)
		streetAddress1(nullable: true)
		streetAddress2(nullable: true)
		poBox(nullable: true)
		dateOfBirth(nullable: true)
		city(nullable: true)
		state(inList: ["AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"], nullable: true)
		zipcode (nullable:true, size:5..5, matches:"[0-9]+")
		manager(nullable: true)
		
    }
}
