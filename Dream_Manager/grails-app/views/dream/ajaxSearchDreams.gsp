<table>
	<thead>
		<tr>
			<th>Category</th>
			<th>Title</th>
			<th>Estimated Completion</th>
			<th>Short Term</th>		
		</tr>
	</thead>
	<tbody>
	<g:each in="${dreams}" status="i" var="dream">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td>${dream.category}</td>
			<td><g:link action="show" id="${dream.id}">${dream.name}</g:link></td>
			<td><g:formatDate format="MM-dd-yyyy" date="${dream.estimatedCompletion}" /></td>
			<td><g:formatBoolean boolean="${dream.isShortTerm}" /></td>
		</tr>
	</g:each>
	</tbody>
</table>