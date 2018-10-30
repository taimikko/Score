<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">
	<title>Käyttäjätiedot</title>
</head>

<body>
	<#include "../_menu.ftl">

    <h2>Käyttäjätiedot</h2>
    <div>
        <table>
            <#if kayttaja??>
                <tr>
                    <td>Etunimi:</td>
                    <td>${kayttaja.etunimi}</td>
                </tr>
                <tr>
                    <td>Sukunimi:</td>
                    <td>${kayttaja.sukunimi}</td>
                </tr>
                <tr>
                    <td>Käyttäjätunnus:</td>
                    <td>${kayttaja.username}</td>
                </tr>
                <tr>
                    <td>Seura:</td>
                    <td>${kayttaja.seuraId?c}</td>
                </tr>
                <tr>
                    <td>jäsennumero:</td>
                    <td>${kayttaja.jasennumero?c}</td>
                </tr>
                <tr>
                    <td>id:</td>
                    <td>${kayttaja.kayttajaId?replace(",","")}</td>
                </tr>
                <tr>
                    <td>enabled:</td>
                    <td>${kayttaja.enabled?string('kyllä', 'ei')} </td>
                </tr>
	    		<tr>
    				<td>sukupuoli:</td>
    				<td>${kayttaja.sukup?replace("1","Mies")?replace("2","Nainen")}</td>
	    		</tr>
                <tr>
                    <td>kayttäjä:</td>
                    <td>${kayttaja.getKokoNimi()}</td>
                </tr>
            </#if>
            <#if roolit??>
                <tr>
                    <td>roolit:</td>
                    <#list roolit as rooli>
                        <td>${rooli}</td></tr><tr><td/>
                    </#list>
                </tr>
            </#if>
        </table>
    </div>
    <br/>
	<@security.authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_SEURA_MANAGER')">
	    <#if kayttaja??>
		    <a href="/kayttaja/edit/${kayttaja.username}">Päivitä käyttäjän tietoja</a>
	    </#if>
	</@security.authorize>
    <br/>
    <div>
        <#if userInfo??>
            ${userInfo}
        </#if>
    </div>
</body>

</html>