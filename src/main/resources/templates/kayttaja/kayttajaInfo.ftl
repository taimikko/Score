<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>

<head>
    <title>User Info</title>
</head>

<body>
    <#include "../_menu.ftl">

        <h2>Käyttäjän Infosivu</h2>

        <@security.authorize access="isAuthenticated()">
            Olet kirjautunut käyttäjänä:
            <@security.authentication property="principal.username" />
        </@security.authorize>

        <@security.authorize access="! isAuthenticated()">
            <a href="/login">Kirjaudu ensin</a>
        </@security.authorize>
        <div>
            <@security.authorize access="hasRole('ROLE_PELAAJA')">
                löytyi rooli ROLE_PELAAJA
                <br/>
            </@security.authorize>
            <@security.authorize access="hasRole('ROLE_SEURA_MANAGER')">
                löytyi rooli ROLE_SEURA_MANAGER
                <br/>
            </@security.authorize>
            <@security.authorize access="hasRole('ROLE_ADMIN')">
                löytyi rooli ROLE_ADMIN
                <br/>
            </@security.authorize>
        </div>
        <div>
            <#if userInfo??>
                ${userInfo}
            </#if>
        </div>

        <a href="/kayttaja/<@security.authentication property=" principal.username " />"> omat käyttäjätiedot</a>
</body>

</html>