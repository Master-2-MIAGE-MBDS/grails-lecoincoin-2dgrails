<%--
  Created by IntelliJ IDEA.
  User: missflawless
  Date: 28/09/2022
  Time: 02:54
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<div class="page-wrapper bg-dark p-t-100 p-b-50">
    <div class="wrapper wrapper--w900">
        <div class="card card-6">
            <div class="card-heading">
                <h2 class="title">Ajouter une nouvelle annonce</h2>
            </div>

            <div class="card-body">
                <g:form method="POST">
                    <div class="form-row">
                        <div class="name">Titre</div>

                        <div class="value">
                    <g:field class="input--style-6" type="text" name="full_name"/>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="name">Price</div>

                        <div class="value">
                            <div class="input-group">
                    <g:field class="input--style-6" type="number" name="email"/> €
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="name">Description</div>

                        <div class="value">
                            <div class="input-group">
                    <g:textArea  class="textarea--style-6" name="message"
                                          placeholder="Message "/>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="name">Illustration</div>

                        <div class="value">
                            <div class="input-group js-input-file">
                                <input class="input-file" type="file" name="file_cv" id="file">
                                <label class="label--file" for="file">Choisir une image</label>
                                <span class="input-file__info">Aucun fichier choisi</span>
                            </div>

                        </div>
                    </div>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="save"
                                        value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                    </fieldset>
                </g:form>
            </div>

        </div>
    </div>
</div>

</body>
</html>