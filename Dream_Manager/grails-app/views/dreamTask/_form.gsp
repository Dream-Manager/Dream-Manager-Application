<%@ page import="dream_manager.DreamTask" %>



<div class="fieldcontain ${hasErrors(bean: dreamTaskInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="dreamTask.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${dreamTaskInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dreamTaskInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="dreamTask.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${dreamTaskInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dreamTaskInstance, field: 'estimatedCompletion', 'error')} ">
	<label for="estimatedCompletion">
		<g:message code="dreamTask.estimatedCompletion.label" default="Estimated Completion" />
		
	</label>
	<g:datePicker name="estimatedCompletion" precision="day"  value="${dreamTaskInstance?.estimatedCompletion}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: dreamTaskInstance, field: 'completed', 'error')} ">
	<label for="completed">
		<g:message code="dreamTask.completed.label" default="Completed" />
		
	</label>
	<g:checkBox name="completed" value="${dreamTaskInstance?.completed}" />
</div>

<div class="fieldcontain ${hasErrors(bean: dreamTaskInstance, field: 'dream', 'error')} required">
	<label for="dream">
		<g:message code="dreamTask.dream.label" default="Dream" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dream" name="dream.id" from="${dream_manager.Dream.list()}" optionKey="id" required="" value="${dreamTaskInstance?.dream?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dreamTaskInstance, field: 'percentComplete', 'error')} required">
	<label for="percentComplete">
		<g:message code="dreamTask.percentComplete.label" default="Percent Complete" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="percentComplete" type="number" value="${dreamTaskInstance.percentComplete}" required=""/>
</div>

