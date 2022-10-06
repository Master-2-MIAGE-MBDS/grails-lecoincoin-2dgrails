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
            <g:link class="btn create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </div>
        <div id="list-user" class="content scaffold-list" role="main">

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="container">
            <ul class="responsive-table">
                <li class="table-header">
                    <div class="col col-2">Username</div>
                    <div class="col col-3">Password Expired</div>
                    <div class="col col-4">Account Expired </div>
                    <div class="col col-5">Enabled </div>
                    <div class="col col-6">Annonces</div>
                    <div class="col col-6">Actions</div>
                </li>
                <g:each in="${userList}">
                    <li class="table-row">
                        <div class="col col-2" data-label="Customer Name">${it.username}</div>
                        <div class="col col-3" data-label="Amount">${it.accountExpired}</div>
                        <div class="col col-4" data-label="Payment Status">${it.accountExpired}</div>
                        <div class="col col-5" data-label="Payment Status">${it.enabled}</div>
                        <div class="col col-6" data-label="Payment Status">Annonce</div>
                        <div class="col col-7" data-label="Payment Status">
                            <p class="icon">
                                <g:link class="iconDelete"></g:link>
                                <g:link class="iconUpdate"></g:link>
                                <g:link class="iconView"></g:link>
                            </p>


                        </div>
                    </li>
                </g:each>

            </ul>
            </div>
            <div class="pagination">
                <g:paginate total="${userCount ?: 0}" />
            </div>
        </div>
    </body>
</html>