<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:stylesheet src="StyleUsers.css"/>
        <g:set var="entityName" value="${message(code: 'user.label', default: 'Users')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <a class="btn home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
            <g:form action="find" controller="user" method="POST">
                    <g:field type="search" name="search" placeholder="Rechercher"/>


                    <g:submitButton name="create" class="save bouton bouton--radius-2 bouton-primary"
                                    value="Rechercher"/>

            </g:form>
            <g:link class="btn create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <div id="list-user" class="scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="container">
            <ul class="responsive-table">
                <li class="table-header">
                    <div class="colonne colonne-2">Username</div>
                    <div class="colonne colonne-3">Password Expired</div>
                    <div class="colonne colonne-4">Account Expired </div>
                    <div class="colonne colonne-5">Enabled </div>
                    <div class="colonne colonne-6">Rôle</div>
                    <div class="colonne colonne-7">Actions</div>
                </li>
                <g:each in="${userList}">
                    <li class="table-row">
                        <div class="colonne colonne-2" data-label="Customer Name">${it.username}</div>
                        <div class="colonne colonne-3" data-label="Amount"><g:if test="${it.passwordExpired}"><span class="badge danger">Expired</span>
                        </g:if><g:else><span class="badge">Not Expired</span></g:else></div>
                        <div class="colonne colonne-4" data-label="Payment Status"><g:if test="${it.accountExpired}"><span class="badge danger">Expired</span>
                        </g:if><g:else><span class="badge">Not Expired</span></g:else></div>
                        <div class="colonne colonne-5" data-label="Payment Status"><g:if test="${it.enabled}"><span class="badge danger">Disabled</span>
                        </g:if><g:else><span class="badge">Enabled</span></g:else></div>
                        <div class="colonne colonne-6" data-label="Payment Status">
                            <g:each var="role" in="${it.getAuthorities()}">
                                <g:if test="${role.authority=="ROLE_ADMIN" || role.authority=="ROLE ADMIN"  }"><span class="badge admin">Administrator</span>
                                </g:if><g:else><span class="badge">Advertiser</span></g:else></g:each>
                        </div>
                    <div class="colonne colonne-7">
                        <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_ADVERTISER,ROLE ADMIN, ROLE ADVERTISER">

                                <g:form resource="${it}" method="DELETE">
                                    <p class="icon">

                                        <g:link class="iconView edit"  action="edit" id="${it.id}"></g:link>

                                         <input class="delete iconDelete" type="submit" value="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Êtes-vous sûr de vouloir supprimer cette annonce?')}');" />

                                    </p>
                                </g:form>

                        </sec:ifAnyGranted>

                    </div>
                </g:each>
            </ul>
            </div>
            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
    </body>
</html>