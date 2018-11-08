<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">
		<script type="application/javascript" src="/js/kierros.js"></script>
		<script type="application/javascript" src="/js/utils.js"></script>

		<title>Kierros lista</title>

		<script>
			window.onload = function (e) {
		    	console.log("kierroshistoria.ftl window.onload");
				makeAllSortable();		    	
			}
		</script>
	</head>
	<body>
		<h1>kierrosHistoria.FTL</h1>
	
		<#include "../_menu.ftl">
		<div>
		<#if pelaaja??>
			<table>
				<tr><td>Käyttäjätunnus:</td>
					<td>
					<@security.authorize access="hasRole('ROLE_ADMIN')">
		  	  			<a href="/kayttaja/${pelaaja.username}">${pelaaja.username}</a>
					</@security.authorize>
					<@security.authorize access="! hasRole('ROLE_ADMIN')">
		  	  			<span>${pelaaja.username}</span>
					</@security.authorize>
					</td>
				</tr>
				<tr><td>Etunimi:</td><td>${pelaaja.etunimi}</td></tr>
				<tr><td>Sukunimi:</td><td>${pelaaja.sukunimi}</td></tr>
				<tr><td>Seura:</td><td>${pelaaja.seuraId?c}</td>
					<#if seurat??>
					<td>
						<#list seurat as s>
							<#if s.id==pelaaja.seuraId><span>${s.nimi}</span></#if>
						</#list>
					</td>
					</#if>
				</tr>
				<tr><td>Jäsennumero:</td><td>${pelaaja.jasennumero?c}</td></tr>
				<tr><td>Voimassa:</td><td>${pelaaja.enabled?string('kyllä', 'ei')}</td></tr>
				<tr><td><br></td></tr>
			</table>
		</#if>
		</div>
		<table  class="table">
			<thead>
				<tr>
				<th scope="col" class="numsrt" >Id</th>
				<th scope="col" class="srt">Pvm</th>
				<th scope="col" class="srt">Kenttä</a></th>
				<th scope="col" class="numsrt">Tii</a></th>
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
					<tr onmouseover="mouseOver(this)" onmouseout="mouseOut(this)" onclick="window.location='/kierros/edit/${k.id?c}?paluu=/kierros/omat'">
						<td class="num">${k.id}</td>
						<td>${k.pvm?string('dd.MM.yyyy')}</td>
						<td class="num">${k.kentta_id?c} <#-- +kentän nimi --></td>
						<td class="num">${k.tii_id?c} <#-- +tiin nimi --></td>
						<td class="num">${k.yhteensa}</td>
						<td class="num">${k.p_yht}</td>
						<td>${k.tasoituskierros?string('kyllä', 'ei')}</td>
						<td>${k.pelattu?replace(1,"etuysi")?replace(2,"takaysi")?replace(3,"koko kierros")} <#-- +koodia vastaava tieto 9/18 --></td>
						<td>${k.lisatieto}</td>
						<td>
							<form name='f' action="/kierros/del/${k.id}?paluu=/kierros/omat" method='POST' onsubmit="return poista_kierros(${k.id?c}, '${k.pvm?string('dd.MM.yyyy')}', '${k.etunimi}', '${k.sukunimi}', '${k.lisatieto}', ${k.yhteensa});">
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