<%@ page import="dream_manager.User"%>
<!DOCTYPE html>
<html>
<head>

<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-user" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><a class="list" href="${createLink(uri:'/#tabs-3') }"><g:message
						code="Dreamer List" args="[entityName]" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="New Dreamer" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-user" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<ol class="property-list user">

			<g:if test="${userInstance?.firstName}">
				<li class="fieldcontain"><span id="firstName-label"
					class="property-label"><g:message
							code="user.firstName.label" default="First Name" /></span> <span
					class="property-value" aria-labelledby="firstName-label"><g:fieldValue
							bean="${userInstance}" field="firstName" /></span></li>
			</g:if>

			<g:if test="${userInstance?.lastName}">
				<li class="fieldcontain"><span id="lastName-label"
					class="property-label"><g:message code="user.lastName.label"
							default="Last Name" /></span> <span class="property-value"
					aria-labelledby="lastName-label"><g:fieldValue
							bean="${userInstance}" field="lastName" /></span></li>
			</g:if>

			<g:if test="${userInstance?.username}">
				<li class="fieldcontain"><span id="username-label"
					class="property-label"><g:message code="user.username.label"
							default="Email" /></span> <span class="property-value"
					aria-labelledby="username-label"><g:fieldValue
							bean="${userInstance}" field="username" /></span></li>
			</g:if>

			<g:if test="${userInstance?.avatarLocation}">
				<li class="fieldcontain"><span id="avatarLocation-label"
					class="property-label"><g:message
							code="user.avatarLocation.label" default="Avatar Location" /></span> <span
					class="property-value" aria-labelledby="avatarLocation-label"><g:fieldValue
							bean="${userInstance}" field="avatarLocation" /></span></li>
			</g:if>

			<g:if test="${userInstance?.streetAddress1}">
				<li class="fieldcontain"><span id="streetAddress1-label"
					class="property-label"><g:message
							code="user.streetAddress1.label" default="Street Address1" /></span> <span
					class="property-value" aria-labelledby="streetAddress1-label"><g:fieldValue
							bean="${userInstance}" field="streetAddress1" /></span></li>
			</g:if>

			<g:if test="${userInstance?.streetAddress2}">
				<li class="fieldcontain"><span id="streetAddress2-label"
					class="property-label"><g:message
							code="user.streetAddress2.label" default="Street Address2" /></span> <span
					class="property-value" aria-labelledby="streetAddress2-label"><g:fieldValue
							bean="${userInstance}" field="streetAddress2" /></span></li>
			</g:if>

			<g:if test="${userInstance?.poBox}">
				<li class="fieldcontain"><span id="poBox-label"
					class="property-label"><g:message code="user.poBox.label"
							default="Po Box" /></span> <span class="property-value"
					aria-labelledby="poBox-label"><g:fieldValue
							bean="${userInstance}" field="poBox" /></span></li>
			</g:if>

			<g:if test="${userInstance?.dateOfBirth}">
				<li class="fieldcontain"><span id="dateOfBirth-label"
					class="property-label"><g:message
							code="user.dateOfBirth.label" default="Date Of Birth" /></span> <span
					class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate
							date="${userInstance?.dateOfBirth}" /></span></li>
			</g:if>

			<g:if test="${userInstance?.city}">
				<li class="fieldcontain"><span id="city-label"
					class="property-label"><g:message code="user.city.label"
							default="City" /></span> <span class="property-value"
					aria-labelledby="city-label"><g:fieldValue
							bean="${userInstance}" field="city" /></span></li>
			</g:if>

			<g:if test="${userInstance?.state}">
				<li class="fieldcontain"><span id="state-label"
					class="property-label"><g:message code="user.state.label"
							default="State" /></span> <span class="property-value"
					aria-labelledby="state-label"><g:fieldValue
							bean="${userInstance}" field="state" /></span></li>
			</g:if>

			<g:if test="${userInstance?.zipcode}">
				<li class="fieldcontain"><span id="zipcode-label"
					class="property-label"><g:message code="user.zipcode.label"
							default="Zipcode" /></span> <span class="property-value"
					aria-labelledby="zipcode-label"><g:fieldValue
							bean="${userInstance}" field="zipcode" /></span></li>
			</g:if>

			<g:if test="${userInstance?.manager}">
				<li class="fieldcontain"><span id="manager-label"
					class="property-label"><g:message code="user.manager.label"
							default="Manager" /></span> <span class="property-value"
					aria-labelledby="manager-label"><g:link controller="user"
							action="show" id="${userInstance?.manager?.id}">
							${userInstance?.manager?.encodeAsHTML()}
						</g:link> <g:if test="${userInstance?.confirmedByManager}"
							test="${userInstance?.confirmedByDreamer}">
						Confirmed
						</g:if> <g:else>
						Not Confirmed
						</g:else> </span></li>
			</g:if>

			<g:if test="${userInstance?.dreams}">
				<li class="fieldcontain"><span id="dreams-label"
					class="property-label"><g:message code="user.dreams.label"
							default="Dreams" /></span> <g:each in="${userInstance.dreams}" var="d">
						<span class="property-value" aria-labelledby="dreams-label"><g:link
								controller="dream" action="show" id="${d.id}">
								${d?.encodeAsHTML()}
							</g:link></span>
					</g:each></li>
			</g:if>

			<g:if test="${userInstance?.isManager}">
				<li class="fieldcontain"><span id="isManager-label"
					class="property-label"><g:message
							code="user.isManager.label" default="Is Manager" /></span> <span
					class="property-value" aria-labelledby="isManager-label"><g:formatBoolean
							boolean="${userInstance?.isManager}" /></span></li>
			</g:if>

			<g:if test="${userInstance?.isAdmin}">
				<li class="fieldcontain"><span id="isAdmin-label"
					class="property-label"><g:message code="user.isAdmin.label"
							default="Is Administrator" /></span> <span class="property-value"
					aria-labelledby="isAdmin-label"><g:formatBoolean
							boolean="${userInstance?.isAdmin}" /></span></li>
			</g:if>

			<g:if test="${userInstance?.skills}">
				<li class="fieldcontain"><span id="skills-label"
					class="property-label"><g:message code="user.skills.label"
							default="Skills" /></span> <g:each in="${userInstance.skills}" var="s">
						<span class="property-value" aria-labelledby="skills-label"><g:link
								controller="skill" action="show" id="${s.id}">
								${s?.encodeAsHTML()}
							</g:link></span>
					</g:each></li>
			</g:if>



		</ol>
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${userInstance?.id}" />
				<g:link class="edit" action="edit" id="${userInstance?.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
