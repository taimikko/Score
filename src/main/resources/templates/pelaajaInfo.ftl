<#-- assign security=JspTaglibs["http://www.springframework.org/security/tags"]/ -->
<#-- Saadaanko JSP -tagit _menusta vai pitääkö ladata joka sivulle erikseen ? -->
<!DOCTYPE HTML>
<html>
   <head>
      <title>Pelaaja Info</title>
   </head>
   <body>
   	  <#include "_menu.ftl">
       
      <h2>Pelaaja Info</h2>
 
  <#if pelaaja??>
    ${pelaaja.etunimi} ${pelaaja.sukunimi} ${pelaaja.kayttajatunnus}
    ${pelaaja.tasoitus}
  </#if>




 
   <a class="p-2" href="#" data-toggle="modal" data-target="#signinModal">koe</a>
  
  <#if !(__user??)> 
  <a class="p-2" href="#" data-toggle="modal" data-target="#signinModal">Ei käyttäjää</a>
<#else>
  <span class="badge badge-secondary">Löytyi käyttäjä: ${__user.getName()}</span>
</#if>

 <@security.authorize access="isAuthenticated()">
    logged in as <@security.authentication property="principal.username" />
  
     
 </@security.authorize>

 <@security.authorize access="! isAuthenticated()">
    Not logged in
  </@security.authorize>

<@security.authorize access="hasRole('ROLE_PELAAJA')">
  rooli ROLE_PELAAJA <br>
</@security.authorize>
<@security.authorize access="hasRole('ROLE_SEURA_MANAGER')">
  rooli ROLE_SEURA_MANAGER <br>
</@security.authorize>
<@security.authorize access="hasRole('ROLE_ADMIN')">
  rooli ROLE_ADMIN <br>
</@security.authorize>

 
<#--      <h3>Welcome : <span th:utext="${#request.userPrincipal.name}"></span></h3> -->
      <b>This is protected page!</b>  
      <b>eli tämä sivu on suojattu (ties miltä)</b> 
       
      <br/><br/>
       
      <div> 
      <#if userInfo??>
      ${userInfo}
      </#if>
      </div>
       
   </body>
    
</html>