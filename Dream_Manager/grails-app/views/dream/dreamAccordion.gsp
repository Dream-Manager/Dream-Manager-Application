<div class="accordion">
	<g:each in="${dreams}" status="i" var="dream">
		<h3>${dream.name}</h3>
		<div>
			<div class="progressbar">${dream.percentComplete}</div>
			<p>${dream.notes}</p>
		</div>
	</g:each>
</div>
