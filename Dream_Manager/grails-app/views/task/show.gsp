
<%@ page import="dream_manager.Task" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-task" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list task">
			
				<g:if test="${taskInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="task.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${taskInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="task.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${taskInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.estimatedCompletion}">
				<li class="fieldcontain">
					<span id="estimatedCompletion-label" class="property-label"><g:message code="task.estimatedCompletion.label" default="Estimated Completion" /></span>
					
						<span class="property-value" aria-labelledby="estimatedCompletion-label"><g:formatDate date="${taskInstance?.estimatedCompletion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.completed}">
				<li class="fieldcontain">
					<span id="completed-label" class="property-label"><g:message code="task.completed.label" default="Completed" /></span>
					
						<span class="property-value" aria-labelledby="completed-label"><g:formatBoolean boolean="${taskInstance?.completed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.dream}">
				<li class="fieldcontain">
					<span id="dream-label" class="property-label"><g:message code="task.dream.label" default="Dream" /></span>
					
						<span class="property-value" aria-labelledby="dream-label"><g:link controller="dream" action="show" id="${taskInstance?.dream?.id}">${taskInstance?.dream?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.percentComplete}">
				<li class="fieldcontain">
					<span id="percentComplete-label" class="property-label"><g:message code="task.percentComplete.label" default="Percent Complete" /></span>
					
						<span class="property-value" aria-labelledby="percentComplete-label"><g:fieldValue bean="${taskInstance}" field="percentComplete"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${taskInstance?.id}" />
					<g:link class="edit" action="edit" id="${taskInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
