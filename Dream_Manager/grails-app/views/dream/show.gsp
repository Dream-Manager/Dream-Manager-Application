<%@ page import="dream_manager.Dream"%>
<!DOCTYPE html>
<html>
<head>
<g:set var="entityName"
	value="${message(code: 'dream.label', default: 'Dream')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-dream" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
						
			<g:def var="userId" value="${userId}" />
			<li>				
				<g:if test="${userId}">
					<a href="<dreamManager:linkToAction controller="dream" action="listForUser"/>/${userId}">
						<g:message code="default.list.label" args="[entityName]" />
					</a>
				</g:if>
				<g:else>
					<g:link class="list" action="list">
						<g:message code="default.list.label" args="[entityName]" />
					</g:link>
				</g:else>
			</li>
			<li>
				<g:link class="create" action="create" params="[userId:userId]">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link>
			</li>
			
		</ul>
	</div>
	<div id="show-dream" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<ol class="property-list dream">

			<g:if test="${dreamInstance?.name}">
				<li class="fieldcontain"><span id="name-label"
					class="property-label"><g:message code="dream.name.label"
							default="Name" /></span> <span class="property-value"
					aria-labelledby="name-label"><g:fieldValue
							bean="${dreamInstance}" field="name" /></span></li>
			</g:if>

			<g:if test="${dreamInstance?.category}">
				<li class="fieldcontain"><span id="category-label"
					class="property-label"><g:message
							code="dream.category.label" default="Category" /></span> <span
					class="property-value" aria-labelledby="category-label"><g:fieldValue
							bean="${dreamInstance}" field="category" /></span></li>
			</g:if>

			<g:if test="${dreamInstance?.notes}">
				<li class="fieldcontain"><span id="notes-label"
					class="property-label"><g:message code="dream.notes.label"
							default="Notes" /></span> <span class="property-value"
					aria-labelledby="notes-label"><g:fieldValue
							bean="${dreamInstance}" field="notes" /></span></li>
			</g:if>

			<g:if test="${dreamInstance?.completed}">
				<li class="fieldcontain"><span id="completed-label"
					class="property-label"><g:message
							code="dream.completed.label" default="Completed" /></span> <span
					class="property-value" aria-labelledby="completed-label"><g:formatDate
							date="${dreamInstance?.completed}" /></span></li>
			</g:if>

			<g:if test="${dreamInstance?.estimatedCompletion}">
				<li class="fieldcontain"><span id="estimatedCompletion-label"
					class="property-label"><g:message
							code="dream.estimatedCompletion.label"
							default="Estimated Completion" /></span> <span class="property-value"
					aria-labelledby="estimatedCompletion-label"><g:formatDate
							format="MM/dd/yyyy" date="${dreamInstance?.estimatedCompletion}" /></span></li>
			</g:if>

			<li class="fieldcontain"><span id="isShortTerm-label"
				class="property-label"><g:message
						code="dream.isShortTerm.label" default="Term Length" /></span> <span
				class="property-value" aria-labelledby="isShortTerm-label"> <g:if
						test="${dreamInstance?.isShortTerm}">Short Term</g:if> <g:else>Long Term</g:else>
			</span></li>

			<g:if test="${dreamInstance?.percentComplete}">
				<li class="fieldcontain"><span id="percentComplete-label"
					class="property-label"><g:message
							code="dream.percentComplete.label" default="Percent Complete" /></span>
					<span class="property-value"
					aria-labelledby="percentComplete-label">
						<div class="progressbar" style="width:20em">
							<g:fieldValue bean="${dreamInstance}" field="percentComplete" />
						</div>
						<g:fieldValue bean="${dreamInstance}" field="percentComplete" />%
				</span></li>
			</g:if>

			<g:if test="${dreamInstance?.tasks}">
				<li class="fieldcontain"><span id="tasks-label"
					class="property-label"><g:message code="dream.tasks.label"
							default="Tasks" /></span> <g:each in="${dreamInstance.tasks}" var="t">
						<span class="property-value" aria-labelledby="tasks-label"><g:link
								controller="task" action="show" id="${t.id}">
								${t?.encodeAsHTML()}
							</g:link></span>
					</g:each></li>
			</g:if>

			<g:if test="${dreamInstance?.user}">
				<li class="fieldcontain"><span id="user-label"
					class="property-label"><g:message code="dream.user.label"
							default="User" /></span> <span class="property-value"
					aria-labelledby="user-label"><g:link controller="user"
							action="show" id="${dreamInstance?.user?.id}">
							${dreamInstance?.user?.encodeAsHTML()}
						</g:link></span></li>
			</g:if>

		</ol>
		<g:form>
			<fieldset class="buttons">
				<g:hiddenField name="id" value="${dreamInstance?.id}" />
				<g:link class="edit" action="edit" id="${dreamInstance?.id}">
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
