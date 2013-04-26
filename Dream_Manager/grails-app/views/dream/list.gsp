
<%@ page import="dream_manager.Dream"%>
<!DOCTYPE html>
<html>
<head>

<g:set var="entityName"
	value="${message(code: 'dream.label', default: 'Dream')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-dream" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			
			<g:def var="userId" value="${userId}" />
			<li>
				<g:link class="create" action="create" params="[userId:userId]">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link>
			</li>
		</ul>
	</div>
	<div id="list-dream" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<table>
			<thead>
				<tr>

					<g:sortableColumn property="category"
						title="${message(code: 'dream.category.label', default: 'Category')}" />

					<g:sortableColumn property="name"
						title="${message(code: 'dream.name.label', default: 'Name')}" />

					<g:sortableColumn property="completed"
						title="${message(code: 'dream.completed.label', default: 'Completed')}" />

					<g:sortableColumn property="notes"
						title="${message(code: 'dream.notes.label', default: 'Notes')}" />

					<g:sortableColumn property="estimatedCompletion"
						title="${message(code: 'dream.estimatedCompletion.label', default: 'Estimated Completion')}" />

					<g:sortableColumn property="isShortTerm"
						title="${message(code: 'dream.isShortTerm.label', default: 'Term Length')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${dreamInstanceList}" status="i" var="dreamInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>
							${fieldValue(bean: dreamInstance, field: "category")}
						</td>

						<td><g:link action="show" id="${dreamInstance.id}">
								${fieldValue(bean: dreamInstance, field: "name")}
							</g:link></td>

						<td><g:formatDate format="MM/dd/yyyy"
								date="${dreamInstance.completed}" /></td>

						<td>
							${fieldValue(bean: dreamInstance, field: "notes")}
						</td>

						<td><g:formatDate format="MM/dd/yyyy"
								date="${dreamInstance.estimatedCompletion}" /></td>

						<td><g:if test="${dreamInstance.isShortTerm}">Short Term</g:if> <g:else>Long Term</g:else>
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${dreamInstanceTotal}" />
		</div>
	</div>
</body>
</html>
