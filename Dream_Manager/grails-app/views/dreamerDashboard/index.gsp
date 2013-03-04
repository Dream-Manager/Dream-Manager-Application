<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="dashboard" />
<meta name="authentication" content="signup" />
<title>Dream Manager - Dreamer Dashboard</title>
</head>
<body>
	<div class="container_16">
		<!--  Center Column -->
		<div class="grid_12 alpha">
			<shiro:principal/>
				Create Dream:
				<g:include controller="dream" action="showCreateAjax" />
			<shiro:principal li="string" />
		</div>

		<!--  Right Column -->
		<div class="grid_4 omega">
			Social Grid
		</div>
	</div>

</body>
</html>