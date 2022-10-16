<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:stylesheet src="application.css"/>
        <asset:stylesheet src="styles.css"/>
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/fav.ico"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    </head>
    <body>
    <section class="wrapper py-5">
        <div class="container-fostrap card">
            <div class="navAds" role="navigation">
                <ul>
                    <li><a class="home bouton bouton-primary" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link class="list bouton bouton-primary" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div>
                <h1 class="heading">
                    Add new user
                </h1>
            </div>

        <div class="content" id="create-user" role="main">
            <div class="card row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"
                    </g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form enctype='multipart/form-data' action="save" method="POST">
                <div class="form-row">
                    <div class="name">Username</div>
                    <div class="value">
                        <g:field class="input--style" type="text" name="username" id="username"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name">Password</div>
                    <div class="value">
                        <g:field class="input--style" type="password" name="password" id="password"/>
                    </div>
                </div>

                <div class="form-row">
                    <div class="name">Rôle</div>
                    <div class="value">
                        <g:select name="role" from="${['Aucun','Administrator','Advertiser']}"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name">Password Expired</div>
                    <div class="value">
                        <g:checkBox name="passwordExpired" id="passwordExpired" value="${false}"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name">Account Locked</div>
                    <div class="value">
                        <g:checkBox name="accountLocked" id="accountLocked" value="${false}"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name">Account Expired</div>

                    <div class="value">
                        <g:checkBox name="accountExpired" id="accountExpired" value="${false}"/>
                    </div>
                </div>
                <div class="form-row">
                    <div class="name">Enable</div>
                    <div class="value">
                        <g:checkBox name="enabled" id="enabled" value="${false}"/>
                    </div>
                </div>
                <div class="card-footer">
                    <fieldset class="">
                        <g:submitButton name="create" class="save bouton bouton--radius-2 bouton-primary"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    </fieldset>
                </div>
            </g:form>
            </div>
        </div>
        </div>
    </section>
    </body>
</html>
