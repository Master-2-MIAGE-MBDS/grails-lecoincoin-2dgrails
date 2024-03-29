<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
    <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="stylenav.css"/>
    <asset:stylesheet src="sb-admin-2.min.css"/>
    <asset:stylesheet src="main.css"/>



    %{--
    Commentaire --}%
    <g:layoutHead/>
</head>

<body>
<div class="wrapper">
    <!-- Sidebar -->
    <nav class="main-menu">
        <div class="firstul">
            <ul>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li>
                        <a class="nav-link" href="${createLink(uri: '/admin/dashboard')}">
                            <i class="fa fa-home fa-2x"></i>
                            <span class="nav-text">
                                Dashboard
                            </span>
                        </a>

                    </li>
                    <li class="has-subnav">
                        <g:link controller="user" action="index" class="nav-link collapsed"
                                aria-expanded="true" aria-controls="collapseTwo">
                            <i class="fa fa-user fa-2x"></i>
                            <span class="nav-text">
                                Users
                            </span>
                        </g:link>

                    </li>
                </sec:ifAnyGranted>

                <li class="has-subnav">
                    <g:link controller="annonce" action="index" class="nav-link collapsed"
                            aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fa fa-bullhorn fa-2x"></i>
                        <span class="nav-text">
                            Ads
                        </span>
                    </g:link>

                </li>

            </ul>
        </div>
        <ul class="logout">
            <li>

                <a href="#">
                    <i class="fa fa-power-off fa-2x"></i>
                    <span class="nav-text">
                        Logout
                    </span>
                </a>
            </li>
        </ul>
    </nav>

    <header class="header">
        <div class="nav">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <asset:image src="logo.png" alt="Grails Logo"/>
            </a>
            <h1
                    class="welcome align-items-center justify-content-center">Welcome <b>${sec.loggedInUserInfo(field: 'username')}</b>
            </h1>
            <div class="auth">
                <ul>
                    <sec:ifNotLoggedIn><li><g:form controller="login">
                        <g:submitButton class="create bouton bouton-primary" name="login" value="Login"/>
                    </g:form></li></sec:ifNotLoggedIn>

                    <sec:ifLoggedIn>
                        <li><g:form controller="logout">
                            <g:submitButton class="create bouton bouton-primary" name="logout" value="Logout"/>
                        </g:form></li>
                    </sec:ifLoggedIn>

                </ul>
            </div>
        </div>
    </header>
    <!-- End of Topbar -->

    <div class="info">
        <g:layoutBody/>
    </div>

</div>

</div>



%{--    <div class="footer" role="contentinfo"></div>--}%

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
