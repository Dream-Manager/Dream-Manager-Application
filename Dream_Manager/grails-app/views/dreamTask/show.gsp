
<%@ page import="dream_manager.DreamTask" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dreamTask.label', default: 'DreamTask')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dreamTask" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dreamTask" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dreamTask">
			
				<g:if test="${dreamTaskInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="dreamTask.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${dreamTaskInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamTaskInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="dreamTask.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${dreamTaskInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamTaskInstance?.estimatedCompletion}">
				<li class="fieldcontain">
					<span id="estimatedCompletion-label" class="property-label"><g:message code="dreamTask.estimatedCompletion.label" default="Estimated Completion" /></span>
					
						<span class="property-value" aria-labelledby="estimatedCompletion-label"><g:formatDate date="${dreamTaskInstance?.estimatedCompletion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamTaskInstance?.completed}">
				<li class="fieldcontain">
					<span id="completed-label" class="property-label"><g:message code="dreamTask.completed.label" default="Completed" /></span>
					
						<span class="property-value" aria-labelledby="completed-label"><g:formatBoolean boolean="${dreamTaskInstance?.completed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamTaskInstance?.dream}">
				<li class="fieldcontain">
					<span id="dream-label" class="property-label"><g:message code="dreamTask.dream.label" default="Dream" /></span>
					
						<span class="property-value" aria-labelledby="dream-label"><g:link controller="dream" action="show" id="${dreamTaskInstance?.dream?.id}">${dreamTaskInstance?.dream?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamTaskInstance?.percentComplete}">
				<li class="fieldcontain">
					<span id="percentComplete-label" class="property-label"><g:message code="dreamTask.percentComplete.label" default="Percent Complete" /></span>
					
						<span class="property-value" aria-labelledby="percentComplete-label"><g:fieldValue bean="${dreamTaskInstance}" field="percentComplete"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${dreamTaskInstance?.id}" />
					<g:link class="edit" action="edit" id="${dreamTaskInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
