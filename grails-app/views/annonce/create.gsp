<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/fav.ico"/>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>

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
            </ul>
        </div>
        <div>

            <h1 class="heading">
                Add new ad
            </h1>
        </div>

        <div class="content">
                <div class="card row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <g:form  enctype='multipart/form-data' controller="annonce" action="save" method="POST">
                        <div class="form-row">
                            <div class="name">Title</div>

                            <div class="value">
                                <g:field minlength="5" class="input--style" type="text" name="title" id="title" placeholder="Ad title" required=""/>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Price</div>

                            <div class="value">
                                <input pattern="[0-9]+([,][0-9]{1,2})?" class="input--style" type="number decimal" placeholder="Price Ex:12,999" name="price" value="" required="" step="0.01" min="0.0" id="price">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Description</div>

                            <div class="value">
                                <g:textArea class="textarea--style" name="description" id="description"
                                            placeholder="Ad Description " required=""/>

                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Active</div>
                            <div class="ckb">
                                <g:checkBox name="active" id="active" value="${false}"/>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Illustrations</div>

                            <div class="ckb">
                                <div class="js-input-file">
                                    <input class="input-file" type="file" name="illustrationFiles" id="illustrations" multiple accept="image/*">
                                </div>

                            </div>
                        </div>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                        <div class="form-row">
                            <div class="name">Author</div>
                            <div class="ckb">
                                <g:select name="author" from="${this.userList}" id="author" optionKey="id" optionValue="username"/>
                            </div>
                        </div>
                        </sec:ifAnyGranted>

                        <div class="card-footer">
                            <fieldset class="">
                                <g:submitButton name="create" class="save bouton bouton--radius-2 bouton-primary"
                                                value="Create Ad"/>
                            </fieldset>
                        </div>
                    </g:form>
                </div>
        </div>
    </div>
</section>

</body>
</html>