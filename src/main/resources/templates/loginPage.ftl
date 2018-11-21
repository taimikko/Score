<!DOCTYPE HTML>
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    	<link rel="stylesheet" type="text/css" href="/css/score.css">

      	<title>Login</title>
   </head>
   <body>
      <#include "/_menu.ftl">
       
      <h1>Login</h1>
  
      <#if (requestParameters.error)??>
      <div style="color:red;margin:10px 0px;">
         Päsy kilety.<br />
         Syy:
     	 <#if (session!= null) & session.getAttribute('SPRING_SECURITY_LAST_EXCEPTION') != null>
         <span>
              session.getAttribute('SPRING_SECURITY_LAST_EXCEPTION').message
         </span>
         </#if>
      </div>
      </#if>
            
      <#if user??><h1>Welcome ${user}!</h1>
      <#else>
      </#if> 
      
      
      <h3>Nyt tarvittais sitä käyttäjätunnusta ja salasanaa:</h3>
      <form name='f' action="/j_spring_security_check" method='POST'>
         <table>
            <tr>
               <td>User:</td>
               <td><input type='text' name='username' value=''></td>
            </tr>
            <tr>
               <td>Password:</td>
               <td><input type='password' name='password' /></td>
            </tr>
            <tr>
               <td><input name="submit" type="submit" value="submit" /></td>
            </tr>
         </table>
      </form>
       
      <br>
      Username/pass:
      <ul>
        <li>q/q</li>
        <li>dbadmin1/123</li>
      </ul>  
       
   </body>
   
</html>