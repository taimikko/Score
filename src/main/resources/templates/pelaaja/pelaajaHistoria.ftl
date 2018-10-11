<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<title>User list</title>
		<script>
			function deleteUser(user_name) {
				console.log("DEBUG:", user_name);
				window.location = "/deleteuser/" + user_name;
			}
		</script>
<#--		
		<input type="hidden"
				name="${_csrf.parameterName}"
				value="${_csrf.token}"/>
-->
		</head>
	<body>
		<h1>pelaajaHistoria.FTL</h1>
	
	<#include "../_menu.ftl">
	<div>
	<#if kayttaja??>
	Käyttäjätunnus: ${kayttaja.username}
	Etunimi: ${kayttaja.etunimi}
	Sukunimi: ${kayttaja.sukunimi}
	Seura: ${kayttaja.seura_id}
	Jäsennumero: ${kayttaja.jasennumero}
	Voimassa: ${kayttaja.enabled}
	<a href="/kayttaja/edit/${kayttaja.username}"> Edit käyttäjätiedot</a>
	</#if>
	</div>
		<table  class="table">
			<thead>
				<tr>
				<th scope="col">Id</th>
				<th scope="col">Pvm</th>
				<th scope="col"><a href="/users/seura">Seura</a></th>
				<th scope="col"><a href="/users/jasennumero">Jäsennumero</a></th>
				<th scope="col">Tyyppi</th>
				<th scope="col">HCP</th>
				<th scope="col">HCP voimassa</th>
				<#--  <th scope="col">suku</th>  -->
				</tr>
			</thead>
			<tbody>
				<#list pelaajat as p>
					<tr>
						<td scope="row">${p.id}</td>
						<td>${p.pvm}</td>
						<td>${p.seura_id}</td>
						<td>${p.jasennumero}</td>
						<td>${p.jasen_tyyppi}</td>
						<td>${p.tasoitus}</td>
						<td>${p.tasoitus_voimassa}</td>
						<td>
						   <a href="/pelaaja/del/${p.id}">Del</a>
						   <button id="del" onclick="deletePelaaja('${p.id}')">Delete</button>
						   <a href="/edit/${p.username}">Edit</a>
						</td>
					</tr>
				</#list>
			</tbody>

		</table>
		<div>
			<p>
			<a href="/pelaaja/add">Lisää pelaaja</a>
		</div>
	</body>
</html>