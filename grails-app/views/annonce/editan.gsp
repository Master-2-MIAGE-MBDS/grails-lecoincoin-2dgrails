<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
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

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <asset:stylesheet rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <asset:stylesheet rel="stylesheet" href="assets/css/templatemo.css"/>
    <asset:stylesheet rel="stylesheet" href="assets/css/custom.css"/>

    <!-- Load fonts style after rendering the layout styles -->
    <asset:stylesheet rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap"/>
    <asset:stylesheet rel="stylesheet" href="assets/css/fontawesome.min.css"/>

    <!-- Slick -->
    <asset:stylesheet rel="stylesheet" type="text/css" href="assets/css/slick.min.css"/>
    <asset:stylesheet  rel="stylesheet" type="text/css" href="assets/css/slick-theme.css"/>
</head>

<body>
<section class="wrapper py-5">
    <div class="container-fostrap card">
        <div>

            <h1 class="heading">
                Modifier l'annonce
            </h1>
        </div>

        <div class="content">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <g:form enctype='multipart/form-data' resource="${this.annonce}" action="update" method="PUT">
                        <div class="form-row">
                            <div class="name">Titre</div>

                            <div class="value">
                                <g:field value="${this.annonce.title}" class="input--style" type="text" name="title" id="title"/>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Prix</div>

                            <div class="value">
                                <g:field value="${this.annonce.price}"  class="input--style" type="number" name="price" id="price"/>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Description</div>

                            <div class="value">
                                <g:textArea value="${this.annonce.description}"  class="textarea--style" name="description" id="description"
                                            placeholder="Description de l'annonce "/>

                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Active</div>
                            <div class="value">
                                <g:checkBox name="active" id="active" value="${this.annonce.active}" />
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Changer les Illustrations</div>

                            <div class="value">
                                <div class="js-input-file">
                                    <input class="input-file" type="file" name="illustrationz" id="illustrations" multiple>
                                </div>

                            </div>

                            <div class="name">Illustrations actuellement enregistrés</div>

                        </div>
                        <div class="form-row">
                            <div class="name">Auteur</div>
                            <div class="value">
                                <g:select name="author" from="${this.userList}" optionKey="id"/>
                            </div>
                        </div>

                        <div class="card-footer">
                            <fieldset class="buttons">
                                <g:submitButton name="create" class="save btn btn--radius-2 btn-primary"
                                                value="Modifier l'annonce"/>
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