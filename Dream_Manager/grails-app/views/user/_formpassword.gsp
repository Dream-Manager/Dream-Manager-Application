<%@ page import="dream_manager.User" %>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" maxlength="20" required=""/>
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



