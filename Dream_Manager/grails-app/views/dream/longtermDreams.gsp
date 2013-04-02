<div class="accordion">
	<g:each in="${dreams}" status="i" var="dream">
	<script>
	if(dream.isShortTerm==false)
		{
			<h3>${dream.name} ${dream.percentComplete} %</h3>
			<div>
				<p>Long Term</p>
				<p>Completetion</p>
			</div>
		}
	</script>
	</g:each>
</div>