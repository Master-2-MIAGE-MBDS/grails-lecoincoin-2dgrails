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
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home btn btn-primary" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list btn btn-primary" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div>

            <h1 class="heading">
                Ajouter une nouvelle annonce
            </h1>
        </div>

        <div class="content">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="card row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <g:form enctype='multipart/form-data' action="save" method="POST">
                        <div class="form-row">
                            <div class="name">Titre</div>

                            <div class="value">
                                <g:field class="input--style" type="text" name="title" id="title" placeholder="Titre de l'annonce"/>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Prix</div>

                            <div class="value">
                                <g:field class="input--style" type="number" name="price" id="price" placeholder="Prix"/>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Description</div>

                            <div class="value">
                                <g:textArea class="textarea--style" name="description" id="description"
                                            placeholder="Description de l'annonce "/>

                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Active</div>
                            <div class="ckb">
                                <g:checkBox name="active" id="active" value="${false}"/>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Illustration</div>

                            <div class="ckb">
                                <div class="js-input-file">
                                    <input class="input-file" type="file" name="illustrationFiles" id="illustrations" multiple accept="image/*">
                                </div>

                            </div>
                        </div>
                        <div class="form-row">
                            <div class="name">Auteur</div>
                            <div class="ckb">
                                <g:select name="author" from="${this.userList}" id="author" optionKey="id" optionValue="username"/>
                            </div>
                        </div>

                        <div class="card-footer">
                            <fieldset class="">
                                <g:submitButton name="create" class="save btn btn--radius-2 btn-primary"
                                                value="Créer l'annonce"/>
                            </fieldset>
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>