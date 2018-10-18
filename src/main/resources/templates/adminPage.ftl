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
      <div>
            <a href="/admin/kentat">kentät</a>
      </div>
      <@security.authorize url="/admin/kierrokset">
      <#--  <form name='f' action="/admin/kierrokset" method='get' autocomplete='off'> </form>  --> 
      	<div>Valitse kenttä --> 78
 	  
		<a href="/admin/kierrokset/78">admin kierrokset</a>
		</div>
	   </@security.authorize>
      <br/>
      <div> 
 	    <#if userInfo??>
    	 	${userInfo}
      	</#if>
	</div>
	</@security.authorize>
   </body>
</html>