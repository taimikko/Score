<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<title>User list</title>
		<script>
			function deleteUser(user_name) {
				console.log("DEBUG:", user_name);
				window.location = "/kayttaja/del/" + user_name;
			}
		</script>
<#--		
    <script src="jquery.js"></script> 
    <script> 
    $(function(){
      $("#menu").load("_menu.html"); 
    });
    </script> 


-->
		</head>
	<body>
		<h1>kayttajaLista.FTL</h1>
	
	<#include "../_menu.ftl">
		<table  class="table">
			<thead>
				<tr>
				<th scope="col">#</th>
				<th scope="col"><#-- a href="/kayttaja/username"-->Käyttäjätunnus</th>
				<th scope="col"><#-- a href="/kayttaja/etunimi"-->Etunimi</th>
				<th scope="col"><#-- a href="/kayttaja/sukunimi"-->Sukunimi</th>
				<th scope="col">Seura</th>
				<th scope="col">Jäsennumero</th>
				<th scope="col">Voimassa</th>
				<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<#list kayttajat as user>
					<tr>
						<td scope="row">${user.kayttajaId}</td>
						<td ><a href="/kayttaja/${user.username}">${user.username}</a></td>
						<td>${user.etunimi}</td>
						<td>${user.sukunimi}</td>
						<td>${user.seuraId}</td>
						<td>${user.jasennumero?c}</td>
						<td>${user.enabled?string('kyllä', 'ei')}</td>
						
						<td>
  							<form name='f' action="/kayttaja/del/${user.username}" method='POST'>
  								<#if _csrf??><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></#if>
 								<input name="submit" type="submit" value="delete" />
								<#--  <button id="del" onclick="deleteUser('${user.username}')">Delete</button>  -->
							   	<a href="/pelaaja/${user.seuraId}/${user.jasennumero?replace(",","")}">pelaajatiedot</a>
						   </form>
						</td>
					</tr>
				</#list>
			</tbody>

		</table>
		<div>
			<p>
			<a href="/kayttaja/new">Lisää käyttäjä</a>
		</div>
	</body>
</html>