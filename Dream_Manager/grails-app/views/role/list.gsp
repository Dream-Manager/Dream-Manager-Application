

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'Role.label', default: 'Role')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'Role.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'Role.name.label', default: 'Name')}" />
                        
                            <th>${message(code: 'User.users.label', default: 'Users')}</th>
                        
                            <th>${message(code: 'User.permissions.label', default: 'Permissions')}</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${RoleInstanceList}" status="i" var="RoleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${RoleInstance.id}">${fieldValue(bean: RoleInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: RoleInstance, field: "name")}</td>
                        
							<td>${fieldValue(bean: RoleInstance, field: "users")}</td>
							
							<td>${fieldValue(bean: RoleInstance, field: "permissions")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${RoleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
