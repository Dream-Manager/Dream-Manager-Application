<div class="accordion">
	<g:each in="${dreams}" status="i" var="dream">
		<h3>
			${dream.name}
		</h3>

		<div>
			<div class="progressbar" value="${dream.percentComplete}"></div>
			<p>Short Term Task</p>
			<p>Completetion</p>
		</div>
		
	</g:each>
</div>