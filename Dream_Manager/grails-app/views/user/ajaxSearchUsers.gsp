<h2>My Dreamers</h2>
<table>
	<g:each in="${managedUsers}" status="i" var="user">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td width="10%"><g:link action="show" id="${user.id}">
					<g:img dir="images" file="user-silhouette.png" width="20"
						height="20" />
				</g:link></td>
			<td width="60%"><g:link action="show" id="${user.id}">
					${user.toString()}
				</g:link></td>
			<td width="15%">Dreams</td>
			<td width="15%"><g:if test="${user?.managerConfirmed}">
					<g:link controller="managerToDreamer" action="unclaimDreamer"
						id="${user.id}">Release</g:link>
				</g:if></td>
		</tr>
	</g:each>
</table>
<h2>Other Users</h2>
<table>
	<g:each in="${otherUsers}" status="i" var="user">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td width="10%"><g:link action="show" id="${user.id}">
					<g:img dir="images" file="user-silhouette.png" width="20"
						height="20" />
				</g:link></td>
			<td width="75%"><g:link action="show" id="${user.id}">
					${user.toString()}
				</g:link></td>
			<g:if test="${!user?.managerConfirmed}">
				<dreamManager:requestManagerDreamerRelation id="${user?.id}">
					<td width="15%"><g:link controller="managerToDreamer"
							action="acceptManagerDreamerRelationshipRequest" id="${user?.id}">Accept Request</g:link></td>
				</dreamManager:requestManagerDreamerRelation>
				<dreamManager:noRequestManagerDreamerRelation id="${user?.id}">
					<td width="15%"><g:link controller="managerToDreamer"
							action="claimDreamer" id="${user.id}">Claim</g:link></td>
				</dreamManager:noRequestManagerDreamerRelation>
			</g:if>
		</tr>
	</g:each>
</table>