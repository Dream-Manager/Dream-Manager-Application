
<%@ page import="dream_manager.Dream" %>
<!DOCTYPE html>
<html>
	<head>
		
		<g:set var="entityName" value="${message(code: 'dream.label', default: 'Dream')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dream" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dream" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dream">
			
				<g:if test="${dreamInstance?.completed}">
				<li class="fieldcontain">
					<span id="completed-label" class="property-label"><g:message code="dream.completed.label" default="Completed" /></span>
					
						<span class="property-value" aria-labelledby="completed-label"><g:formatDate date="${dreamInstance?.completed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="dream.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${dreamInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="dream.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${dreamInstance}" field="category"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamInstance?.created}">
				<li class="fieldcontain">
					<span id="created-label" class="property-label"><g:message code="dream.created.label" default="Created" /></span>
					
						<span class="property-value" aria-labelledby="created-label"><g:formatDate date="${dreamInstance?.created}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamInstance?.estimatedCompletion}">
				<li class="fieldcontain">
					<span id="estimatedCompletion-label" class="property-label"><g:message code="dream.estimatedCompletion.label" default="Estimated Completion" /></span>
					
						<span class="property-value" aria-labelledby="estimatedCompletion-label"><g:formatDate date="${dreamInstance?.estimatedCompletion}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamInstance?.isShortTerm}">
				<li class="fieldcontain">
					<span id="isShortTerm-label" class="property-label"><g:message code="dream.isShortTerm.label" default="Is Short Term" /></span>
					
						<span class="property-value" aria-labelledby="isShortTerm-label"><g:formatBoolean boolean="${dreamInstance?.isShortTerm}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="dream.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${dreamInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="dream.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${dreamInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dreamInstance?.tasks}">
				<li class="fieldcontain">
					<span id="tasks-label" class="property-label"><g:message code="dream.tasks.label" default="Tasks" /></span>
					
						<g:each in="${dreamInstance.tasks}" var="t">
						<span class="property-value" aria-labelledby="tasks-label"><g:link controller="dreamTask" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${dreamInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="dream.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${dreamInstance?.user?.id}">${dreamInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${dreamInstance?.id}" />
					<g:link class="edit" action="edit" id="${dreamInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
