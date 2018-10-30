<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">
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
			<tr><td>Käyttäjätunnus:</td><td><a href="/kayttaja/info?kayttajatunnus=${kayttaja.username}">${kayttaja.username}</a></td></tr>
			<tr><td>Etunimi:</td><td>${kayttaja.etunimi}</td></tr>
			<tr><td>Sukunimi:</td><td>${kayttaja.sukunimi}</td></tr>
			<tr><td>Seura:</td><td>${kayttaja.seuraId?replace(",","")}</td></tr>
			<tr><td>Jäsennumero:</td><td>${kayttaja.jasennumero?replace(",","")}</td></tr>
			<tr><td>Voimassa:</td><td>${kayttaja.enabled?string('kyllä', 'ei')}</td></tr>
			<tr><td>Tyyppi:</td><td>${kayttaja.jasen_tyyppi?string('kyllä', 'ei')}</td></tr>
			<tr><td><br></td></tr>
		</table>
	</#if>
	</div>
		<table  class="table">
			<thead>
				<tr>
				<th scope="col">Id</th>
				<th scope="col">Pvm</th>
				<th scope="col">Seura</th>
				<th scope="col">Jäsennumero</th>
				<th scope="col">HCP</th>
				<th scope="col">HCP voimassa</th>
				<th> </th>
				</tr>
			</thead>
			<tbody>
				<#list pelaajat as p>
					<tr>
						<td scope="row"><a href="/pelaaja/get/${p.id?c}">${p.id}</a></td>
						<td>${p.pvm?string('dd.MM.yyyy HH:mm:ss')}</td>
						<td>${p.seuraId?replace(",","")}</td>
						<td>${p.jasennumero?replace(",","")}</td>
						<td>${p.jasen_tyyppi}</td>
						<td>${p.tasoitus}</td>
						<td>${p.tasoitus_voimassa?string('kyllä', 'ei')}</td>
						<td>
  							<form name='f' action="/pelaaja/del/${p.id?c}" method='POST'>
  								<#if _csrf??><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></#if>
 								<input name="submit" type="submit" value="delete" />
							   	<a href="/pelaaja/edit/${p.id?c}">Edit</a>
						   </form>
						</td>
					</tr>
				</#list>
			</tbody>

		</table>
	</body>
</html>