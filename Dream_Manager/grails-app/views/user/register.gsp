<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Register</title>
<meta name="layout" content="main" />
</head>

<body>

	<h1>Signup</h1>

	<g:if test="${flash.message}">
		<div class="alert alert-info">
			${flash.message}
		</div>
	</g:if>

	<g:hasErrors bean="${user}">
		<div class="alert alert-error">
			<g:renderErrors bean="${user}" as="list" />
		</div>
	</g:hasErrors>

	<g:form action="register">
		<p>
			<label for="username"> <g:message code="user.username.label"
					default="username" /> <span class="required-indicator">*</span>
			</label>
			<g:textField name="username" maxlength="50" required=""
				/>
		</p>

		<p>
			<label for="password"> <g:message code="user.password.label"
					default="Password" /> <span class="required-indicator">*</span>
			</label>
			<g:field type="password" name="password" maxlength="20" required=""/>
		</p>

		<p>
			<label for="confirmPassword"> <g:message
					code="user.confirmPassword.label" default="Confirm Password" /> <span
				class="required-indicator">*</span>
			</label>
			<g:field type="password" name="confirmPassword" maxlength="20"
				required= "" />
		</p>

		<p>
			<label for="firstName"> <g:message
					code="user.firstName.label" default="First Name" /> <span
				class="required-indicator">*</span>
			</label>
			<g:textField name="firstName" maxlength="20" required="" />
		</p>

		<p>
			<label for="lastName"> <g:message code="user.lastName.label"
					default="Last Name" /> <span class="required-indicator">*</span>
			</label>
			<g:textField name="lastName" maxlength="20" required=""
				 />
		</p>
		
		


		<p>
			<g:submitButton name="submit" value="Submit" />
		</p>
	</g:form>

</body>
</html>