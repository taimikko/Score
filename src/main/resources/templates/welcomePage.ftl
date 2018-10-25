<!DOCTYPE HTML>
<html>
   <head>
   	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">

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