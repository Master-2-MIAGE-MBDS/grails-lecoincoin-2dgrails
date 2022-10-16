<%--
  Created by IntelliJ IDEA.
  User: missflawless
  Date: 09/10/2022
  Time: 16:50
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="styles.css"/>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <asset:stylesheet rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <asset:stylesheet rel="stylesheet" href="assets/css/templatemo.css"/>
    <asset:stylesheet rel="stylesheet" href="assets/css/custom.css"/>

    <!-- Load fonts style after rendering the layout styles -->
    <asset:stylesheet rel="stylesheet"
                      href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap"/>
    <asset:stylesheet rel="stylesheet" href="assets/css/fontawesome.min.css"/>

    <!-- Slick -->
    <asset:stylesheet rel="stylesheet" type="text/css" href="assets/css/slick.min.css"/>
    <asset:stylesheet rel="stylesheet" type="text/css" href="assets/css/slick-theme.css"/>
</head>

<body>
<div class="navAds" role="navigation">
    <ul>
        <li><a class="home bouton bouton-primary" href="${createLink(uri: '/')}"><i class="fa fa-home fa-2x"></i><g:message
                code="default.home.label"/></a></li>
        <li><g:link class="list bouton bouton-primary" action="index"><i class="fa fa-list fa-2x"></i><g:message code="default.list.label"
                                                                                 args="[entityName]"/></g:link></li>
        <li><g:link class="create bouton bouton-primary" action="create"><i class="fa fa-bullhorn fa-2x"></i><g:message code="default.new.label"
                                                                                    args="[entityName]"/></g:link></li>
    </ul>
</div>
<section class="bg-light">
    <div class="container pb-5">
        <div class="row card show">
            <div class="col-lg-8 mt-8">
                <div class="cardads mb-3">
                    <section class="carousel" aria-label="Gallery">
                        <ol class="carousel__viewport">
                            <g:if test="${this.annonce.illustrations}">
                                <g:each status="i" var="it" in="${this.annonce.illustrations}">

                                    <li id="carousel__slide${i + 1}"
                                        tabindex="0"
                                        class="carousel__slide">
                                        <img class="card-img-top"
                                             src="${grailsApplication.config.illustrations.baseUrl + it.filename}"
                                             alt="..."/>

                                        <div class="carousel__snapper">
                                            <g:if test="${this.annonce.illustrations[i]}">
                                                <a href="#carousel__slide${i}"
                                                   class="carousel__prev">Image précédente</a>
                                            </g:if>
                                            <g:if test="${this.annonce.illustrations[i + 1]}">
                                                <a href="#carousel__slide${i + 2}"
                                                   class="carousel__next">ImageSuivante</a>
                                            </g:if>
                                        </div>
                                    </li>
                                </g:each>
                            </g:if>
                            <g:else><img class="card-img-top"
                                         src="${grailsApplication.config.illustrations.baseUrl + 'soon.png'}"
                                         alt="..."/></g:else>
                        </ol>

                        <aside class="carousel__navigation">
                            <ol class="carousel__navigation-list">
                                <g:each status="i" var="it" in="${this.annonce.illustrations}">

                                    <li class="carousel__navigation-item">
                                        <a href="#carousel__slide${i + 1}"
                                           class="carousel__navigation-button">Voir la photo</a>
                                    </li>

                                </g:each>
                            </ol>
                        </aside>

                    </section>
                </div>
            </div>
            <!-- col end -->
            <div class="col-lg-4 mt-4">
                <div class="cardads">
                    <div class="card-body">
                        <h1 class="h2"><b>${this.annonce.title}</b></h1>

                        <p class="h3 py-2"><b>Price:</b>${this.annonce.price}€</p>

                        <h2 class="h3 py-2"><b>Description:</b></h2>

                        <p>${this.annonce.description}</p>

                        <p class="h3 py-2"><b>Author:</b>  ${this.annonce.author.username}</p>

                        <p class="h3 py-2"><b>Status:</b>
                            <g:if test="${this.annonce.active}"><span
                                    class="bouton btn-success">Active ad</span></g:if>
                            <g:else><span class="bouton btn-danger">Inactive ad</span></g:else></p>
                    <p>
                        <sec:ifAnyGranted roles="ROLE_ADVERTISER">
                            <g:if test="${this.annonce.author.username.toString()==sec.loggedInUserInfo(field: 'username').toString()}">
                            <div class="nav" role="navigation" style="margin:20px">
                                <g:form resource="${this.annonce}" method="DELETE">

                                    <ul>
                                        <li><g:link class="edit bouton bouton-primary" action="edit"
                                                    resource="${this.annonce}"><g:message
                                                    code="default.button.Modifier.label" default="Edit"/></g:link>
                                        </li>
                                        <li><input class="delete bouton bouton-primary" type="submit"
                                                   value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                   onclick="return confirm('Are you sure you want to delete this ad?');"/>
                                        </li>
                                    </ul>

                                </g:form></div>
                            </g:if>
                        </sec:ifAnyGranted>

                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                                <div class="nav" role="navigation" style="margin:20px">
                                    <g:form resource="${this.annonce}" method="DELETE">

                                        <ul>
                                            <li><g:link class="edit bouton bouton-primary" action="edit"
                                                        resource="${this.annonce}"><g:message
                                                        code="default.button.Modifier.label" default="Edit"/></g:link>
                                            </li>
                                            <li><input class="delete bouton bouton-primary" type="submit"
                                                       value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                       onclick="return confirm('Are you sure you want to delete this ad?');"/>
                                            </li>
                                        </ul>

                                    </g:form></div>
                        </sec:ifAnyGranted>
                    </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>