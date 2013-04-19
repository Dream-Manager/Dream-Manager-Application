<%@ page import="dream_manager.Dream"%>
<!DOCTYPE html>
<html>
<head>

<g:set var="entityName"
	value="${message(code: 'dream.label', default: 'Dream')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#edit-dream" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="edit-dream" class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
		</h1>
		<g:hasErrors bean="${dreamInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${dreamInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form method="post">
			<g:hiddenField name="id" value="${dreamInstance?.id}" />
			<g:hiddenField name="version" value="${dreamInstance?.version}" />
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<div>
				<g:set var="dreamID" value="${dreamInstance.id}"/>
				<g:link controller="task" action="create" params="[dreamID:dreamID]">Add New Task</g:link>
			</div>
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="update"
					value="${message(code: 'default.button.update.label', default: 'Update')}" />
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					formnovalidate=""
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
