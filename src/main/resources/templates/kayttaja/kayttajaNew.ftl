<!DOCTYPE HTML>
<html>
   <head>
      <title>Uusi Käyttäjä</title>
   </head>
   <body>
	<#include "../_menu.ftl">
       
      <h1>Luo uusi käyttäjä</h1>
       
      <#-- /login?error=true 
      <div th:if="${#request.getParameter('error') == 'true'}"
            style="color:red;margin:10px 0px;">
         Ei tänne ny ihan kaikki pääse.<br />
         Reason :
         <span th:if="${#session!= null and #session.getAttribute('SPRING_SECURITY_LAST_EXCEPTION') != null}"
            th:utext="${#session.getAttribute('SPRING_SECURITY_LAST_EXCEPTION').message}">
                Static summary
         </span>
           
      </div>
      -->
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
               <td>Seura:</td>
               <td><input list="seuralista" name='seuraId' required value=78>
               	   <datalist id="seuralista">
               	   <#list seurat as seura>
               	   	<option value="${seura.id}">${seura.id}. ${seura.nimi}</option> <#-- ${seura.lyhenne} ${seura.nimi} -->
               	   </#list>
               	   </datalist>
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
               <td><input type='number' min=1 name='jasennumero' required > 
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
    			<td><input list="jasenyys" name='jasen_tyyppi'>
  					<datalist id="jasenyys">
                     	<#list jasentyypit as jt>
                        	<option value="${jt.id}">${jt.id}. ${jt.tyyppi}</option>
                    	</#list>
  					</datalist></td>
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