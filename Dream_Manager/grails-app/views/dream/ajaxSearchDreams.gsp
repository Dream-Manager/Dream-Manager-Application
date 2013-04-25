<g:if test="${dreams.size()>0}">
	<table>
		<thead>
			<tr>
				<th>Category</th>
				<th>Title</th>
				<th>Estimated Completion</th>
				<th>Term Length</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${dreams}" status="i" var="dream">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td>
						${dream.category}
					</td>
					<td><g:link action="show" id="${dream.id}">
							${dream.name}
						</g:link></td>
					<td><g:formatDate format="MM/dd/yyyy"
							date="${dream.estimatedCompletion}" /></td>
					<td><g:if test="${dream.isShortTerm}">Short Term</g:if> <g:else>Long Term</g:else>
					</td>
					<td><g:link controller="dream" action="delete"
							id="${dream.id}"
							onclick="return confirm('Are you sure you want to delete ${dream.name}?')">
							<g:img dir="images" file="delete.png" width="20" height="20" />
						</g:link></td>
				</tr>
			</g:each>
		</tbody>
	</table>
</g:if>
<g:else>
	<g:if test="${searchTerm == ""}">
You currently have no dreams in the system. Try making one before searching. 
</g:if>
	<g:else>
Search for ${searchTerm} returned no results try again.
</g:else>
</g:else>