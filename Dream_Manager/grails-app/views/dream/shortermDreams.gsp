<div class="accordion">
	<g:each in="${dreams}" status="i" var="dream">
	<script>
	if(dream.isShortTerm==true)
		{
			<h3>${dream.name} ${dream.percentComplete} %</h3>
			<div>
				<p>Short Term Task</p>
				<p>Completetion</p>
			</div>
		}
	</script>
	</g:each>
</div>