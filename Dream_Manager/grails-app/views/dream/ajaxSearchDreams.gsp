<table>
	<thead>
		<tr>
			<th>Category</th>
			<th>Title</th>
			<th>Estimated Completion</th>
			<th>Term Length</th>		
		</tr>
	</thead>
	<tbody>
	<g:each in="${dreams}" status="i" var="dream">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td>${dream.category}</td>
			<td><g:link action="show" id="${dream.id}">${dream.name}</g:link></td>
			<td><g:formatDate format="MM-dd-yyyy" date="${dream.estimatedCompletion}" /></td>
			<td><g:if test="${dream.isShortTerm}">Short Term</g:if> 
			<g:else>Long Term</g:else>
			</td>
		</tr>
	</g:each>
	</tbody>
</table>