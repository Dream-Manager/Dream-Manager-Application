
<div class="accordion">
	<g:each in="${dreams}" status="i" var="dream">

		<h3>
			${dream.name}
		</h3>

		<div>
			<div id="progressbar">
				
				<script>
				  $(function() {
				    $( "#progressbar" ).progressbar({
				      value: ${dream.percentComplete}
				    });
				  });
				</script>
			</div>
			<p>Short Term Task</p>
		</div>

	</g:each>
</div>
