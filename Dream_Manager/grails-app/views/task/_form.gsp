<%@ page import="dream_manager.Task" %>



<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="task.name.label" default="Task Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${taskInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="task.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${taskInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'estimatedCompletion', 'error')} ">
	<label for="estimatedCompletion">
		<g:message code="task.estimatedCompletion.label" default="Estimated Completion" />
		
	</label>
	<g:datePicker name="estimatedCompletion" precision="day"  value="${taskInstance?.estimatedCompletion}" default="none" noSelection="['': '']" />
</div>

<input type="hidden" name="dream.id" value="${params.dreamID}"/>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'percentComplete', 'error')} required">
	<label for="percentComplete">
		<g:message code="task.percentComplete.label" default="Percent Complete" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="percentComplete" type="number" value="${taskInstance.percentComplete}" required=""/>
</div>

