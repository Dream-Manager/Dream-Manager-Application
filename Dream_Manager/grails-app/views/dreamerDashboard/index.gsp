<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="dashboard" />
<meta name="authentication" content="signup" />
<title>Dream Manager - Dreamer Dashboard</title>
</head>
<body>
	<div class="container_16">
		<!--  Left Column -->
		<div class="grid_4"><shiro:principal/></div>
		<!--  Center Column -->
		<div class="grid_8">-- <shiro:principal li="string" /></div>
		<!--  Right Column -->
		<div class="grid_4"></div>
	</div>

</body>
</html>