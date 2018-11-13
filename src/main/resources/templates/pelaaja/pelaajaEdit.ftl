<#-- assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/ -->
<!DOCTYPE HTML>
<html lang="fi">

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">
    <script type="application/javascript" src="/js/tasoitus.js"></script>    
    
    <title>Pelaajan tiedot</title>
    

	<script>
		window.onload = function (e) {
		    alustaVanhaTasoitus();
	}
	</script>

</head>

<body>
    <#include "../_menu.ftl">
    
    <h2>Muuta pelaajan tietoja</h2>

    <form name='f' action="/pelaaja/edit" method='POST'>
  	<table>
  	    <#if pelaaja??>
    		<tr>
    			<td>käyttäjä id:</td><td><input type='number' name='kayttajaId' readonly value=${pelaaja.kayttajaId?c} /></td>
    		</tr>
    		<tr>
    			<td>käyttäjätunnus:</td><td><input type='text' name='username' readonly value=${pelaaja.username} /> </td>
    		</tr>
            <tr>
                <td>enabled:</td>
                <td><input type='checkbox' name='enabled' readonly <#if (pelaaja.enabled)??><#if pelaaja.enabled> checked </#if></#if> /> </td>
            	<td>${pelaaja.enabled?string('kyllä', 'ei')} </td>
			</tr>
    		<tr>
    			<td>etunimi:</td><td><input type='text' name='etunimi' readonly value=${pelaaja.etunimi} /></td>
    		</tr>
    		<tr>
    			<td>sukunimi:</td><td><input type='text' name='sukunimi' readonly value=${pelaaja.sukunimi} /></td>
    		</tr>
    		<tr>
    			<td>tasoitus:</td>
    			<td><input type='number' min='-20' max='54' step='0.1' class='num2' id='tasoitus' name='tasoitus' required onchange="tasoitusMuutos()" value=${pelaaja.tasoitus} ></input>
			    	<input type='hidden' id='vanha_tasoitus' name='vanha_tasoitus' >
    			</td>
    		</tr> 
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
    			<td>jäsennumero:</td><td><input type='number' name='jasennumero' readonly value=${pelaaja.jasennumero?c} /></td>
    		</tr>
    		<tr>
    			<td>jäsenyyden tyyppi:</td><td><input type='number' min=1 max=9 name='jasentyyppi' required value=${pelaaja.jasentyyppi} /></td>
    		</tr>
     		<tr>
    			<td>id:</td><td><input type='number' name='id' readonly value=${pelaaja.id?c} /></td>
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
               <td><input name="submit" type="submit" value="Päivitä uudet tiedot" /></td>
            </tr>
         </table>
      </form>  
 
    <br/>

    <#if (pelaaja.seuraId)??> <#if (pelaaja.jasennumero)??>
      <a href="/pelaaja/history/${pelaaja.seuraId?c}/${pelaaja.jasennumero?c}" >pelaajahistoria</a>
    </#if>
    <#elseif (pelaaja.id)??>
      <a href="/pelaaja/get/${pelaaja.id?c}" >Peru/Katso</a>
    </#if>
     
    <br/>

</body>

</html>