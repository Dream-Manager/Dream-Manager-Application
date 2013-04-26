<g:if test= "${managedUsers.size()>0}">
<h2>My Dreamers</h2>
<table>
	<g:each in="${managedUsers}" status="i" var="user">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td width="10%"><g:link action="show" id="${user.id}">
					<avatar:gravatar email="${user.username}" size="20" gravatarRating="pg"/>
				</g:link></td>
			<td width="60%"><g:link action="show" id="${user.id}">
					${user.lastName}, ${user.firstName}
				</g:link></td>
			<td width="15%"><g:link controller="dream" action="listForUser"
					id="${user.id}">Dreams</g:link></td>
			<td width="15%"><g:if test="${user?.managerConfirmed}">
					<g:link controller="managerToDreamer" action="unclaimDreamer"
						id="${user.id}">Release</g:link>
				</g:if> <g:else>&nbsp;</g:else></td>
		</tr>
	</g:each>
</table>
</g:if>
<g:if test= "${otherUsers.size()>0}">
<h2>Other Users</h2>
<table>
	<g:each in="${otherUsers}" status="i" var="user">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td width="10%"><g:link action="show" id="${user.id}">
					<avatar:gravatar email="${user.username}" size="20" gravatarRating="pg"/>
				</g:link></td>
			<td width="75%"><g:link action="show" id="${user.id}">
					${user.lastName}, ${user.firstName}
				</g:link></td>
			<g:if test="${!user?.managerConfirmed}">
				<dreamManager:requestManagerDreamerRelatiomFromDreamer
					id="${user.id}">
					<td width="15%"><g:link controller="managerToDreamer"
							action="acceptManagerDreamerRelationshipRequest" id="${user?.id}" title="Accept to manage this user."><g:img file="accept.png" width="20" height="20" /></g:link>
					<g:link controller="managerToDreamer"
							action="rejectManagerDreamerRelationshipRequest" id="${user?.id}" title="Reject to manage this user."><g:img file="reject.png" width="20" height="20" /></g:link></td>
				</dreamManager:requestManagerDreamerRelatiomFromDreamer>
				<dreamManager:requestManagerDreamerRelationFromManager
					id="${user.id}">
					<td width="15%"><g:img file="pending.png" width="20" height="20" title="Pending approval from ${user.toString() }"/></td>
				</dreamManager:requestManagerDreamerRelationFromManager>
				<dreamManager:hasNoRequestManagerDreamerRelation id="${user.id}">
					<td width="15%"><g:link controller="managerToDreamer"
							action="claimDreamer" id="${user.id}" title="Request to be this users Manager."><g:img file="heart.png" width="20" height="20" /></g:link>
				</dreamManager:hasNoRequestManagerDreamerRelation>

			</g:if>
		</tr>
	</g:each>
</table>
</g:if>

