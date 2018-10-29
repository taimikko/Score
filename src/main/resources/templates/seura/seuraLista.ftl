<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">

		<title>seuralista</title>
	</head>
	<body>
		<h1>seuraLista.FTL</h1>
	
	<#include "../_menu.ftl">
		<table  class="table">
			<thead>
				<tr>
				<th scope="col">id</th>
				<th scope="col">nimi</th>
				<th scope="col">lyhenne</th>
				</tr>
			</thead>
			<tbody>
				<#if seurat??>
				<#list seurat as seura>
					<tr>
						<td scope="row">${seura.id}</td>
						<td ><a href="/seura/edit/${seura.id?c}">${seura.nimi}</a></td>
						<td>${seura.lyhenne}</td>
					</tr>
				</#list>
				<#else>
					Virhe: seuroja ei ole ladattu
				</#if>
			</tbody>

		</table>
		<div>
			<p>
			<a href="/seura/new">Lisää uusi seura</a>
		</div>
	</body>
</html>