<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">
		<script type="application/javascript" src="/js/kierros.js"></script>

		<title>Kierrosluettelo(admin)</title>
	</head>
	<body>
		<h1>kierrosLuettelo.FTL</h1>
	
	<#include "../_menu.ftl">
	<div>
	</div>
		<#if rajaus??>${rajaus}</#if>
		<table  class="table">
			<thead>
				<tr>
				<th scope="col">Etunimi</th>
				<th scope="col">Sukunimi</th>
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
						<td scope="row"><#if (k.etunimi)??>${k.etunimi}</#if></td>
						<td><#if (k.etunimi)??>${k.sukunimi}</#if></td>
						<td><#if (k.seura_id)??>${k.seura_id?c}</#if></td>
						<td><#if (k.jasennumero)??>${k.jasennumero?c}</#if></td>
						<td><a href="/kierros/edit/${k.id?c}?paluu=/admin/kierrokset">${k.id?c}</a></td> 
						<td><#if (k.pvm)??>${k.pvm?string('dd.MM.yyyy')}</#if></td>
						<td><#if (k.kentta_id)??>${k.kentta_id?c}</#if> <#-- +kentän nimi --></td>
						<td><#if (k.tii_id)??>${k.tii_id?c}</#if> <#-- +tiin nimi --></td>
						<td><#if (k.yhteensa)??>${k.yhteensa}</#if></td>
						<td><#if (k.p_yht)??>${k.p_yht}</#if></td>
						<td><#if (k.tasoituskierros)??>${k.tasoituskierros?string('kyllä', 'ei')}</#if></td>
						<td><#if (k.pelattu)??>${k.pelattu?replace(1,"etuysi")?replace(2,"takaysi")?replace(3,"koko kierros")}</#if> </td>
						<td><#if (k.lisatieto)??>${k.lisatieto}</#if></td>
						<td>							
							<form name='f' action="/kierros/del/${k.id?c}?paluu=/admin/kierrokset" method='POST' onsubmit="return poista_kierros(${k.id?c}, '${k.pvm?string('dd.MM.yyyy')}', '${k.etunimi}', '${k.sukunimi}', '${k.lisatieto}', ${k.yhteensa});">
  								<#if _csrf??><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></#if>
 								<input name="submit" id="submit${k.id?c}" type="submit" value="delete" />
						   	</form>
 						</td>
					</tr>
				</#list>
			</tbody>
		</table>
	</body>
</html>