
<!doctype html>
<html>
	<head>
		
		<g:set var="title" value="${message(code: 'lostPassword', default: 'Lost Password')}" />
		<title>${title}</title>
	</head>
	<body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
        <div class="body">
			<h1>${title}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form action="sendPasswordResetRequest" >
                <div class="dialog">
				<fieldset class="form">
				<div>You can reset your password here :<br/><br/></div>
					<div class="fieldcontain">
						<label for="username">
							<g:message code="User.username.label" default="Username or Email" />
						</label>
						<g:textField name="username"/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton class="save" name="sendRequest" value="${message(code: 'password.reset.send.label', default: 'Send Request')}" />
				</fieldset>
				</div>
			</g:form>
		</div>
	</body>
</html>
