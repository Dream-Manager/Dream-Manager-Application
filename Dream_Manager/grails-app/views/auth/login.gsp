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
				background-color: #3454A2; 
				background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #FFF), color-stop(1, #3454A2)); 
			}
			body {
				-moz-box-shadow: none;
				-webkit-box-shadow: none;
				        box-shadow: none;
				background-color: rgba(255, 255, 255, 0.0);
	        }
	        #page { 
	        	background: none; 
	        	background-color: rgba(255, 255, 255, 0.0);
	        }
		</style>
		
	</head>
	<body>
		<div id="page">
			
			<div style="margin-top:5em;">
				<g:render template="/common/topbar" />
			</div>
			
			<div id="content" class="container_16"> 

				<g:if test="${flash.message}">
					<div class="message">
						${flash.message}
					</div>
				</g:if>

				<div class="clear" style="min-height:5em"><!-- spacer --></div> 
			
				<div class="prefix_2 grid_5 suffix_1" style="text-align:center;">
					<div style="background-color:rgba(255, 255, 255, 0.6);min-height:15em;">
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
				</div>
				<div class="grid_6 suffix_2" style="line-height:220%;">
					<div style="background-color:rgba(255, 255, 255, 0.6);min-height:20em;padding-left:5em;">
						<g:form action="signIn">
							<div class="grid_6" style="font-size:150%;font-weight:600;color:#557;margin-left:3em;margin-top:.5em;">Login</div>
							
							<div class="clear"></div>
							
							<input type="hidden" name="targetUri" value="${targetUri}" />
							<shiro:isNotLoggedIn>
								<label for="username">Email:</label><br />
								<input type="text" name="username" value="${username}" style="margin-left:1em;"/> 
								
								<div class="clear"></div>
								
								<label for="password">Password:</label><br />
								<input type="password" name="password" value="" style="margin-left:1em;" /> 
								
								<div class="clear" style="margin-bottom:.5em;"></div>
								
								<g:checkBox name="rememberMe" value="${rememberMe}" /> 
								<label for="rememberMe">Remember me?</label>
								
								<div class="clear" style="margin-bottom:.5em;"></div>
								
								<input type="submit" value="Sign In" style="margin-right:2em;" class="button"/>  			
								<g:link controller="auth" action="lostPassword">Forgot Password?</g:link>
							</shiro:isNotLoggedIn>
							<shiro:isLoggedIn>You are signed in as <shiro:principal></shiro:principal>
								<g:actionSubmit value="Logout" action="signOut"
									onclick="return confirm('Are you sure?')" />
							</shiro:isLoggedIn>
						</g:form>
					</div>
				</div>
				<div class="clear" style="margin-bottom:10em;"></div>
			
				<div class="prefix_4 grid_12" style="color:#DDF;font-family: cursive;font-style: italic;font-variant: small-caps;font-size: 200%;line-height: 200%;">
					<div style="background-color:rgba(255, 255, 255, 0.1);min-height:2em;padding-left:.5em;">
						A personal, private tool to help you accomplish your dreams
					</div>
				</div>
			</div>
		</div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>