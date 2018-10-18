<#assign security=JspTaglibs["http://www.springframework.org/security/tags"]/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<div style="border: 1px solid #ccc;padding:5px;margin-bottom:20px;">
 
  <a href="/">Alku</a> | &nbsp;
 
   <@security.authorize url="/admin">
		<a href="/admin">Vaan guruille (admin)</a> | &nbsp;
   </@security.authorize>
 
   <@security.authorize url="/kierros/add">
		<a href="/kierros/add">uusi kierros</a> | &nbsp;
   </@security.authorize>

   <@security.authorize url="/kierros/omat">
		<a href="/kierros/omat">omat kierrokset</a> | &nbsp;
   </@security.authorize>

   <@security.authorize url="/admin/kierrokset">
		<a href="/admin/kierrokset">admin kierrokset</a> | &nbsp;
   </@security.authorize>

   <@security.authorize url="/kayttaja/new">
		<a href="/kayttaja/new">Lisää uusi käyttäjä</a> | &nbsp;
   </@security.authorize>

   <@security.authorize url="/kayttajaluettelo">
		<a href="/kayttajaluettelo">Lista käyttäjistä</a> | &nbsp;
   </@security.authorize>

	<@security.authorize access="isAuthenticated()">
	   	<a href="/logout">Logout</a> &nbsp; | &nbsp;
      	<span class="badge badge-tertiary"><a href="/kayttajaInfo"><@security.authentication property="principal.username" /></a></span> 
		&nbsp;
	<#-- 
		<@security.authorize access="hasRole('ROLE_ADMIN')">
	  	  ADMIN
		</@security.authorize>
		<@security.authorize access="hasRole('ROLE_SEURA_MANAGER')">
	  	  SEURA_MANAGER
		</@security.authorize>
		<@security.authorize access="hasRole('ROLE_PELAAJA')">
		  PELAAJA
		</@security.authorize>
	 -->
	</@security.authorize>
	<@security.authorize access="! isAuthenticated()">
    Et vielä ole kirjautunut
	</@security.authorize>
  
</div>