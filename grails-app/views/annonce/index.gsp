<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/fav.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

        <asset:stylesheet src="application.css"/>
        <asset:stylesheet src="styles.css"/>
    </head>
    <body>
    <section class="wrapper py-5">
        <div class="container-fostrap card">
            <div>
                <div class="row barresearchadd">
                    <div class="search col-md-6"><i class='bx bx-search-alt'></i> <input type="text" placeholder="Rechercher">
                    </div>

                    <div class="col-md-6"><g:link class="create btn btn-primary" action="create">
                        + Nouvelle annonce
                    </g:link></div>

                </div>

                <h1 class="heading">
                    Liste des Annonces
                </h1>
            </div>

            <div class="content">
                <div class="container px-4 px-lg-5 mt-5">
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                        <g:each in="${annonceList}">
                            <div class="ad col-xs-12 col-sm-4">
                                <div class="card">
                                    <a class="img-card" href="">
                                        <img class="card-img-top" src="https://dummyimage.com/600x400/ab9eab/b5b6c4.jpg"
                                             alt="..."/>
                                    </a>

                                    <div class="card-content">
                                        <h4 class="card-title">
                                            <g:link class="show" action="show" id="${it.id}">${it.title}
                                            </g:link>
                                        </h4>

                                        <p class="">
                                            ${it.description}
                                        </p>

                                        <p class="price"><b>${it.price}</b> €</p>
                                    </div>

                                    <div class="card-read-more">
                                        <a href="" class="btn btn-link btn-block">
                                            Voir plus
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </g:each>

                    </div>

                    <div class="pagination">
                        <g:paginate total="${annonceCount ?: 0}" max="9"/>
                    </div>
                </div>
            </div>
        </div>
    </section>

    </body>
</html>