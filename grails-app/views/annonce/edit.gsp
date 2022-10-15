<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
                <li><a class="home bouton bouton-primary" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list bouton bouton-primary" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div>

            <h1 class="heading">
                Modifier l'annonce
            </h1>
        </div>

        <div class="content">
            <div class="px-4 px-lg-5 mt-5">
                <div class="card row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <g:form enctype='multipart/form-data' controller="annonce" action="update" method="POST">
                        <div class="form-row">
                            <div class="name">Titre</div>

                            <div class="value">
                                <g:field value="${this.annonce.title}" class="input--style" type="text" name="title" id="title" placeholder="Titre de l'annonce"/>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Prix</div>

                            <div class="value">
                                <g:field value="${this.annonce.price}" class="input--style" type="number" name="price" id="price" placeholder="Prix"/>
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
                            <div class="ckb">
                                <g:checkBox name="active" id="active" value="${this.annonce.active}" />
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="name">Changer les Illustrations</div>

                            <div class="ckb">
                                <div class="js-input-file">
                                    <input class="input-file" type="file" name="illustrationFiles" id="illustrations" multiple accept="image/*">
                                </div>

                            </div>
                        </div>
                        <div class="form-row">
                             <div class="name ">Illustrations actuellement enregistrés</div>
                            <div class="value">
                                <div class="cardads mb-3">
                                    <section class="carousel" aria-label="Gallery">
                                        <ol class="carousel__viewport">
                                            <g:if test="${this.annonce.illustrations}">
                                                <g:each status="i" var="it" in="${this.annonce.illustrations}" >

                                                    <li id="carousel__slide${i+1}"
                                                        tabindex="0"
                                                        class="carousel__slide">
                                                        <img class="card-img-top" src="${grailsApplication.config.illustrations.baseUrl+it.filename}"
                                                             alt="..."/>
                                                        <div class="carousel__snapper">
                                                            <g:if test="${this.annonce.illustrations[i]}">
                                                                <a href="#carousel__slide${i}"
                                                                   class="carousel__prev">Image précédente</a>
                                                            </g:if>
                                                            <g:if test="${this.annonce.illustrations[i+1]}">
                                                                <a href="#carousel__slide${i+2}"
                                                                   class="carousel__next">ImageSuivante</a>
                                                            </g:if>
                                                        </div>
                                                    </li>
                                                </g:each>
                                            </g:if>
                                            <g:else> <img class="card-img-top" src="${grailsApplication.config.illustrations.baseUrl+'soon.png'}"
                                                          alt="..."/></g:else>
                                        </ol>

                                        <aside class="carousel__navigation">
                                            <ol class="carousel__navigation-list">
                                                <g:each status="i" var="it" in="${this.annonce.illustrations}">

                                                    <li class="carousel__navigation-item">
                                                        <a href="#carousel__slide${i+1}"
                                                           class="carousel__navigation-button">Voir la photo</a>
                                                    </li>

                                                </g:each>
                                            </ol>
                                        </aside>

                                    </section>
                                </div>

                            </div>
                        </div>

                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE ADMIN">
                        <div class="form-row">
                            <div class="name">Auteur</div>
                            <div class="ckb">
                                <g:select name="author" from="${this.userList}" id="author" optionKey="id" optionValue="username" value="${this.annonce.author.id}"/>
                            </div>
                        </div>
                        </sec:ifAnyGranted>
                        <div class="card-footer">
                            <fieldset class="">
                                <g:submitButton name="create" class="save bouton bouton--radius-2 bouton-primary"
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