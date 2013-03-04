<%@ page import="dream_manager.Dream" %>
<!DOCTYPE html>
<html>
	<head>
		<g:javascript>
			// Register AJAX spinner events
		     function showSpinner(visible) { $('spinner').style.display = visible ? "inline" : "none"; }
		     jQuery.ajaxStart(function(){ showSpinner(true) });
		     jQuery.ajaxComplete(function(){ showSpinner(false) });
		</g:javascript>
	</head>
	<body>
		<div id="create-dream" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${dreamInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${dreamInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:formRemote name="createAjax" update="results" url="[controller: 'dream', action:'createAjax']">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<input type="submit" name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:formRemote>
		</div>
	</body>
</html>