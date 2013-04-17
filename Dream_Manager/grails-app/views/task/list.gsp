
<%@ page import="dream_manager.Task" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-task" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'task.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'task.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="estimatedCompletion" title="${message(code: 'task.estimatedCompletion.label', default: 'Estimated Completion')}" />
					
						<g:sortableColumn property="completed" title="${message(code: 'task.completed.label', default: 'Completed')}" />
					
						<th><g:message code="task.dream.label" default="Dream" /></th>
					
						<g:sortableColumn property="percentComplete" title="${message(code: 'task.percentComplete.label', default: 'Percent Complete')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${taskInstanceList}" status="i" var="taskInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: taskInstance, field: "description")}</td>
					
						<td><g:formatDate date="${taskInstance.estimatedCompletion}" /></td>
					
						<td><g:formatBoolean boolean="${taskInstance.completed}" /></td>
					
						<td>${fieldValue(bean: taskInstance, field: "dream")}</td>
					
						<td>${fieldValue(bean: taskInstance, field: "percentComplete")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${taskInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
