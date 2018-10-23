<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<title>Kierrosluettelo(admin)</title>
		<script>
		</script>
<#--		
		<input type="hidden"
				name="${_csrf.parameterName}"
				value="${_csrf.token}"/>
-->
		</head>
	<body>
		<h1>kierrosLuettelo.FTL</h1>
	
	<#include "../_menu.ftl">
	<div>
	</div>
		<table  class="table">
			<thead>
				<tr>
				<#-- 
				<th scope="col">Etunimi</th>
				<th scope="col">Sukunimi</th>
				 -->
				<th scope="col">Seura</th>
				<th scope="col">Jäsennumero</th>
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
						<#-- 
						<tdscope="row">${k.etunimi}</td>
						<td>${k.sukunimi}</td>
						 -->
						<td>${k.seura_id?c}</td>
						<td>${k.jasennumero?c}</td>
						<td><a href="/kierros/edit/${k.id?c}">${k.id}</a></td>
						<td>${k.pvm?string('dd.MM.yyyy')}</td>
						<td>${k.kentta_id?c} <#-- +kentän nimi --></td>
						<td>${k.tii_id?c} <#-- +tiin nimi --></td>
						<td>${k.yhteensa}</td>
						<td>${k.p_yht}</td>
						<td>${k.tasoituskierros?string('kyllä', 'ei')}</td>
						<td>${k.pelattu?replace(1,"etuysi")?replace(2,"takaysi")?replace(3,"koko kierros")} </td>
						<td>${k.lisatieto}</td>
						<td> <a href="/kierros/del/${k.id?c}">Del</a> </td>
					</tr>
				</#list>
			</tbody>

		</table>
	</body>
</html>