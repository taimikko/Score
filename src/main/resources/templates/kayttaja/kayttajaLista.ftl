<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<title>User list</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">

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
							   	<a href="/pelaaja/history/${user.seuraId}/${user.jasennumero?replace(",","")}">pelaajahistoria</a>
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