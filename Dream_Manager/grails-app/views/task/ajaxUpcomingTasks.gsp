<g:if test="${tasks!=null}">
<h1>Upcoming Tasks</h1>
<table>
	<thead>
		<tr>
			<th width="15%">Date</th>
			<th width="50%">Task Name</th>
			<th width="35%">Dream</th>	
		</tr>
	</thead>
	<tbody>
	<g:each in="${tasks}" status="i" var="task">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td><g:formatDate format="MM/dd/yyyy" date="${task.estimatedCompletion}" /></td>
			<td><g:link action="show" id="${task.id}">${task.name}</g:link></td>
			<td>${task.dream}</td>
		</tr>
	</g:each>
	</tbody>
</table>
</g:if>