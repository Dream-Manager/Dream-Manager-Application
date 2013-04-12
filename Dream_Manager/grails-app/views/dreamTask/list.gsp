
<%@ page import="dream_manager.DreamTask" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dreamTask.label', default: 'DreamTask')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dreamTask" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dreamTask" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'dreamTask.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'dreamTask.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="estimatedCompletion" title="${message(code: 'dreamTask.estimatedCompletion.label', default: 'Estimated Completion')}" />
					
						<g:sortableColumn property="completed" title="${message(code: 'dreamTask.completed.label', default: 'Completed')}" />
					
						<th><g:message code="dreamTask.dream.label" default="Dream" /></th>
					
						<g:sortableColumn property="percentComplete" title="${message(code: 'dreamTask.percentComplete.label', default: 'Percent Complete')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dreamTaskInstanceList}" status="i" var="dreamTaskInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dreamTaskInstance.id}">${fieldValue(bean: dreamTaskInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: dreamTaskInstance, field: "description")}</td>
					
						<td><g:formatDate date="${dreamTaskInstance.estimatedCompletion}" /></td>
					
						<td><g:formatBoolean boolean="${dreamTaskInstance.completed}" /></td>
					
						<td>${fieldValue(bean: dreamTaskInstance, field: "dream")}</td>
					
						<td>${fieldValue(bean: dreamTaskInstance, field: "percentComplete")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dreamTaskInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
