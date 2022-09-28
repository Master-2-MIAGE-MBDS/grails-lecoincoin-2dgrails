<%--
  Created by IntelliJ IDEA.
  User: binet
  Date: 27/09/2022
  Time: 00:11
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:stylesheet src="StyleUsers.css"/>
    <title></title>
</head>
<body>
<div class="container">
    <h2>Responsive Tables Using LI <small>Triggers on 767px</small></h2>

    <ul class="responsive-table">
        <li class="table-header">
            <div class="col col-2">Username</div>
            <div class="col col-3">Password Expired</div>
            <div class="col col-4">Account Expired </div>
            <div class="col col-5">Enabled </div>
            <div class="col col-6">Annonces</div>
        </li>
    <g:each in="${userList}">
        <li class="table-row">
            <div class="col col-2" data-label="Customer Name">${it.username}</div>
            <div class="col col-3" data-label="Amount">${it.accountExpired}</div>
            <div class="col col-4" data-label="Payment Status">${it.accountExpired}</div>
            <div class="col col-5" data-label="Payment Status">${it.enabled}</div>
            <div class="col col-6" data-label="Payment Status">Annonce</div>
        </li>
    </g:each>

    </ul>

</div>
</body>
</html>