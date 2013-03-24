<%@ page import="dream_manager.User" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta name="layout" content="none" />
		<g:external dir="css" file="reset.css"/>
		<g:external dir="css" file="text.css"/>
		<g:external dir="css" file="960.css"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'cloud-md.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'cloud-md.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'cloud-md.png')}">
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		
		<meta name="authentication" content="signup" />
		
		<title>The Dream Manager</title>
		
		<g:javascript library="jquery" />
		
		<r:layoutResources />
		
		<g:external dir="js" file="jquery-ui-1.10.2.custom.js"/>
		<g:external dir="css" file="ui-lightness/jquery-ui-1.10.2.custom.css"/>
		
		<style type="text/css">
			html { 
				background-color: white; 
				background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #99F), color-stop(1, #FFF)); 
			}
			body {
				-moz-box-shadow: none;
				-webkit-box-shadow: none;
				        box-shadow: none;
	        }
	        #page { 
	        	background: none; 
	        }
		<</style>
		
	</head>
	<body>
		<div id="page">
			<div id="content" class="container_16"> 

			<g:if test="${flash.message}">
				<div class="message">
					${flash.message}
				</div>
			</g:if>
			<div style="min-height:10em"><!-- spacer --></div>
			<div class="clear"></div>
			
			<div>
				The Dream Manager
			</div>
			
			<div class="prefix_2 grid_5 suffix_1" style="text-align:center;">
				<g:link controller="User" action="register">
					<div class="button" style="font-size:130%;margin-top:3em;">
						Create An Account
					</div>
				</g:link>
				<script type="text/javascript">
					$(function(){ $(".button").button(); });
				</script>
				<div style="margin-top:1em;">
					Tell Me More
				</div>
			</div>
			<div class="grid_6 suffix_2" style="line-height:220%;">
				<g:form action="signIn">
					<div class="grid_6" style="text-align:center;font-size:110%;">Login To Your Account</div> 
					
					<div class="clear"></div>
					
					<input type="hidden" name="targetUri" value="${targetUri}" />
					<shiro:isNotLoggedIn>
						<label for="username">Email:</label><br />
						<input type="text" name="username" value="${username}" style="margin-left:1em;"/> 
						
						<div class="clear"></div>
						
						<label for="password">Password:</label><br />
						<input type="password" name="password" value="" style="margin-left:1em;" /> 
						
						<div class="clear"></div>
						
						<g:checkBox name="rememberMe" value="${rememberMe}" /> 
						<label for="rememberMe">Remember me?</label>
						
						<div class="clear"></div>
						
						<input type="submit" value="Sign In" style="margin-right:2em;" class="button"/>  			
						<g:link controller="auth" action="lostPassword">Forgot Password?</g:link>
					</shiro:isNotLoggedIn>
					<shiro:isLoggedIn>You are signed in as <shiro:principal></shiro:principal>
						<g:actionSubmit value="Logout" action="signOut"
							onclick="return confirm('Are you sure?')" />
					</shiro:isLoggedIn>
				</g:form>
			</div>
			<div class="clear" style="margin-bottom:10em;"></div>
			
			<div class="prefix_4 grid_12">
				<h3>A personal, private tool to help you accomplish your dreams</h3>
			</div>
		</div>
		
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>