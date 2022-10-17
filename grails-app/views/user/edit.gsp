<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <asset:stylesheet src="application.css"/>
        <asset:stylesheet src="styles.css"/>

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
                    Edit user ${user.username}
                </h1>
            </div>

        <div id="edit-user" class="content" role="main">
            <div class="card row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form enctype='multipart/form-data' action="update" method="PUT" id="${user.id}">
                <div class="form-row">
                    <div class="name">Username</div>
                    <div class="value">
                        <g:field class="input--style" type="text" name="username" id="username" value="${user.username}"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name">Password</div>
                    <div class="value">
                        <g:field class="input--style" type="password" name="password" id="password" value="${user.password}"/>
                    </div>
                </div>
                <div class="form-row"> <div class="name">Current role(s)</div>
                    <div class="value">
                        <g:each var="role" in="${user.getAuthorities()}">
                            <g:if test="${role.authority=="ROLE_ADMIN" }"><span class="badge admin">Administrator</span>
                            </g:if><g:else><span class="badge">Advertiser</span></g:else>
                        </g:each>
                       <span><b>Delete these role(s):</b> <g:checkBox name="deleteRole" id="deleteRole" value="${FALSE}"/></span>
                    </div>
                    <div class="name">Role(s)</div>
                    <div class="value">
                        <g:select name="role" from="${['None','Administrator','Advertiser']}"/>
                    </div>

                </div>
                <div class="form-row">
                    <div class="name">Password Expired</div>
                    <div class="value">
                        <g:checkBox name="passwordExpired" id="passwordExpired" value="${user.passwordExpired}"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name">Account Locked</div>
                    <div class="value">
                        <g:checkBox name="accountLocked" id="accountLocked"  value="${user.accountLocked}"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name">Account Expired</div>
                    <div class="value">
                        <g:checkBox name="accountExpired" id="accountExpired" value="${user.accountExpired}"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name">Enable</div>
                    <div class="value">
                        <g:checkBox name="enabled" id="enabled" value="${user.enabled}"/>
                    </div>
                </div>
                <div class="card-footer">
                    <fieldset class="">
                        <g:submitButton name="Update" class="save bouton bouton--radius-2 bouton-primary" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </fieldset>
                </div>
            </g:form>
            </div>
        </div>
        </div>
    </section>
    </body>
</html>