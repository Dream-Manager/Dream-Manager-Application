package dream_manager

/**
 * This filter allows pages to require authentication based on roles. 
 * Will expand potentially to permissions.
 * Currently the logic needs to be reworked. 
 * **/
class SecurityFilters {

    /**
     * Array of controller/action combinations which will be skipped from authentication
     * if the controller and action names match. The action value can also be '*' if it
     * encompasses all actions within the controller.
     */
    static nonAuthenticatedActions = [
            [controller: 'auth', action: 'login'],
			[controller: 'user', action: 'register'],
			[controller: 'user', action: 'signup']
    ]

    /**
     * Array of controller/action combinations that will be authenticated against the user's
     * role. The map also includes the roles which the controller/action pair will match
     * against.
     */
    static authenticatedActions = [ [controller: 'Asset' , action: '*', roles: ['ROLE_ADMIN']] ,
		 [controller: 'dream', action: '*', roles: ['ROLE_ADMIN']],
		 [controller: 'dreamerDashboard', action: '*', roles: ['ROLE_USER']],
		 [controller: 'dreamToTemplate', action: '*', roles: ['ROLE_ADMIN']] ,
		 [controller: 'skill', action: '*', roles: ['ROLE_ADMIN']],
		 [controller: 'template', action: '*', roles: ['ROLE_ADMIN']],
		 [controller: 'api', action: '*', roles: ['ROLE_ADMIN']],
		 [controller: 'asset', action: '*', roles: ['ROLE_ADMIN']],
		 [controller: 'user', action: '*', roles: ['ROLE_ADMIN']],
		 [controller: 'userDreamQuestions', action: '*', roles: ['ROLE_ADMIN']],
		 [controller: 'managerToDreamer', action: '*', roles: ['ROLE_USER']]
	]

    def filters = {

        all(controller: '*', action: '*') {
            before = {

                // Determine if the controller/action belongs is not to be authenticated
                def needsAuth = !nonAuthenticatedActions.find {
                    (it.controller == controllerName) &&
                            ((it.action == '*') || (it.action == actionName))
                }

                if (needsAuth) {

                    // Get the map within the authenticated actions which pertain to the current
                    // controller and view.
                    def authRoles = authenticatedActions.find {
                        (it.controller == controllerName) &&
                                ((it.action == '*') || (it.action == actionName))
                    }

                    if (authRoles) {

                         //Perform the access control for each of the roles provided in the authRoles
                        accessControl {
                            authRoles.roles.each { roleName ->
                                role(roleName)
                            }
                        }
						
                    }

                    // Skip authentication if the authRoles was not found
                    else {
                        return true
                    }
                }

                // Skip authentication if no auth is needed
                else {
                    return true
                }
            }
        }

    }
}