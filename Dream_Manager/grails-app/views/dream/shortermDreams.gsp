<div class="accordion">
	<g:each in="${dreams}" status="i" var="dream">

			<h3>${dream.name} ${dream.percentComplete} %</h3>
			<div>
				<p>Task List</p>
				<p>Completetion</p>
			</div>
	</g:each>
</div>