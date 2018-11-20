<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">
		<script type="application/javascript" src="/js/kierros.js"></script>
		<script type="application/javascript" src="/js/utils.js"></script>

		<title>Kierrosluettelo(admin)</title>

		<script>
			window.onload = function (e) {
		    	console.log("kierrosLuettelo.ftl window.onload");
				makeAllSortable();	
	    		makeChoosable('kierrosluettelo');
			}

		</script>
	</head>
	<body>
		<h1>kierrosLuettelo</h1>
	
	<#include "../_menu.ftl">
	<div>
	</div>
		<#if rajaus??>${rajaus}</#if>
		<table id='kierrosluettelo' name='kierrosluettelo' class="table">
			<thead>
				<tr>
				<th scope="col" class="srt">Etunimi</th>
				<th scope="col" class="srt">Sukunimi</th>
				<th scope="col" class="numsrt">Seura</th>
				<th scope="col" class="numsrt">Jäsennumero</th>
				<th scope="col" class="numsrt">Id</th>
				<th scope="col" class="datesrt">Pvm</th>
				<th scope="col" class="srt">Kenttä</th>
				<th scope="col" class="numsrt">Tii</th>
				<th scope="col" class="numsrt">Lyönnit</th>
				<th scope="col" class="numsrt">Pisteet</th>
				<th scope="col" class="srt">Tasoituskierros</th>
				<th scope="col" class="srt">9/18</th>
				<th scope="col" class="srt">Lisätieto</th>
				<th scope="col"></th>
				</tr>
			</thead>

			
			<tbody>
				<#list kierrokset as k>
					<tr id="tr${k.id?c}" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)" onclick="window.location='/kierros/edit/${k.id?c}?paluu=/admin/kierrokset'"> 
						<td id="td_etunimi${k.id?c}"><#if (k.etunimi)??>${k.etunimi}</#if></td>
						<td id="td_sukunimi${k.id?c}"><#if (k.sukunimi)??>${k.sukunimi}</#if></td>
						<td id="td_seura${k.id?c}" class="num"><#if (k.seura)??>${k.seura}</#if></td>
						<td id="td_jasen${k.id?c}" class="num"><#if (k.jasennumero)??>${k.jasennumero?c}</#if></td>
						<td id="td_id${k.id?c}" class="num">${k.id?c}</td> 
						<td id="td_pvm${k.id?c}" class="num"><#if (k.pvm)??>${k.pvm?string('dd.MM.yyyy')}</#if></td>
						<td id="td_kentta${k.id?c}" class="num"><#if (k.kentta)??>${k.kentta}</#if> </td>
						<td id="td_tii${k.id?c}" class="num"><#if (k.tii)??>${k.tii}</#if> </td>
						<td id="td_yht${k.id?c}" class="num"><#if (k.yhteensa)??>${k.yhteensa}</#if></td>
						<td id="td_p_yht${k.id?c}" class="num"><#if (k.p_yht)??>${k.p_yht}</#if></td>
						<td id="td_taskierros${k.id?c}"><#if (k.tasoituskierros)??>${k.tasoituskierros?string('kyllä', 'ei')}</#if></td>
						<td id="td_pelattu${k.id?c}"><#if (k.pelattu)??>${k.pelattu?replace(1,"etuysi")?replace(2,"takaysi")?replace(3,"koko kierros")}</#if> </td>
						<td id="td_lisatieto${k.id?c}"><#if (k.lisatieto)??>${k.lisatieto}</#if></td>
						<td id="td_nappula${k.id?c}">
							<form name='f' action="/kierros/del/${k.id?c}?paluu=/admin/kierrokset" method='POST' onsubmit="return varmistaPoistetaankoKierros(${k.id?c}, '${k.pvm?string('dd.MM.yyyy')}', '${k.etunimi}', '${k.sukunimi}', '${k.lisatieto}', ${k.yhteensa});">
  								<#if _csrf??><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></#if>
 								<input name="submit" id="submit${k.id?c}" type="submit" value="delete" />
								<script>
									document.getElementById("submit${k.id?c}").addEventListener("click", function (event) {	event.stopPropagation(); });
								</script>
						   	</form>
 						</td>
					</tr>
				</#list>
			</tbody>
		</table>
	</body>
</html>