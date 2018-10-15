<!DOCTYPE HTML>
<html>
   <head>
      <title>${title}</title>
   </head>
   
   <body>
      <#include "/_menu.ftl">
       
      <h2>Viestiä pukkaa : <span> ${message}</span></h2>
	
	  <@security.authorize access="! isAuthenticated()">
        <a href="/login">Kirjaudu</a>
	  </@security.authorize>
   </body>
</html>