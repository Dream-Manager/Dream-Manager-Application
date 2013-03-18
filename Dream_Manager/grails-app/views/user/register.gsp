<%@ page import="dream_manager.User" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Register</title>
<meta name="layout" content="main" />
</head>

<body>

	<h1>Register</h1>

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

	<g:form action="signup">
	
	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
		<label for="firstName">
			<g:message code="user.firstName.label" default="First Name" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="firstName" maxlength="20" required="" value="${userInstance?.firstName}"/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
		<label for="lastName">
			<g:message code="user.lastName.label" default="Last Name" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField name="lastName" maxlength="20" required="" value="${userInstance?.lastName}"/>
	</div>
	
	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
		<label for="username">
			<g:message code="user.username.label" default="Email Address" />
			<span class="required-indicator">*</span>
		</label>
		<g:textField type="email" name="username" maxlength="50" required="" value="${userInstance?.username}"/>
	</div>

	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
		<label for="password">
			<g:message code="user.password.label" default="Password" />
			<span class="required-indicator">*</span>
		</label>
		<g:field type="password" name="password" maxlength="20" required=""/>
	</div>
	
	
	<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordConfirm', 'error')} required">
		<label for="passwordConfirm">
			<g:message code="user.passwordConfirm.label" default="Confirm Password" />
			<span class="required-indicator">*</span>
		</label>
		<g:field type="password" name="passwordConfirm" maxlength="20" required=""/>
	</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'streetAddress1', 'error')} ">
	<label for="streetAddress1">
		<g:message code="user.streetAddress1.label" default="Street Address 1" />
		
	</label>
	<g:textField name="streetAddress1" value="${userInstance?.streetAddress1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'streetAddress2', 'error')} ">
	<label for="streetAddress2">
		<g:message code="user.streetAddress2.label" default="Street Address 2" />
		
	</label>
	<g:textField name="streetAddress2" value="${userInstance?.streetAddress2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'poBox', 'error')} ">
	<label for="poBox">
		<g:message code="user.poBox.label" default="PO Box" />
		
	</label>
	<g:textField name="poBox" value="${userInstance?.poBox}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'dateOfBirth', 'error')} ">
	<label for="dateOfBirth">
		<g:message code="user.dateOfBirth.label" default="Date Of Birth" />
		
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${userInstance?.dateOfBirth}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="user.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${userInstance?.city}"/>
</div>

		<p>
		</p>
		<fieldset class="buttons">
			<g:submitButton name="submit" value="${message(code: 'default.button.create.label', default: 'Create')}" />
		</fieldset>
	</g:form>

</body>
</html>