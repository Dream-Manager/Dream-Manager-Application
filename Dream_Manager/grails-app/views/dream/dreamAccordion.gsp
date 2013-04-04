<div class="accordion">
	<g:each in="${dreams}" status="i" var="dream">
		<h3>${dream.name}</h3>
		<div>
			<div style="height: 10em; position: relative;">
				<div class="progressbar">${dream.percentComplete}</div>
				<p>${dream.notes}</p>
				<g:link controller="dream" action="edit" id="${dream.id}" style="position:absolute; right: 0; bottom: 0;">Edit Dream</g:link>
			</div>
		</div>
	</g:each>
</div>
