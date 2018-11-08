<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">
		<script type="application/javascript" src="/js/utils.js"></script>

		<title>seuralista</title>
		
		<script>
			window.onload = function (e) {
		    	console.log("seuraLista.ftl window.onload");
				makeAllSortable();		    	
			}
		</script>
	</head>
	<body>
		<h1>seuraLista.FTL</h1>
	
	<#include "../_menu.ftl">
		<table  class="table">
			<thead>
				<tr>
				<th scope="col" class="numsrt">id</th>
				<th scope="col" class="srt">nimi</th>
				<th scope="col" class="srt">lyhenne</th>
				</tr>
			</thead>
			<tbody>
				<#if seurat??>
				<#list seurat as seura>
					<tr onmouseover="mouseOver(this)" onmouseout="mouseOut(this)" onclick="window.location='/seura/edit/${seura.id?c}'">
						<td class="num">${seura.id?c}</td>
						<td>${seura.nimi}</td>
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