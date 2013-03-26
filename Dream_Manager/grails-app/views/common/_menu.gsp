<a href="#" id="headerMenuButton">Menu</a>
<ul id="headerMenu" style="display: none;" class="popup">
	<li><g:link controller="user" action="editCurrentProfile">Account Settings</g:link></li>
	<dreamManager:hasManager>
		<li class="ui-state-disabled"><a href="#">Ask Dream Manager</a></li>
		<li><g:link controller="managerToDreamer" action="removeManager"
				onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Remove Manager</g:link></li>
	</dreamManager:hasManager>
	<dreamManager:hasNoManager>
		<dreamManager:currentUserHasRequest>
			<dreamManager:currentUserInitiatedRequest>
				<li><g:link controller="managerToDreamer"
						action="rejectManagerDreamerRelationshipRequest"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Cancel Request</g:link></li>
			</dreamManager:currentUserInitiatedRequest>
			<dreamManager:currentUserNotInitiatedRequest>
				<li><g:link controller="managerToDreamer"
						action="acceptManagerDreamerRelationshipRequest">Accept Request</g:link></li>
				<li><g:link controller="managerToDreamer"
						action="rejectManagerDreamerRelationshipRequest"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">Reject Request</g:link></li>
			</dreamManager:currentUserNotInitiatedRequest>
		</dreamManager:currentUserHasRequest>
		<dreamManager:currentUserHasNoRequest>
			<li><g:link controller="managerToDreamer"
					action="displayManagers">Request a manager</g:link></li>
		</dreamManager:currentUserHasNoRequest>
	</dreamManager:hasNoManager>
	<li><g:link controller="Auth" action="signOut">Log Out</g:link></li>
</ul>
<script type="text/javascript">
	$(function() {
		$("#headerMenuButton").button().click(function() {
			$("#headerMenu").toggle('fade');
		});
		$("#headerMenu").menu();
	});
</script>