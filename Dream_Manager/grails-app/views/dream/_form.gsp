<%@ page import="dream_manager.Dream" %>



<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'completed', 'error')} ">
	<label for="completed">
		<g:message code="dream.completed.label" default="Completed" />
		
	</label>
	<g:datePicker name="completed" precision="day"  value="${dreamInstance?.completed}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="dream.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${dreamInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="dream.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${dreamInstance?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'created', 'error')} required">
	<label for="created">
		<g:message code="dream.created.label" default="Created" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="created" precision="day"  value="${dreamInstance?.created}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'estimatedCompletion', 'error')} required">
	<label for="estimatedCompletion">
		<g:message code="dream.estimatedCompletion.label" default="Estimated Completion" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="estimatedCompletion" precision="day"  value="${dreamInstance?.estimatedCompletion}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'isShortTerm', 'error')} ">
	<label for="isShortTerm">
		<g:message code="dream.isShortTerm.label" default="Is Short Term" />
		
	</label>
	<g:checkBox name="isShortTerm" value="${dreamInstance?.isShortTerm}" />
</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="dream.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${dreamInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="dream.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${dreamInstance?.tasks?}" var="t">
    <li><g:link controller="dreamTask" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="dreamTask" action="create" params="['dream.id': dreamInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'dreamTask.label', default: 'DreamTask')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="dream.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${dream_manager.User.list()}" optionKey="id" required="" value="${dreamInstance?.user?.id}" class="many-to-one"/>
</div>

