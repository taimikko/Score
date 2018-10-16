<!DOCTYPE HTML>
<html>
	<head>
      <title>${title}</title>
   	</head>
   	<body>
      <#include "_menu.ftl">
      <@security.authorize url="/admin"> <#--  Näkyy vain niille, joilla on oikeus /admin -sivuun -->
      
      <h2>Admin Page</h2>
      <h3>
        <@security.authorize access="isAuthenticated()">
        Käyttäjätunnus : <@security.authentication property="principal.username" /> 
	 	</@security.authorize>
       </h3>
       
      <br/>
      <a href="/admin/kentat">kentät</a>
      <br/>
      <div> 
 	    <#if userInfo??>
    	 	${userInfo}
      	</#if>
	</div>
	</@security.authorize>
   </body>
</html>