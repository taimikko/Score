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

		<input type="hidden"
				name="${_csrf.parameterName}"
				value="${_csrf.token}"/>
-->
		</head>
	<body>
		<h1>kayttajaLista.FTL</h1>
	
	<#include "../_menu.ftl">
		<table  class="table">
			<thead>
				<tr>
				<th scope="col"><#-- a href="/kayttaja/username"-->Käyttäjätunnus</th>
				<th scope="col"><#-- a href="/kayttaja/etunimi"-->Etunimi</th>
				<th scope="col"><#-- a href="/kayttaja/sukunimi"-->Sukunimi</th>
				<th scope="col"><#-- a href="/kayttaja/jasennumero"-->Jäsennumero</th>
				</tr>
			</thead>
			<tbody>
				<#list kayttajat as user>
					<tr>
						<td scope="row"><a href="/kayttaja/${user.username}">${user.username}</a></td>
						  
						<td>${user.etunimi}</td>
						<td>${user.sukunimi}</td>
						
						<td>
						   <a href="/kayttaja/del/${user.username}">Del</a>
						   <button id="del" onclick="deleteUser('${user.username}')">Delete</button>
						   <a href="/pelaaja/${user.seuraId}/${user.jasennumero?replace(",","")}">pelaajatiedot</a>
						</td>
					</tr>
				</#list>
			</tbody>

		</table>
		<div>
			<p>
			<a href="/kayttaja/add">Lisää käyttäjä</a>
		</div>
	</body>
</html>