<div class="accordion">
	<g:each in="${dreams}" status="i" var="dream">
	<div id="long"></div>
	<script>
	var x=document.getElementByID("long")
	if(dream.isShortTerm==false)
		{
			x.innerHTML=""<h3>${dream.name} ${dream.percentComplete} %</h3><div><p>Long Term</p><p>Completetion</p></div>";
		}
	</script>
	</g:each>
</div>