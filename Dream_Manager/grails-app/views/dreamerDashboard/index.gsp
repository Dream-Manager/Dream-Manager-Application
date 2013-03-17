<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<g:external dir="css" file="reset.css"/>
		<g:external dir="css" file="text.css"/>
		<g:external dir="css" file="960.css"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		
		<meta name="authentication" content="signup" />
		<title>Dream Manager - Dashboard</title>
		
		<g:javascript library="jquery" />
		
		<r:layoutResources />
		
		<g:external dir="js" file="jquery-ui-1.10.2.custom.js"/>
		<g:external dir="css" file="ui-lightness/jquery-ui-1.10.2.custom.css"/>
	</head>
	<body>
		<div id="page">
			<div id="topbar">
				<g:render template="/common/topbar" />
			</div>
			
			<div id='header'>
				<g:render template="/common/header" />
			</div>
			
			<div id="content" class="container_16"> 
								
				<div class="grid_12 alpha">	
					<div id="tabs">
						<ul>
						    <li><a href="#tabs-1">Your Progress</a></li>
						    <li><a href="#tabs-2">Search Dreams</a></li>
						    <shiro:hasRole name="ROLE_MANAGER">
						    	<li><a href="#tabs-3">Manage Dreamers</a></li>
						    </shiro:hasRole>
						</ul>
						<div id="tabs-1">
							<g:include controller="dream" action="showCreateAjax" />
							Dream Progress
						</div>
						<div id="tabs-2">
							Search Dreams
						</div>
						<shiro:hasRole name="ROLE_MANAGER">
							<div id="tabs-3">
								Manage Dreamers
							</div>
						</shiro:hasRole>
					</div>
				</div>
		
				
				<div class="grid_4 omega">
					Social Grid
				</div>
				
			</div>
			
			<div id='navbar'>
				<g:render template="/common/navbar" />
			</div>
			
			<div id="footer">
				<g:render template="/common/footer" />
			</div>
		</div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html