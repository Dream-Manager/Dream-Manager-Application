

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<g:set var="entityName"
	value="${message(code: 'Role.label', default: 'ShiroRole')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="nav">
		<span class="menuButton"><a class="home"
			href="${createLink(uri: '/')}"><g:message
					code="default.home.label" /></a></span> <span class="menuButton"><g:link
				class="list" action="list">
				<g:message code="default.list.label" args="[entityName]" />
			</g:link></span> <span class="menuButton"><g:link class="create"
				action="create">
				<g:message code="default.new.label" args="[entityName]" />
			</g:link></span>
	</div>
	<div class="body">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>s
		<div class="dialog">
			<table>
				<tbody>

					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="Role.name.label" default="Name" /></td>

						<td valign="top" class="value">
							${fieldValue(bean: RoleInstance, field: "name")}
						</td>

					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="User.permissions.label" default="Permissions" /></td>

						<td valign="top" class="value"><g:each
								in="${RoleInstance.permissions}" var="permission">
								<ul>
									<li>
										${permission?.encodeAsHTML()}
									</li>
								</ul>
							</g:each></td>

					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="Role.users.label" default="Users" /></td>

						<td valign="top" style="text-align: left;" class="value">
							<ul>
								<g:each in="${RoleInstance.users}" var="u">
									<li><g:link controller="User" action="show" id="${u.id}">
											${u?.encodeAsHTML()}
										</g:link></li>
								</g:each>
							</ul>
						</td>

					</tr>

					<tr class="prop">
						<td valign="top" class="name"><g:message
								code="User.description.label" default="Description" /></td>

						<td valign="top" class="value">
							${fieldValue(bean: RoleInstance, field: "description")}
						</td>

					</tr>

				</tbody>
			</table>
		</div>
		<div class="buttons">
			<g:form>
				<g:hiddenField name="id" value="${RoleInstance?.id}" />
				<span class="button"><g:actionSubmit class="edit"
						action="edit"
						value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
				<span class="button"><g:actionSubmit class="delete"
						action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
			</g:form>
		</div>
	</div>
</body>
</html>
