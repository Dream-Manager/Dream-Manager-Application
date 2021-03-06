<%@ page import="dream_manager.User"%>
<!DOCTYPE html>
<html>
<head>

<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#edit-user" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home"
				href="${createLink(uri: '/dreamerDashboard/index')}"><g:message
						code="default.home.label" /></a></li>
			<shiro:hasRole name="ROLE_ADMIN">
				<li><a class="list" href="${createLink(uri: '/#tabs-3')}"><g:message
							code="Dreamer List" args="[entityName]" /></a></li>
				<li><g:link class="create" action="create">
						<g:message code="New Dreamer" args="[entityName]" />
					</g:link></li>
			</shiro:hasRole>
		</ul>
	</div>
	<div id="edit-user" class="content scaffold-edit" role="main">
		<h1>Edit Profile</h1>
		<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form method="post">
			<g:hiddenField name="id" value="${userInstance?.id}" />
			<g:hiddenField name="version" value="${userInstance?.version}" />
			<fieldset class="form">
			
				<dreamManager:socialConnections/>
				
				<g:render template="formedit" />
			</fieldset>
						
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="update"
					value="${message(code: 'default.button.update.label', default: 'Update')}" />
				<shiro:hasRole name="ROLE_ADMIN">
					<g:actionSubmit class="delete" action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						formnovalidate=""
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</shiro:hasRole>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
