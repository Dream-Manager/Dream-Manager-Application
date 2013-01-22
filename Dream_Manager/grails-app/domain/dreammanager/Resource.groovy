package dreammanager

class Resource {

	String name
	Date validFrom
	Date validTo
	
	
    static constraints = {
		validFrom nullable:true
		validTo nullable:true
    }
}
