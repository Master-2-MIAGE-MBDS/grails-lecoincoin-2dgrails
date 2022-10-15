<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <asset:stylesheet src="StyleUsers.css"/>
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home btn " href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list btn " action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create btn " action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-user" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form enctype='multipart/form-data'>
                <div class="form-row">
                    <div class="name"><b class="h3">Username :</b> <span class="h3 py-2">${this.user.username}</span></div>

                </div>
                <div class="form-row"> <div class="name"><b class="h3">Rôle:</b><span class="h3 py-2">
                    <g:each var="role" in="${user.getAuthorities()}">
                        <g:if test="${role.authority=="ROLE_ADMIN" || role.authority=="ROLE_ADMIN" }"><span class="badge admin">ROLE_ADMIN</span>
                        </g:if><g:else><span class="badge">ROLE_ADVERTISER</span></g:else>
                    </g:each>
                </span></div>


                </div>
                <div class="form-row">
                    <div class="name"><b class="h3">Password Expired :</b>
                        <g:if test="${this.user.accountExpired}"><span class="badge danger">Expired</span></span></g:if>
                        <g:else><span class="badge">Not Expired</span></g:else></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name"><b class="h3">Account Locked :</b>
                        <g:if test="${this.user.accountLocked}"><span class="badge danger">Expired</span></span></g:if>
                        <g:else><span class="badge">Not Expired</span></g:else></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name"><b class="h3">Account Expired :</b>
                        <g:if test="${this.user.accountExpired}"><span class="badge danger">Expired</span></span></g:if>
                        <g:else><span class="badge">Not Expired</span></g:else></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name"><b class="h3">Enable :</b>
                        <g:if test="${this.user.enabled}"><span class="badge danger">Expired</span></span></g:if>
                        <g:else><span class="badge">Not Expired</span></g:else></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-row">
                        <div class="name"><b class="h3">Annonce :</b> <span class="h3 py-2">${this.user.annonces.title}</span></div>
                    </div>
                </div>
                <div class="card-footer">
                    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_ADVERTISER,ROLE ADMIN, ROLE ADVERTISER">
                        <div class="nav" role="navigation" style="margin:20px">
                            <g:form resource="${this.user}" method="DELETE">

                                <ul>
                                    <li><g:link class="edit btn bouton bouton-primary" action="edit" resource="${this.user}"><g:message code="default.button.Modifier.label" default="Modifier" /></g:link>
                                    </li>
                                    <li> <input class="delete btn bouton bouton-primary" type="submit" value="${message(code: 'default.button.delete.label', default: 'Supprimer')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Êtes-vous sûr de vouloir supprimer cette annonce?')}');" />
                                    </li>
                                </ul>

                            </g:form> </div>
                    </sec:ifAnyGranted>
                </div>
            </g:form>



        </div>
    </body>
</html>
