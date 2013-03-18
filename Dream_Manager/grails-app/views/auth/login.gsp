<%@ page import="dream_manager.User" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Login</title>
</head>
<body>
	<g:if test="${flash.message}">
		<div class="message">
			${flash.message}
		</div>
	</g:if>
	<div class="grid_5">
		<g:form action="signIn">
			<input type="hidden" name="targetUri" value="${targetUri}" />
			<table>
				<shiro:isNotLoggedIn>
					<tbody>
						<tr>
							<td>Username:</td>
							<td><input type="text" name="username" value="${username}" /></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type="password" name="password" value="" /></td>
						</tr>
						<tr>
							<td>Remember me?:</td>
							<td><g:checkBox name="rememberMe" value="${rememberMe}" /></td>
						</tr>
						<tr>
							<td />
							<td><input type="submit" value="Sign in" />  <g:link controller="User" action="register">Not Registered?</g:link></td>
						</tr>
						<tr>
					</tbody>
				</shiro:isNotLoggedIn>
				<shiro:isLoggedIn>You are signed in as<tr>
						<shiro:principal></shiro:principal>
						<g:actionSubmit value="Logout" action="signOut"
							onclick="return confirm('Are you sure?')" />
				</shiro:isLoggedIn>
			</table>
		</g:form>
	</div>
</body>
</html>
