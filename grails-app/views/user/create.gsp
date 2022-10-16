<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <asset:stylesheet src="Styles.css"/>
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
                    Ajouter un nouveau utilisateur
                </h1>
            </div>

        <div id="create-user" class="content scaffold-create" role="main">
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
                        <g:select name="role" from="${['Administrator','Advertiser']}"/>
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
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save btn btn--radius-2 btn-primary"
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
