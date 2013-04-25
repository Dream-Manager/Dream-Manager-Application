package dream_manager;

/**
 * This Class is used to represent the request made by either a manager
 * of dreamer to create a manager dreamer relation. The ManagerToDreamerController
 * handles all of these requests.
 * @author James
 *
 */
public class ManagerRequest extends PasswordResetRequest {
	User manager
	User requestInitiator
}
