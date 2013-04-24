<%@ page import="dream_manager.Dream" %>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="dream.category.label" default="Category" />
	</label>
	<g:select name="category"
		noSelection="['':'']"
		from="${['Adventure','Character','Creative','Emotional','Financial','Intellectual','Legacy','Material','Physical','Professional','Psychological','Spiritual']}" 
		value="${dreamInstance?.category}" />
	     
</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="dream.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" value="${dreamInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'isShortTerm', 'error')} ">
	<label for="isShortTerm">
		<g:message code="dream.isShortTerm.label" default="Term of Dream" />
	</label>
	<g:radioGroup name="isShortTerm"
	              labels="['Short','Long']"
	              values="[true,false]" 
	              value="${dreamInstance?.isShortTerm }" >
		${it.label} ${it.radio}
	</g:radioGroup>
</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'estimatedCompletion', 'error')}">
	<label for="estimatedCompletion">
		<g:message code="dream.estimatedCompletion.label" default="Estimated Completion" />
	</label>
	<input name="estimatedCompletion" type="text" class="datepicker" value="<g:formatDate format="MM/dd/yyyy"
							date="${dreamInstance?.estimatedCompletion}" />" />
</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'percentComplete', 'error')} required">
	<label for="percentComplete">
		<g:message code="dream.percentComplete.label" default="Percent Completed" />
	</label>
	<input class="slider" name="percentComplete" value="${dreamInstance?.percentComplete}" />
</div>

<div class="fieldcontain ${hasErrors(bean: dreamInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="dream.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" value="${dreamInstance?.notes}"/>
</div>
