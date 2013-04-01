<html>
<body>
<div>
	<g:each in="${dreams}" status="i" var="dream">
		<div class="accordion">
			<p>${dream.name}  ${dream.percentComplete} %</p>

		</div>
	</g:each>
</div>
</body>
</html>