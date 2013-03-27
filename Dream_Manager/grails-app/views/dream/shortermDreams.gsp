<table>
	<tbody>
	<g:each in="${dreams}" status="i" var="dream">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			<td><g:link action="show" id="${dream.id}">${dream.name}</g:link></td>
			<td>${dream.percentComplete} %</g></td>
		</tr>
	</g:each>
	</tbody>
</table>