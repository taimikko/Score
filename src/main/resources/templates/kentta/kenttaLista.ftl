<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">
		<script type="application/javascript" src="/js/utils.js"></script>

		<title>kentta lista</title>

		<script>
			window.onload = function (e) {
		    	console.log("kenttaLista.ftl window.onload");
				makeAllSortable();		    	
			}
		</script>
	</head>
	<body>
		<#include "../_menu.ftl">
		<h1>kenttaLista.FTL</h1>

		<table class="table">
			<thead>
				<tr>
				<th scope="col" class="numsrt">#</th>
				<th scope="col" class="numsrt">Seura</th>
				<th scope="col" class="srt">kenttä</th>
				<th scope="col" class="srt">lyhenne</th>
				</tr>
			</thead>
			<tbody>
				<#list kentat as kentta>
					<tr onmouseover="mouseOver(this)" onmouseout="mouseOut(this)" onclick="window.location='/kentta/edit/${kentta.id?c}'">
						<td class="num">${kentta.id?c}</td>
						<td class="num">${kentta.seura_id?c}</td>
						<td>${kentta.kentan_nimi}</td>
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
	</body>
</html>