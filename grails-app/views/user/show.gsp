<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <asset:stylesheet src="styles.css"/>
        <asset:stylesheet src="application.css"/>

        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <section class="wrapper py-5">
        <div class="container-fostrap card">
            <div class="navAds" role="navigation">
                <ul>
                    <li><a class="home bouton bouton-primary" href="${createLink(uri: '/')}"><i class="fa fa-home fa-2x"></i><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list bouton bouton-primary" action="index"><i class="fa fa-list fa-2x"></i><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                    <li><g:link class="create bouton bouton-primary" action="create"><i class="fa fa-user fa-2x"></i><g:message code="default.new.label" args="[entityName]" /></g:link></li>

                </ul>
            </div>
                <div>
                <h1 class="heading">
                    Informations of ${this.user.username}
                </h1>
                </div>


            <div class="content" id="create-user" role="main">
                <div class="card row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form enctype='multipart/form-data'>
                <div class="card-footer">
                    <sec:ifAnyGranted roles="ROLE_ADMIN">
                        <div class="navAds show" role="navigation" style="margin:20px">
                            <g:form resource="${this.user}" method="DELETE">
                                <g:link class=" bouton bouton-primary" action="edit" resource="${this.user}"><g:message code="default.button.Modifier.label" default="Edit" /></g:link>
                                <input class=" bouton bouton-primary" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Êtes-vous sûr de vouloir supprimer cette annonce?')}');" />

                            </g:form> </div>
                    </sec:ifAnyGranted>
                </div>
                <div class="form-row">
                    <div class="name"><b class="h3">Username :</b></div>
                    <div class="value">${this.user.username}
                    </div>
                    <span class="h3 py-2"></span>
                </div>
                <div class="form-row">
                    <div class="name"><b class="h3">Rôle:</b>
                    </div>

                    <div class="value">
                    <g:each var="role" in="${user.getAuthorities()}">
                        <g:if test="${role.authority=="ROLE_ADMIN"}"><span class="badge admin">ROLE_ADMIN</span>
                        </g:if><g:else><span class="badge">ROLE_ADVERTISER</span></g:else>
                    </g:each>
                    </div>


                </div>
                <div class="form-row">
                    <div class="name"><b class="h3">Password Expired :</b></div>

                    <div class="value">
                        <g:if test="${this.user.accountExpired}"><span class="badge danger">Expired</span></g:if>
                        <g:else><span class="badge">Not Expired</span></g:else></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name"><b class="h3">Account Locked :</b></div>

                    <div class="value">
                        <g:if test="${this.user.accountLocked}"><span class="badge danger">Expired</span></g:if>
                        <g:else><span class="badge">Not Expired</span></g:else></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name"><b class="h3">Account Expired:</b></div>

                    <div class="value">
                        <g:if test="${this.user.accountExpired}"><span class="badge danger">Expired</span></g:if>
                        <g:else><span class="badge">Not Expired</span></g:else></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name"><b class="h3">Enable :</b></div>

                    <div class="value">
                        <g:if test="${this.user.enabled}"><span class="badge danger">Expired</span></g:if>
                        <g:else><span class="badge">Not Expired</span></g:else></p>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-row">
                        <div class="name"><b class="h3">Annonce(s):</b></div>

                        <div class="value">
                <g:each status="i" var="it" in="${this.user.annonces}">
                    <div class="ad col-xs-12 col-sm-4">
                        <div class="card">
                            <g:link class="show img-card" controller="annonce" action="show" id="${it.id}">
                                <g:if test="${it.illustrations[0]}">
                                    <img class="card-img-top"
                                         src="${grailsApplication.config.illustrations.baseUrl + it.illustrations[0].filename}"
                                         alt="..."/>
                                </g:if>
                                <g:else><img class="card-img-top"
                                             src="${grailsApplication.config.illustrations.baseUrl + 'soon.png'}"
                                             alt="..."/></g:else>
                            </g:link>


                            <div class="card-content">
                                <h4 class="card-title">
                                    <g:link class="show" controller="annonce" action="show" id="${it.id}">${it.title}
                                    </g:link>
                                </h4>

                                <p class="">
                                    ${it.description}
                                </p>

                                <p class="price"><b>${it.price}</b> €</p>
                            </div>

                            <div class="card-read-more">
                                <g:link class="show bouton bouton-link bouton-block" controller="annonce" action="show"
                                        id="${it.id}">Voir plus
                                </g:link>
                            </div>
                        </div>
                    </div>
                </g:each>
                        </div>
                    </div>
                </div>

            </g:form>

            </div>

        </div>
        </div>
    </section>
    </body>
</html>
