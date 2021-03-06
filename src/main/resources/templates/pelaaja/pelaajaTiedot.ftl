<#-- assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/ -->
<!DOCTYPE HTML>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">

    <title>Pelaajan tiedot</title>
</head>

<body>
    <#include "../_menu.ftl">

    <h2>Pelaajatiedot</h2>

  	<table>
  	    <#if pelaaja??>
    		<tr>
    			<td>käyttäjä id:</td><td>${pelaaja.kayttajaId?c}</td>
    		</tr>
    		<tr>
    			<td>käyttäjätunnus:</td><td>${pelaaja.username}</td>
    		</tr>
    		<tr>
    			<td>enabled:</td><td>${pelaaja.enabled?string('kyllä', 'ei')} </td>
    		</tr>
    		<tr>
    			<td>etunimi:</td><td>${pelaaja.etunimi}</td>
    		</tr>
    		<tr>
    			<td>sukunimi:</td><td>${pelaaja.sukunimi}</td>
    		</tr>
    		<tr>
    			<td>tasoitus:</td><td>${pelaaja.tasoitus}</td>
    		</tr>
    		<tr>
    			<td>voimassaoleva tasoitus:</td><td>${pelaaja.tasoitus_voimassa?string('kyllä', 'ei')}</td>
    		</tr>
    		<tr>
    			<td>seura:</td><td>${pelaaja.seuraId}</td>
    		</tr>
    		<tr>
    			<td>jäsennumero:</td><td>${pelaaja.jasennumero?replace(",","")}</td>
    		</tr>
    		<tr>
    			<td>jäsenyyden tyyppi:</td><td>${pelaaja.jasentyyppi}</td>
    		</tr>
     		<tr>
    			<td>id:</td><td>${pelaaja.id?replace(",","")}</td>
    		</tr>
       		<tr>
      		<#-- Use ?date, ?time, or ?datetime to tell FreeMarker the exact type. 
      		     use ?string(pattern), like ?string('dd.MM.yyyy HH:mm:ss'), to specify which fields to display.  -->  
    			<td>pvm:</td><td>${pelaaja.pvm?string('dd.MM.yyyy HH:mm:ss')}</td>
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

    <br/>
    <#if (pelaaja.id)??>
      <a href="/pelaaja/edit/${pelaaja.id?replace(",","")}" >Muokkaa</a>
      &nbsp;
      <a href="/pelaaja/del/${pelaaja.id?replace(",","")!pelaaja.id}" >Poista</a>
      &nbsp;
    </#if>
    <#if (pelaaja.seuraId)??>
    	<#if (pelaaja.jasennumero)??>
    		<a href="/pelaaja/history/${pelaaja.seuraId?c}/${pelaaja.jasennumero?c}" >Historia</a>
    	</#if>
    </#if>
    <br/>

    <div>
        <#if userInfo??>
            ${userInfo}
        </#if>
    </div>

</body>

</html>