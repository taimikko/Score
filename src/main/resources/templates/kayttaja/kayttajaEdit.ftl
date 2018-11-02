<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">
	<script type="application/javascript" src="/js/kayttaja.js"></script>

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
	    			<td>käyttäjätunnus:</td><td><input type='text' name='username' id='username' required value=${kayttaja.username} onfocusout="tarkistaKayttajatunnus('username', true)" /> </td>
 	               	<td><span id='huom' name='huom'></span></td>
	    		</tr>
	            <tr>
    	            <#--  useita rooleja: ROLE_USER, ROLE_ADMIN, ROLE_SEURA_MANAGER 
    	            vähintään yksi valittava, mutta voi olla useampia -->
               		<td>Rooli:</td>
                    	<#list roolit as rooli>
   	                    	<td><input type="checkbox" name="rooli" <#list kayttajaroolit as krooli> <#if rooli.nimi=krooli> checked </#if> </#list> value="${rooli.id}">${rooli.id}. ${rooli.nimi}</td></tr><tr><td></td>
                    	</#list>
	            </tr>
                <tr>
                    <td>Seura:</td>
                    <td><input type='number' name='seuraId' min=1 readonly value=${kayttaja.seuraId?c} /></td>
                </tr>
                <tr>
                    <td>jäsennumero:</td>
                    <td><input type='number' name='jasennumero' min=1 readonly value=${kayttaja.jasennumero?c} /></td>
                </tr>
           		<tr>
    				<td>käyttäjä id:</td><td><input type='number' name='kayttajaId' readonly value=${kayttaja.kayttajaId?c} /></td>
	    		</tr>
                <tr>
                    <td>enabled:</td>
                    <td><input type='checkbox' name='enabled' <#if kayttaja.enabled> checked </#if> /> </td>
                </tr>
                <tr>
		   			<td>sukupuoli:</td>
    				<td><input type='radio' name='sukup' <#if (kayttaja.sukup==1)>checked='checked'</#if>value='1'>Mies</input><br>
				    <input type='radio' name='sukup' <#if (kayttaja.sukup==2)>checked='checked'</#if> value='2'>Nainen</input><br>
				    <input type='radio' name='sukup' <#if (kayttaja.sukup)==3>checked='checked'</#if>value='3'>Ei tiedossa</input>
    			</td>
                </tr>
            </#if>
            <#if kayttajaroolit??>
                <tr>
                    <td>roolit:</td>
                    <#list kayttajaroolit as krooli>
                        <td>${krooli}</td></tr><tr><td/>
                    </#list>
                </tr>
            </#if>
       		<tr>
    			<td>jäsenyyden tyyppi:</td>
    			<td><select required id='jasentyyppi' name='jasentyyppi'>
                 	<#list jasentyypit as jt>
                    	<option value="${jt.id}" <#if (kayttaja.jasentyyppi==jt.id)> selected="selected" </#if> >${jt.id}. ${jt.tyyppi}</option>
                	</#list>
					</select>
				</td>
			</tr>

            <tr>
               <td><input name="submit" type="submit" value="Päivitä" /></td>
            </tr>
        </table>
        </form>
    </div>
</body>

</html>