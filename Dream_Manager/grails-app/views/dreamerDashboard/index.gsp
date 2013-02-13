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
		<div class="grid_4">
			<auth:ifLoggedIn>You are logged in!</auth:ifLoggedIn>
			<auth:ifNotLoggedIn>You need to log in man!</auth:ifNotLoggedIn>
			Hello,
			<auth:user />
			<!-- outputs the user login -->
			Your email address is currently set to:
			<auth:user property="email" />
		</div>
		<!--  Center Column -->
		<div class="grid_8">--</div>
		<!--  Right Column -->
		<div class="grid_4">
			--
			<auth:logoutLink success="[controller:'home', action:'newUser']"
				error="[controller:'userProfile', action:'error']">Log out</auth:logoutLink>
		</div>
	</div>
</body>
</html>