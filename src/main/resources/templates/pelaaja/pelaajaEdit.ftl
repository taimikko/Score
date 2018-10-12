<#-- assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/ -->
<#-- Saadaanko JSP -tagit _menusta vai pitääkö ladata joka sivulle erikseen ? -->
<!DOCTYPE HTML>
<html lang="fi">

<head>
    <title>Pelaajan tiedot</title>
</head>

<body>
    <#include "../_menu.ftl">
    
    <h2>Muuta pelaajan tietoja</h2>

    <form name='f' action="/pelaaja/edit" method='POST'>
  	<table>
  	    <#if pelaaja??>
    		<tr>
    			<td>käyttäjä id:</td><td><input type='number' name='kayttajaId' readonly value=${pelaaja.kayttajaId?replace(",","")} /></td>
    		</tr>
    		<tr>
    			<td>käyttäjätunnus:</td><td><input type='text' name='username' readonly value=${pelaaja.username} /> </td>
    		</tr>
    		<tr>
    			<td>enabled:</td><td>${pelaaja.enabled?string('kyllä', 'ei')} </td>
    		</tr>
    		<tr>
    			<td>etunimi:</td><td><input type='text' name='etunimi' readonly value=${pelaaja.etunimi} /></td>
    		</tr>
    		<tr>
    			<td>sukunimi:</td><td><input type='text' name='sukunimi' readonly value=${pelaaja.sukunimi} /></td>
    		</tr>
    		<tr>
    			<td>tasoitus:</td><td><input type='number' min='-20' max='54'  name='tasoitus' required value=${pelaaja.tasoitus} ></input></td>
    		</tr> <#--  step='0.1'  -->
    		<tr>
    			<td>voimassaoleva tasoitus:</td>
    			<td> 			
    			  <input type='checkbox' value='true' <#if pelaaja.tasoitus_voimassa> checked </#if> name='tasoitus_voimassa' />
    			</td>
    		</tr>
    		<tr>
    			<td>seura:</td><td><input type='number' name='seuraId' readonly value=${pelaaja.seuraId} /></td>
    		</tr>
    		<tr>
    			<td>jäsennumero:</td><td><input type='number' name='jasennumero' readonly value=${pelaaja.jasennumero?replace(",","")} /></td>
    		</tr>
    		<tr>
    			<td>jäsenyyden tyyppi:</td><td><input type='number' min=1 max=9 name='jasen_tyyppi' required value=${pelaaja.jasen_tyyppi} /></td>
    		</tr>
    		<tr>
    			<td>sukupuoli:</td><td><input type='number' name='sukup' min=1 max=2 readonly value=${pelaaja.sukup} /></td>
    		</tr>
     		<tr>
    			<td>id:</td><td><input type='number' name='id' readonly value=${pelaaja.id?replace(",","")} /></td>
    		</tr>
       		<tr>
      		<#-- Use ?date, ?time, or ?datetime to tell FreeMarker the exact type. 
      		     use ?string(pattern), like ?string('dd.MM.yyyy HH:mm:ss'), to specify which fields to display. 
      		     yyyy-mm-dd hh:mm:ss[.fffffffff]] -->  
    			<td>pvm:</td><td><input type='text' name='pvm' value='${pelaaja.pvm?string('yyyy-MM-dd HH:mm:ss')}' readonly /></td>
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
 
    <br/>
    <#if (pelaaja.id)??>
      <a href="/pelaaja/get/${pelaaja.id?replace(",","")}" >Peru/Katso</a>
    </#if>
    <br/>

</body>

</html>