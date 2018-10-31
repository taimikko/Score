<!DOCTYPE HTML>
<html>
   	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">
	    <title>Uusi Käyttäjä</title>

	    <script>
	    async function haeVapaaNumero() {
		    console.log("function haeVapaaNumero()");
	    	const seura_id = document.getElementById('seuraId').value; 
            haeSeuranVapaaNumero(seura_id);
	    };
	    
		async function haeSeuranVapaaNumero(seura_id) {
		    try { 
		        const res = await fetch('/kayttaja/vapaaJasennumero/' + seura_id); 
		         
		        if(res.status != 200){ return; } 
		        const data = await res.text(); 
		        console.log(data);
		        document.getElementById('jasennumero').value = JSON.parse(data);  
		        //.innerHTML = '`' + txt +'`' ;
		     } finally {
		        console.log("vapaa jäsennumero");
		     }
		 }

	    </script>
   </head>
   <body>
	<#include "../_menu.ftl">
       
      <h1>Luo uusi käyttäjä</h1>

      <div>
      <#-- " style="color: red;" -->
      <#if message??>
          <h3> ${message} </h3>
      </#if>
      </div>
     
      <h3>Anna uudelle käyttäjälle käyttäjätunnus ja salasana:</h3>
      <form name='f' action="/kayttaja/add" method='POST'>
         <table>
	       <tr>
               <td>Etunimi:</td>
               <td><input type='text' name='etunimi' required />
               <#if user??>
                 ${user.etunimi} 
                </#if> 
               </td>
            </tr>
            <tr>
	       <tr>
               <td>Sukunimi:</td>
               <td><input type='text' name='sukunimi' required >
               <#if user??>
                 ${user.sukunimi} 
                </#if> 
               </td>
            </tr>
               <td>Käyttäjätunnus:</td>
               <td><input type='text' name='username' required >
               <#if user??>
                 ${user.username} 
                </#if> 
               </td>
            </tr>
            <tr>
               <td>Salasana:</td>
               <td><input type='password' name='password' required >
               <#if user??>
                 ${user.password} 
                </#if> 
			</td>
            </tr>
            <tr>
               <td>Salasana uudestaan:</td>
               <td><input type='password' name='password2' >
               <#if user??>
                 ${user.password2} 
                </#if>
               </td>
            </tr>
            <tr>
				<td>Rooli:</td>
                   	<#list roolit as rooli>
                    	<td><input type="checkbox" name="rooli" <#if rooli.nimi="ROLE_PELAAJA"> checked </#if> value="${rooli.id}">${rooli.id}. ${rooli.nimi}</td></tr><tr><td></td>
                   	</#list>
            </tr>
            <tr>
               <td>Seura: <#if (seura_id)??>${seura_id}</#if></td>
               <td>
                   <select name='seuraId' id='seuraId' required onchange="haeVapaaNumero()" >
               	   	<#list seurat as seura>
               	   		<option value="${seura.id}" <#if (seura_id)??><#if (seura_id=seura.id)>selected="selected"</#if></#if> > ${seura.id}. ${seura.nimi}</option> <#-- ${seura.lyhenne} ${seura.nimi} -->
               	   	</#list>
               	   </select>
              </td>
               <td> 
               <#if user??>
				${user.seuraId}
                </#if>
				</td>
            </tr>
            <tr>
               <td>jäsennumero:</td>
               <#-- Autonumber seuran sisällä ? -->
               <td><input type='number' min=1 name='jasennumero' id='jasennumero' required <#if vapaanumero??>value='${vapaanumero}'</#if> > 
               <#if user??>
				${user.jasennumero}
                </#if>
				</td>
            </tr>

 <#-- 
            <tr><td>Jos käyttäjä on ROLE_ADMIN niin saa valita seuran muuten on käytettävä omaa seuraa </td>
            <td><span th:if="${#request.userPrincipal != null}" th:text="${#request.userPrincipal.name}"> </span> </td>
            </tr>
              <tr> <td><span th:if="${#request.userPrincipal.role != null}" th:text="${#request.userPrincipal.role}"> </span> </td>
           </tr>
 -->
     		<tr>
    			<td>tasoitus:</td>
    			<td><input type='number' min='-20' max='54' name='tasoitus' required <#if (user.tasoitus)??>value=${user.tasoitus}</#if> ></input></td>
    		</tr> <#--  step='0.1'  -->
    		<tr>
    			<td>voimassaoleva tasoitus:</td>
    			<td> 			
    			  <input type='checkbox' value='true' <#if (user.tasoitus_voimassa)??> <#if user.tasoitus_voimassa> checked </#if> </#if> name='tasoitus_voimassa' />
    			</td>
    		</tr>
     		<tr>
    			<td>jäsenyyden tyyppi:</td>
    			<td><select required id='jasen_tyyppi' name='jasen_tyyppi'>
                 	<#list jasentyypit as jt>
                    	<option value="${jt.id}">${jt.id}. ${jt.tyyppi}</option>
                	</#list>
					</select>
				</td>
			</tr>
    		<tr>
    			<td>sukupuoli:</td>
    			<td><input type='radio' name='sukup' value='1'>Mies</input><br>
				    <input type='radio' name='sukup' value='2'>Nainen</input><br>
				    <input type='radio' name='sukup' checked='checked' value='3'>Ei tiedossa</input><br>
    			</td>
    		</tr>
     		<tr>
               <td><input name="submit" type="submit" value="submit" /></td>
            </tr>
         </table>
      </form>  
       
   </body>
   
</html>