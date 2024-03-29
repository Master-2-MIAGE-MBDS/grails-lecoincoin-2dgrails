<%--
  Created by IntelliJ IDEA.
  User: binet
  Date: 13/10/2022
  Time: 18:06
--%>

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
</head>

<section class="wrapper py-5">
    <div class="content">
        <h1>Dashboard</h1>

        <div class="card row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

            <div class="container-fostrap card">


                <div class="row justify-content-center">

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                    <i class="fa fa-user fa-2x"></i>
                                </div>
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            Users
                                        </div>

                                        <div class="h5 mb-0 font-weight-bold text-gray-800">${com.mbds.grails.User.getCount()}</div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                    <i class="fa fa-bullhorn fa-2x"></i>
                                </div>
                                    <div class="col mr-2">

                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            Ads</div>

                                        <div class="h5 mb-0 font-weight-bold text-gray-800">${com.mbds.grails.Annonce.getCount()}</div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col-auto">
                                    <i class="fa fa-bars fa-2x"></i>
                                </div>
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                            Illustrations</div>

                                        <div class="h5 mb-0 font-weight-bold text-gray-800">${com.mbds.grails.Illustration.getCount()}</div>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fostrap card">
                <h2 class="justify-content-center">Gestion des utilisateurs</h2>

                <div class="row justify-content-center">

                    <div class="col-xl-4 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <g:link controller="user" action="create">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                Ajout d'un utilisateur</div>
                                        </div>

                                    </g:link>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <g:link controller="user" action="index">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                Liste des utilisateurs</div>

                                        </div>
                                    </g:link>
                                    <div class="col-auto">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="container-fostrap card">
                <h2 class="justify-content-center">Gestion des annonces</h2>

                <div class="row justify-content-center">

                    <div class="col-xl-4 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <g:link controller="annonce" action="create">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                Ajout d'une annonce</div>
                                        </div>
                                    </g:link>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-4 col-md-6 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <g:link controller="annonce" action="index">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                Liste des annonces</div>

                                        </div>
                                    </g:link>
                                    <div class="col-auto">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>