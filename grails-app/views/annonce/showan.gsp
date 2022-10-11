<%--
  Created by IntelliJ IDEA.
  User: missflawless
  Date: 09/10/2022
  Time: 16:50
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>

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
<div class="nav" role="navigation">
    <ul>
        <li><a class="home btn btn-primary" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list btn btn-primary" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create btn btn-primary" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<section class="bg-light">
    <div class="container pb-5">
        <div class="row">
            <div class="col-lg-5 mt-5">
                <div class="cardads mb-3">
                    <section class="carousel" aria-label="Gallery">
                        <ol class="carousel__viewport">
                            <li id="carousel__slide1"
                                tabindex="0"
                                class="carousel__slide">
                                <div class="carousel__snapper">
                                    <a href="#carousel__slide4"
                                       class="carousel__prev">Go to last slide</a>
                                    <a href="#carousel__slide2"
                                       class="carousel__next">Go to next slide</a>
                                </div>
                            </li>
                            <li id="carousel__slide2"
                                tabindex="0"
                                class="carousel__slide">
                                <div class="carousel__snapper"></div>
                                <a href="#carousel__slide1"
                                   class="carousel__prev">Go to previous slide</a>
                                <a href="#carousel__slide3"
                                   class="carousel__next">Go to next slide</a>
                            </li>
                            <li id="carousel__slide3"
                                tabindex="0"
                                class="carousel__slide">
                                <div class="carousel__snapper"></div>
                                <a href="#carousel__slide2"
                                   class="carousel__prev">Go to previous slide</a>
                                <a href="#carousel__slide4"
                                   class="carousel__next">Go to next slide</a>
                            </li>
                            <li id="carousel__slide4"
                                tabindex="0"
                                class="carousel__slide">
                                <div class="carousel__snapper"></div>
                                <a href="#carousel__slide3"
                                   class="carousel__prev">Go to previous slide</a>
                                <a href="#carousel__slide1"
                                   class="carousel__next">Go to first slide</a>
                            </li>
                        </ol>
                        <aside class="carousel__navigation">
                            <ol class="carousel__navigation-list">
                                <li class="carousel__navigation-item">
                                    <a href="#carousel__slide1"
                                       class="carousel__navigation-button">Go to slide 1</a>
                                </li>
                                <li class="carousel__navigation-item">
                                    <a href="#carousel__slide2"
                                       class="carousel__navigation-button">Go to slide 2</a>
                                </li>
                                <li class="carousel__navigation-item">
                                    <a href="#carousel__slide3"
                                       class="carousel__navigation-button">Go to slide 3</a>
                                </li>
                                <li class="carousel__navigation-item">
                                    <a href="#carousel__slide4"
                                       class="carousel__navigation-button">Go to slide 4</a>
                                </li>
                            </ol>
                        </aside>
                    </section>
                </div>
            </div>
            <!-- col end -->
            <div class="col-lg-7 mt-5">
                <div class="cardads">
                    <div class="card-body">
                        <h1 class="h2">${this.annonce.title}</h1>
                        <p class="h3 py-2"><b>Prix: </b>${this.annonce.price}€</p>
                        <h2>Description:</h2>
                        <p>${this.annonce.description}</p>
                        <p><b>Auteur:</b>  ${this.user.username} </p>
                        <p><b>Status:</b>
                        <g:if test="${this.annonce.active}"> <span class="btn btn-success"> Annonce active </span></g:if>
                        <g:else><span class="btn btn-danger"> Annonce inactive </span></g:else></p>
                        <p>
                        <div class="nav" role="navigation" style="margin:20px">
                        <g:form resource="${this.annonce}" method="DELETE">

                            <ul>
                                <li><g:link class="edit btn btn-primary" action="edit" resource="${this.annonce}"><g:message code="default.button.edit.label" default="Modifier" /></g:link>
                                </li>
                                <li> <input class="delete btn btn-primary" type="submit" value="${message(code: 'default.button.delete.label', default: 'Supprimer')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Êtes-vous sûr de vouloir supprimer cette annonce?')}');" />
                                </li>
                            </ul>

                    </g:form> </div>
                    </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>