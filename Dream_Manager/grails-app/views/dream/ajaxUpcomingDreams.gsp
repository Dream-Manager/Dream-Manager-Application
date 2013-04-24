<g:if test="${dreams!=null}">
<h1>Upcoming Dreams</h1>
<table>
	<thead>
		<tr>
			<th width="25%">Estimated Completion</th>
			<th width="50%">Dream</th>
			<th width="25%">Category</th>	
		</tr>
	</thead>
	<tbody>
	<g:each in="${dreams}" status="i" var="dream">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td><g:formatDate format="MM/dd/yyyy" date="${dream.estimatedCompletion}" /></td>
			<td><g:link action="show" id="${dream.id}">${dream.name}</g:link></td>
			<td>${dream.category}</td>
		</tr>
	</g:each>
	</tbody>
</table>
</g:if>