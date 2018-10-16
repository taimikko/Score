<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<title>kentta lista</title>
	</head>
	<body>
		<h1>kenttaLista.FTL</h1>
	
	<#include "../_menu.ftl">
		<table  class="table">
			<thead>
				<tr>
				<th scope="col">#</th>
				<th scope="col">Seura</th>
				<th scope="col">kenttä</th>
				<th scope="col">lyhenne</th>
				</tr>
			</thead>
			<tbody>
				<#list kentat as kentta>
					<tr>
						<td scope="row">${kentta.id}</td>
						<td>${kentta.seura_id}</td>
						<td ><a href="/kentta/edit/${kentta.id?c}">${kentta.kentan_nimi}</a></td>
						<td>${kentta.kentan_lyhenne}</td>
						<#-- 
						<td><form name='f' action="/kentta/del/${kentta.id}" method='POST'>
  								<#if _csrf??><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></#if>
 								<input name="submit" type="submit" value="delete" />
						   </form>
						</td>
						-->
					</tr>
				</#list>
			</tbody>

		</table>
		<div>
			<p>
			<a href="/kentta/new">Lisää uusi kenttä</a>
		</div>
	</body>
</html>