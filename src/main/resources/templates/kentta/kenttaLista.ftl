<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">

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
						<td scope="row">${kentta.id?c}</td>
						<td>${kentta.seura_id?c}</td>
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
			<#-- otettu toistaiseksi pois, TODO: kentän lisääminen -> väylien lisääminen kentälle + tiit kentälle jne... 
			<a href="/kentta/new">Lisää uusi kenttä</a>
			-->
		</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	</body>
</html>