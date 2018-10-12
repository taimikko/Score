<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>

<head>
<title>Käyttäjätietojen päivitys</title>
</head>

<body>
	<#include "../_menu.ftl">

    <h2>Käyttäjätiedot</h2>
    <div>
        <form name='f' action="/kayttaja/edit" method='POST'>
        <table>
            <#if kayttaja??>
	    		<tr>
	    			<td>etunimi:</td><td><input type='text' name='etunimi' required value=${kayttaja.etunimi} /></td>
	    		</tr>
	    		<tr>
	    			<td>sukunimi:</td><td><input type='text' name='sukunimi' required value=${kayttaja.sukunimi} /></td>
	    		</tr>
	    		<tr>
	    			<td>käyttäjätunnus:</td><td><input type='text' name='username' required value=${kayttaja.username} /> </td>
	    		</tr>
                <tr>
                    <td>Seura:</td>
                    <td><input type='number' name='seuraId' min=1 required value=${kayttaja.seuraId?c} /></td>
                </tr>
                <tr>
                    <td>jäsennumero:</td>
                    <td><input type='number' name='jasennumero' min=1 required value=${kayttaja.jasennumero?c} /></td>
                </tr>
           		<tr>
    				<td>käyttäjä id:</td><td><input type='number' name='kayttajaId' readonly value=${kayttaja.kayttajaId?c} /></td>
	    		</tr>
                <tr>
                    <td>enabled:</td>
                    <td><input type='checkbox' name='enabled' <#if kayttaja.enabled> checked </#if>} </td>
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
            <tr>
               <td><input name="submit" type="submit" value="submit" /></td>
            </tr>
        </table>
        </form>
    </div>
</body>

</html>