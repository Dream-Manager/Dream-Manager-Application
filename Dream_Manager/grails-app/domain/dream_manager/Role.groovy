package dream_manager

import java.util.Date;

class Role {
    String name
	String description
	Date dateCreated
	Date lastUpdated

    static hasMany = [ users: User, permissions: String ]
    static belongsTo = User

    static constraints = {
        name(nullable: false, blank: false, unique: true)
		description(nullable: true)
    }
	
	static mapping = {
		cache true
		users cache: true
		permissions cache: true
	}
	/** Overrides the to string method so 
	 * that the name of the role is returned.*/
	@Override
	String toString() {
		name
	}
}
