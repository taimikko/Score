<#-- assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/ -->
<#-- Saadaanko JSP -tagit _menusta vai pitääkö ladata joka sivulle erikseen ? -->
<!DOCTYPE HTML>
<html>

<head>
    <title>Uusi Pelaaja</title>
</head>

<body>
    <#include "../_menu.ftl">

    <h2>Lisää Pelaaja</h2>

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
    			<td>jäsenyyden tyyppi:</td><td>${pelaaja.jasen_tyyppi}</td> <#-- min=1 max=9 -->
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