<%@ page import="dream_manager.User"%>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
	<label for="firstName"> <g:message code="user.firstName.label"
			default="First Name" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" maxlength="20" required=""
		value="${userInstance?.firstName}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
	<label for="lastName"> <g:message code="user.lastName.label"
			default="Last Name" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" maxlength="20" required=""
		value="${userInstance?.lastName}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username"> <g:message code="user.username.label"
			default="Email Address" /> <span class="required-indicator">*</span>
	</label>
	<g:textField type="email" name="username" maxlength="50" required=""
		value="${userInstance?.username}" />
</div>
<shiro:notUser>
	<div
		class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
		<label for="password"> <g:message code="user.password.label"
				default="Password" /> <span class="required-indicator">*</span>
		</label>
		<g:field type="password" name="password" maxlength="20" required="" />
	</div>
	<div
		class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordConfirm', 'error')} required">
		<label for="passwordConfirm"> <g:message
				code="user.passwordConfirm.label" default="Confirm Password" /> <span
			class="required-indicator">*</span>
		</label>
		<g:field type="password" name="passwordConfirm" maxlength="20"
			required="" />
	</div>
</shiro:notUser>

<!-- for future use in adding avatar to account
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'avatarLocation', 'error')} ">
	<label for="avatarLocation">
		<g:message code="user.avatarLocation.label" default="Avatar Location" />
		
	</label>
	<g:textField name="avatarLocation" value="${userInstance?.avatarLocation}"/>
</div>
-->
<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'streetAddress1', 'error')} ">
	<label for="streetAddress1"> <g:message
			code="user.streetAddress1.label" default="Street Address 1" />

	</label>
	<g:textField name="streetAddress1"
		value="${userInstance?.streetAddress2}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'streetAddress2', 'error')} ">
	<label for="streetAddress2"> <g:message
			code="user.streetAddress2.label" default="Street Address 2" />

	</label>
	<g:textField name="streetAddress2"
		value="${userInstance?.streetAddress2}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'poBox', 'error')} ">
	<label for="poBox"> <g:message code="user.poBox.label"
			default="PO Box" />

	</label>
	<g:textField name="poBox" value="${userInstance?.poBox}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'dateOfBirth', 'error')} ">
	<label for="dateOfBirth"> <g:message
			code="user.dateOfBirth.label" default="Date Of Birth" />

	</label>
	<g:datePicker name="dateOfBirth" precision="day"
		value="${userInstance?.dateOfBirth}" default="none"
		noSelection="['': '']" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'city', 'error')} ">
	<label for="city"> <g:message code="user.city.label"
			default="City" />

	</label>
	<g:textField name="city" value="${userInstance?.city}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'state', 'error')} ">
	<label for="state"> <g:message code="user.state.label"
			default="State" />

	</label>
	<g:select name="state" from="${userInstance.constraints.state.inList}"
		value="${userInstance?.state}" valueMessagePrefix="user.state"
		noSelection="['': '']" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'zipcode', 'error')} ">
	<label for="zipcode"> <g:message code="user.zipcode.label"
			default="Zipcode" />

	</label>
	<g:textField name="zipcode" maxlength="5"
		pattern="${userInstance.constraints.zipcode.matches}"
		value="${userInstance?.zipcode}" />
</div>

<shiro:hasAnyRole in="['ROLE_ADMIN', 'ROLE_MANAGER']">
	<div
		class="fieldcontain ${hasErrors(bean: userInstance, field: 'isManager', 'error')} ">
		<label for="isManager"> <g:message code="user.isManager.label"
				default="Is Manager" />

		</label>
		<g:checkBox name="isManager" value="${userInstance?.isManager}" />
	</div>
</shiro:hasAnyRole>

<shiro:hasRole name="ROLE_ADMIN">
	<div
		class="fieldcontain ${hasErrors(bean: userInstance, field: 'isAdmin', 'error')} ">
		<label for="isAdmin"> <g:message code="user.isAdmin.label"
				default="Is Administrator" />

		</label>
		<g:checkBox name="isAdmin" value="${userInstance?.isAdmin}" />
	</div>
</shiro:hasRole>