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
		<table>
			<tr><td>Käyttäjätunnus:</td><td><a href="/kayttaja/${kayttaja.username}">${kayttaja.username}</a></td></tr>
			<tr><td>Etunimi:</td><td>${kayttaja.etunimi}</td></tr>
			<tr><td>Sukunimi:</td><td>${kayttaja.sukunimi}</td></tr>
			<tr><td>Seura:</td><td>${kayttaja.seuraId?replace(",","")}</td></tr>
			<tr><td>Jäsennumero:</td><td>${kayttaja.jasennumero?replace(",","")}</td></tr>
			<tr><td>Voimassa:</td><td>${kayttaja.enabled?string('kyllä', 'ei')}</td></tr>
			<tr><td>.</td></tr>
		</table>
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
						<td>${p.pvm?string('dd.MM.yyyy HH:mm:ss')}</td>
						<td>${p.seuraId?replace(",","")}</td>
						<td>${p.jasennumero?replace(",","")}</td>
						<td>${p.jasen_tyyppi}</td>
						<td>${p.tasoitus}</td>
						<td>${p.tasoitus_voimassa?string('kyllä', 'ei')}</td>
						<td>
						   <a href="/pelaaja/del/${p.id?c}">Del (ei toteutettu) </a>
						   <#-- <button id="del" onclick="deletePelaaja('${p.id?c}')">Delete</button>  --> 
						   <a href="/pelaaja/edit/${p.id?c}">Edit</a>
						</td>
					</tr>
				</#list>
			</tbody>

		</table>
	</body>
</html>