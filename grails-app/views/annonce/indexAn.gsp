<%--
  Created by IntelliJ IDEA.
  User: missflawless
  Date: 26/09/2022
  Time: 15:43
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Annonces</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>

    <asset:stylesheet src="styles.css"/>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
</head>

<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">Start Bootstrap</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">All Products</a></li>
                        <li><hr class="dropdown-divider"/></li>
                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                        <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                    </ul>
                </li>
            </ul>

            <form class="d-flex">
                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                </button>
            </form>
        </div>
    </div>
</nav>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Shop in style</h1>

            <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
        </div>
    </div>
</header>
<!-- Section-->
<section class="wrapper py-5">
    <div class="container-fostrap card">
        <div>
            <div class="row">
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

<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
</footer>

</body>
</html>