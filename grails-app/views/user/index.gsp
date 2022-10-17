<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:stylesheet src="styleuser.css"/>
        <g:set var="entityName" value="${message(code: 'user.label', default: 'Users')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <a class="bouton bouton-primary" href="${createLink(uri: '/')}"><i class="fa fa-home fa-2x"></i>Home</a>
            <g:form action="find" controller="user" method="POST">
                    <g:field type="search" name="search" placeholder="Search user" id="searchfield"/>


                    <g:submitButton name="Btnsearch" class="save bouton bouton--radius-2 bouton-primary"
                                    value="Search"/>

            </g:form>
            <g:link class="bouton bouton-primary" action="create"><i class="fa fa-user fa-2x"></i>New user</g:link>
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
                    <div class="colonne colonne-6">Role</div>
                    <div class="colonne colonne-7">Action</div>
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
                        <g:link class="create bouton bouton-primary" action="show" id="${it.id}">
                            Click to see more
                        </g:link>


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