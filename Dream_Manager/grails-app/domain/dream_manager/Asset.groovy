package dream_manager

class Asset {

	String name
	String phoneNumber
	String email
	String address
	String city
	String state
	String zipcode
	String description
	Boolean dreamerViewable = false
	Date validFrom = null
	Date validTo = null
	
	String toString() {
		name
	}
	
    static constraints = {
		name(blank: false, nullable: false, unique: true, size:1..50)
		description(nullable: true, size:0..500)
		email(email: true, nullable: true, size:1..50)
		phoneNumber(nullable: true, phoneNumber: true)
		address(nullable:true)
		city(nullable:true)
		state(nullable:true)
		zipcode (nullable:true, size:5..5, matches:"[0-9]+")
		validFrom(nullable:true)
		validTo(nullable:true)
		
		
    }
}
