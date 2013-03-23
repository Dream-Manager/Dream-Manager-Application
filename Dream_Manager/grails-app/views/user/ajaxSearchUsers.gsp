<h2>My Dreamers</h2>
<table>
<g:each in="${managedUsers}" status="i" var="user">
	<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
		<td width="10%"><g:link action="show" id="${user.id}"><g:img dir="images" file="user-silhouette.png" width="20" height="20" /></g:link></td>
		<td width="75%"><g:link action="show" id="${user.id}">${user.firstName} ${user.lastName}</g:link></td>
		<td width="15%">Dreams</td>		
	</tr>
</g:each>
</table>
<h2>Other Users</h2>
<table>
<g:each in="${otherUsers}" status="i" var="user">
	<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
		<td width="10%"><g:link action="show" id="${user.id}"><g:img dir="images" file="user-silhouette.png" width="20" height="20" /></g:link></td>
		<td width="75%"><g:link action="show" id="${user.id}">${user.firstName} ${user.lastName}</g:link></td>		
		<td width="15%">Claim</td>
	</tr>
</g:each>
</table>