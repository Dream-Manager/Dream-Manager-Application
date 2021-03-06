
<!doctype html>
<html>
	<head>
		
		<g:set var="title" value="${message(code: 'updatePassword', default: 'Update Password')}" />
		<title>${title}</title>
	</head>
	<body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
        </div>
        <div class="body">
			<h1>${title}</h1>
			<g:form action="doUpdatePassword" >
				<fieldset class="form">
					<div class="fieldcontain">
						Please update your password here :<br/><br/>
					</div>
					<div class="fieldcontain required">
						<label for="oldpassword">
							<g:message code="User.oldpassword.label" default="Old Password" />
						</label>
						<g:passwordField name="oldpassword" required=""/>
					</div>
					<div class="fieldcontain required">
						<label for="password1">
							<g:message code="User.password1.label" default="New Password" />
						</label>
						<g:passwordField name="password1" required=""/>
					</div>
					<div class="fieldcontain required">
						<label for="password2">
							<g:message code="User.password2.label" default="Repeat Password" />
						</label>
						<g:passwordField name="password2" required=""/>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton class="save" name="update" value="${message(code: 'default.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
