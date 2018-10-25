<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">
	<script type="application/javascript" src="/js/kierros.js"></script>
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
						<td><a href="/kierros/edit/${k.id?c}">${k.id?c}</a></td> <#-- from tänne ?? -->
						<td><#if (k.pvm)??>${k.pvm?string('dd.MM.yyyy')}</#if></td>
						<td><#if (k.kentta_id)??>${k.kentta_id?c}</#if> <#-- +kentän nimi --></td>
						<td><#if (k.tii_id)??>${k.tii_id?c}</#if> <#-- +tiin nimi --></td>
						<td><#if (k.yhteensa)??>${k.yhteensa}</#if></td>
						<td><#if (k.p_yht)??>${k.p_yht}</#if></td>
						<td><#if (k.tasoituskierros)??>${k.tasoituskierros?string('kyllä', 'ei')}</#if></td>
						<td><#if (k.pelattu)??>${k.pelattu?replace(1,"etuysi")?replace(2,"takaysi")?replace(3,"koko kierros")}</#if> </td>
						<td><#if (k.lisatieto)??>${k.lisatieto}</#if></td>
						<td>							
							<form name='f' action="/kierros/del/${k.id}" method='POST'>
  								<#if _csrf??><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></#if>
 								<input name="submit" type="submit" value="delete" />
						   	</form>
 						</td>
					</tr>
				</#list>
			</tbody>

		</table>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	</body>
</html>