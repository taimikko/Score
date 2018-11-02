<#-- assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/ -->
<!DOCTYPE HTML>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">

    <title>Uusi Pelaaja</title>
</head>

<body>
    <#include "../_menu.ftl">

    <h2>uusi rivi pelaajahistoriaan (tätä ei käytetä vielä?)</h2>

  	<table>
  	    <#if pelaaja??>
    		<tr>
    			<td>käyttäjä id:</td><td>${pelaaja.kayttajaId?replace(",","")}</td>
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
    			<td>jäsennumero:</td><td>${pelaaja.jasennumero}</td>
    		</tr>
    		<tr>
    			<td>jäsenyyden tyyppi:</td><td>${pelaaja.jasentyyppi}</td> <#-- min=1 max=9 -->
    		</tr>
    		<tr>
    			<td>sukupuoli:</td><td>${pelaaja.sukup}</td>
    		</tr>
    		<tr>
    			<td>id:</td><td>${pelaaja.id}</td>
    		</tr>
    		<tr>
    			<td>pvm:</td><td>${pelaaja.pvm}</td>
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
    <#if pelaaja??>
      <a href="/pelaaja/edit/${pelaaja.kayttajaId?replace(",","")}" >Muokkaa</a>
      &nbsp;
      <a href="/pelaaja/del/${pelaaja.kayttajaId?replace(",","")}" >Poista</a>
    </#if>
    <br/>

    <div>
        <#if userInfo??>
            ${userInfo}
        </#if>
    </div>

</body>

</html>