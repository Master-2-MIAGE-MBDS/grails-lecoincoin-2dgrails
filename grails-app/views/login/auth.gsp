<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>
    <style type="text/css" media="screen">body {
        background:url('http://cdn.wallpapersafari.com/13/6/Mpsg2b.jpg');
        margin:0px;
        font-family: 'Ubuntu', sans-serif;
        background-size: 100% 110%;
    }
    h1, h2, h3, h4, h5, h6, a {
        margin:0; padding:0;
    }
    .login {
        margin:0 auto;
        max-width:500px;
    }
    .login-header {
        color:#fff;
        text-align:center;
        font-size:300%;
    }
    /* .login-header h1 {
       text-shadow: 0px 5px 15px #000; */
    }
    .login-form {
        border:.5px solid #fff;
        background:#4facff;
        border-radius:10px;
        box-shadow:0px 0px 10px #000;
    }
    .login-form h3 {
        text-align:left;
        margin-left:40px;
        color:#fff;
    }
    .login-form {
        box-sizing:border-box;
        padding-top:15px;
        padding-bottom:10%;
        margin:5% auto;
        text-align:center;
    }
    .login input[type="text"],
    .login input[type="password"] {
        max-width:400px;
        width: 80%;
        line-height:3em;
        font-family: 'Ubuntu', sans-serif;
        margin:1em 2em;
        border-radius:5px;
        border:2px solid #f2f2f2;
        outline:none;
        padding-left:10px;
    }
    .login-form input[type="submit"] {
        height:45px;
        width:230px;
        background:#fff;
        border:1px solid #f2f2f2;
        border-radius:20px;
        color: slategrey;
        text-transform:uppercase;
        font-family: 'Ubuntu', sans-serif;
        cursor:pointer;
    }
    .sign-up{
        color:#f2f2f2;
        margin-left:-70%;
        cursor:pointer;
        text-decoration:underline;
    }
    .no-access {
        color:#E86850;
        margin:20px 0px 20px -57%;
        text-decoration:underline;
        cursor:pointer;
    }
    .try-again {
        color:#f2f2f2;
        text-decoration:underline;
        cursor:pointer;
    }

    /*Media Querie*/
    @media only screen and (min-width : 150px) and (max-width : 530px){
        .login-form h3 {
            text-align:center;
            margin:0;
        }
        .sign-up, .no-access {
            margin:10px 0;
        }
        .login-button {
            margin-bottom:10px;
        }
    }
    input[type="checkbox"], input[type="radio"] {
        background-color: transparent;
        border: 0;
        width: 20px;
        padding: 0;
    }
    </style>
</head>

<body>

<div class="login">
    <div class="login-header">
        <h1>Login</h1>
    </div>
    <g:if test='${flash.message}'>
        <div class="login_message">${flash.message}</div>
    </g:if>
    <div class="login-form">
        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
            <h3>Username:</h3>
            <input type="text" placeholder="Username" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
        <h3>Password:</h3>
            <input type="password" placeholder="Password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
            <br>
            <p id="remember_me_holder">
                <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                <label for="remember_me">Stay connected</label>
            </p>
        <br>
            <input class="login-button" type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
        </form>
    </div>
</div>

    %{--<div id="login">


            <div class="login-page">

                <div class="form">
                    <h1 class="heading">
                        Se connecter
                    </h1>
            <g:if test='${flash.message}'>
                <div class="login_message">${flash.message}</div>
            </g:if>

            <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
                <p>
                    dk,kdk
                    <label for="username"><g:message code='springSecurity.login.username.label'/>:</label>
                    <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
                </p>

                <p>
                    <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
                    <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
                </p>

                <p id="remember_me_holder">
                    <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                    <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>
                </p>

                <p>
                    <input class="bouton bouton-primary" type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
                </p>
                <p class="message">Not registered?<g:link controller="user" class="create" action="create">Create an account</g:link>
            </p>
            </form>
        </div>
            </div>
        </div>
    </div>--}%

<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>
