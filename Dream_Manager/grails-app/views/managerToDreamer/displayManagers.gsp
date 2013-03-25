<%@ page import="dream_manager.User"%>
<g:form action="requestManager">
	<fieldset class="form">
		<div
			class="fieldcontain ${hasErrors(bean: userInstance, field: 'manager', 'error')} ">
			<label for="manager"> <g:message code="user.manager.label"
					default="Manager" />

			</label>
			<g:select id="manager" name="manager.id"
				from="${User.createCriteria().list(){eq("isManager",true)}}"
				optionKey="id" value="${userInstance?.manager?.id}"
				class="many-to-one" noSelection="['null': '']" />
		</div>
	</fieldset>

	<fieldset class="buttons">
		<g:submitButton name="Request Manager" class="request"
			value="Request" />
	</fieldset>
</g:form>