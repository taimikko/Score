<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">

    <title>User Info</title>
</head>

<body>
    <#include "../_menu.ftl">

        <h2>Käyttäjän Infosivu</h2>

        <@security.authorize access="isAuthenticated()">
            <h3>Olet kirjautunut käyttäjänä:
            <@security.authentication property="principal.username" />
            </h3>
        </@security.authorize>

        <@security.authorize access="! isAuthenticated()">
            <a href="/login">Kirjaudu ensin</a>
        </@security.authorize>
        <div class="admin">
        <fieldset>
	  		<legend>käyttäjäroolit:</legend>
            <@security.authorize access="hasRole('ROLE_PELAAJA')">
                <p>ROLE_PELAAJA</p>
            </@security.authorize>
            <@security.authorize access="hasRole('ROLE_SEURA_MANAGER')">
                <p>ROLE_SEURA_MANAGER</p>
            </@security.authorize>
            <@security.authorize access="hasRole('ROLE_ADMIN')">
                <p>ROLE_ADMIN</p>
            </@security.authorize>
        </fieldset>
        </div>
        <div class="admin">
	        <a href="/kayttajaInfo?kayttajatunnus=<@security.authentication property="principal.username" />"> omat käyttäjätiedot</a>
        </div>
</body>

</html>