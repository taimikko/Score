<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>

<head>
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
    <#if kayttaja??>
    <a href="/kayttaja/edit/${kayttaja.username}">Päivitä käyttäjän tietoja</a>
    </#if>
    <br/>
    <div>
        <#if userInfo??>
            ${userInfo}
        </#if>
    </div>
</body>

</html>