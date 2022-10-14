<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="styleNav.css"/>
    <asset:stylesheet src="sb-admin-2.min.css"/>



%{--
Commentaire --}%
    <g:layoutHead/>
</head>
<body>
<div class="wrapper">
    <div class="side">
        <h2> <a class="navbar-brand" href="/#">
            <asset:image src="logo.png" alt="Grails Logo"/>
        </a></h2>

        <ul>

            <li><a href="/#"><i class="fas fa-user"></i>Dashboard<a></li>
            <li><g:link controller="user" action="index"><i class="fas fa-address-card"></i>Utilisateurs</g:link></li>
            <li><g:link controller="annonce" action="index"><i class="fas fa-project-diagram"></i>Annonces</g:link></li>

        </ul>
        <div class="social_media">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
        </div>
    </div>
    <div class="main_content">
        <div class="header navbar navbar-expand navbar-light topbar mb-4 static-top shadow">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="navbar-collapse collapse " aria-expanded="false" style="height: 0.8px;"
                <ul class="nav navbar-nav navbar-right">
                    <g:pageProperty name="page.nav" />
                </ul>
            </div>
        </div>
        <div class="info">
            <g:layoutBody/>
        </div>

    </div>

</div>



    <div class="footer" role="contentinfo"></div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
