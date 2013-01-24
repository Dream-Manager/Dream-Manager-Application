package dream_manager

class Asset {

	String name
	Date validFrom = null
	Date validTo = null
	
    static constraints = {
		validFrom nullable:true
		validTo nullable:true
    }
}
