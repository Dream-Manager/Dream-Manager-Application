


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        
        <g:set var="entityName" value="${message(code: 'Role.label', default: 'ShiroRole')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:hasErrors bean="${RoleInstance}">
            <div class="errors">
                <g:renderErrors bean="${RoleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${RoleInstance?.id}" />
                <g:hiddenField name="version" value="${RoleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="Role.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: RoleInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${RoleInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="roles"><g:message code="User.users.label" default="Users" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: RoleInstance, field: 'users', 'errors')}">
                                    <shiroui:userSelect name="users" size="10" value="${RoleInstance?.users}"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="permissions"><g:message code="User.permissions.label" default="Permissions" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: RoleInstance, field: 'permissions', 'errors')}">
                                    <shiroui:permissionSelect name="permissions" size="10" value="${RoleInstance?.permissions}"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="Role.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: RoleInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" value="${RoleInstance?.description}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
