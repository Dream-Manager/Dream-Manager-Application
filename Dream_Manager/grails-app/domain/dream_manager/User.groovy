package dream_manager

import java.util.Date;

class User {
	String username
	String passwordHash
	String firstName
	String lastName
	String avatarLocation
	String streetAddress1
	String streetAddress2
	String poBox
	String city
	String state
	Date dateOfBirth
	String zipcode
	Date dateCreated
	Date lastUpdated
	User manager
	boolean managerConfirmed = false
	boolean isManager = false
	boolean isAdmin = false
	Boolean passwordChangeRequiredOnNextLogon = false
	Boolean nagToGetDreamManager = true

	/**
	 * Returns a String containing the user's full name.
	 * @return      the firstName + ' ' + lastName
	 */
	@Override
	String toString() {
		firstName + " " + lastName
	}

	// Each User has many Dreams, Skills
	static hasMany = [
		dreams:Dream, 
		skills:Skill, 
		keys: OAuthKey, 
		roles: Role, 
		permissions: String
	]

	static constraints = {
		username(email: true, blank: false, unique: true, nullable: false, size:1..50)
		firstName(blank: false, nullable: false, size:1..20)
		lastName(blank: false, nullable: false, size:1..20)
		avatarLocation(nullable: true)
		streetAddress1(nullable: true)
		streetAddress2(nullable: true)
		poBox(nullable: true)
		dateOfBirth(nullable: true)
		city(nullable: true)
		state(inList: [
			"AL",
			"AK",
			"AZ",
			"AR",
			"CA",
			"CO",
			"CT",
			"DE",
			"FL",
			"GA",
			"HI",
			"ID",
			"IL",
			"IN",
			"IA",
			"KS",
			"KY",
			"LA",
			"ME",
			"MD",
			"MA",
			"MI",
			"MN",
			"MS",
			"MO",
			"MT",
			"NE",
			"NV",
			"NH",
			"NJ",
			"NM",
			"NY",
			"NC",
			"ND",
			"OH",
			"OK",
			"OR",
			"PA",
			"RI",
			"SC",
			"SD",
			"TN",
			"TX",
			"UT",
			"VT",
			"VA",
			"WA",
			"WV",
			"WI",
			"WY"
		], nullable: true)
		zipcode (nullable:true, size:5..5, matches:"[0-9]+")
		isManager(nullable: true)
		passwordHash(display:false)
		passwordChangeRequiredOnNextLogon(nullable: true)

	}

	static mapping = {
		cache true
		roles cache: true
		permissions cache: true
	}
}

