<%@ page import="dream_manager.Dream" %>
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
	<g:each in="${dreams}" status="i" var="dreams">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td>${fieldValue(bean: dreamInstance, field: "category")}</td>
			<td><g:link action="show" id="${dreamInstance.id}">${fieldValue(bean: dreamInstance, field: "name")}</g:link></td>
			<td><g:formatDate format="MM-dd-yyyy" date="${dreamInstance.estimatedCompletion}" /></td>
			<td><g:formatBoolean boolean="${dreamInstance.isShortTerm}" /></td>
		</tr>
	</g:each>
	</tbody>
</table>


