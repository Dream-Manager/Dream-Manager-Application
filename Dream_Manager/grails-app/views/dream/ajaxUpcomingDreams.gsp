<table>
	<thead>
		<tr>
			<th>Estimated Completion</th>
			<th>Title</th>
			<th>Category</th>	
		</tr>
	</thead>
	<tbody>
	<g:each in="${dreams}" status="i" var="dream">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td><g:formatDate format="MM-dd-yyyy" date="${dream.estimatedCompletion}" /></td>
			<td><g:link action="show" id="${dream.id}">${dream.name}</g:link></td>
			<td>${dream.category}</td>
		</tr>
	</g:each>
	</tbody>
</table>