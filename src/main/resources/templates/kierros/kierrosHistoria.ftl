<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<title>Kierros lista</title>
		<script>
		</script>
<#--		
		<input type="hidden"
				name="${_csrf.parameterName}"
				value="${_csrf.token}"/>
-->
		</head>
	<body>
		<h1>kierrosHistoria.FTL</h1>
	
	<#include "../_menu.ftl">
	<div>
	<#if pelaaja??>
		<table>
			<tr><td>Käyttäjätunnus:</td><td><a href="/kayttaja/${pelaaja.username}">${pelaaja.username}</a></td></tr>
			<tr><td>Etunimi:</td><td>${pelaaja.etunimi}</td></tr>
			<tr><td>Sukunimi:</td><td>${pelaaja.sukunimi}</td></tr>
			<tr><td>Seura:</td><td>${pelaaja.seuraId?c}</td></tr>
			<tr><td>Jäsennumero:</td><td>${pelaaja.jasennumero?c}</td></tr>
			<tr><td>Voimassa:</td><td>${pelaaja.enabled?string('kyllä', 'ei')}</td></tr>
			<tr><td>.</td></tr>
		</table>
	</#if>
	</div>
		<table  class="table">
			<thead>
				<tr>
				<th scope="col">Id</th>
				<th scope="col">Pvm</th>
				<th scope="col">Kenttä</a></th>
				<th scope="col">Tii</a></th>
				<th scope="col">Lyönnit</th>
				<th scope="col">Pisteet</th>
				<th scope="col">Tasoituskierros</th>
				<th scope="col">9/18</th>
				<th scope="col">Lisätieto</th>
				<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<#list kierrokset as k>
					<tr>
						<td scope="row">${k.id}</td>
						<td>${k.pvm?string('dd.MM.yyyy')}</td>
						<td>${k.kentta_id?c} <#-- +kentän nimi --></td>
						<td>${k.tii_id?c} <#-- +tiin nimi --></td>
						<td>${k.yhteensa}</td>
						<td>${k.p_yht}</td>
						<td>${k.tasoituskierros?string('kyllä', 'ei')}</td>
						<td>${k.pelattu?replace(1,"etuysi")?replace(2,"takaysi")?replace(3,"koko kierros")} <#-- +koodia vastaava tieto 9/18 --></td>
						<td>${k.lisatieto}</td>
						<td>
						   <a href="/kierros/del/${k.id?c}">Del</a>
						   <a href="/kierros/edit/${k.id?c}">Edit</a>
						</td>
					</tr>
				</#list>
			</tbody>

		</table>
	</body>
</html>