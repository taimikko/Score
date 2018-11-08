<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">
		<script type="application/javascript" src="/js/utils.js"></script>
	    
		<title>User list</title>

		<script>
			window.onload = function (e) {
	    		console.log("pelaajaHistoria.ftl window.onload");
				makeAllSortable();		    	
			}

		</script>
	</head>
	<body>
		<h1>pelaajaHistoria.FTL</h1>
	
	<#include "../_menu.ftl">
	<div>
	<#if kayttaja??>
		<table>
			<tr><td>Käyttäjätunnus:</td><td><a href="/kayttaja/info?kayttajatunnus=${kayttaja.username}">${kayttaja.username}</a></td></tr>
			<tr><td>Etunimi:</td><td>${kayttaja.etunimi}</td></tr>
			<tr><td>Sukunimi:</td><td>${kayttaja.sukunimi}</td></tr>
			<tr><td>Seura:</td><td>${kayttaja.seuraId?c}</td></tr>
			<tr><td>Jäsennumero:</td><td>${kayttaja.jasennumero?c}</td></tr>
			<tr><td>Voimassa:</td><td>${kayttaja.enabled?string('kyllä', 'ei')}</td></tr>
			<tr><td>Tyyppi:</td><td>${kayttaja.jasentyyppi}</td></tr>
			<tr><td><br></td></tr>
		</table>
	</#if>
	</div>
		<table  class="table">
			<thead>
				<tr>
				<th scope="col" class="numsrt">Id</th>
				<th scope="col" class="datesrt">Pvm</th>
				<th scope="col" class="numsrt">Seura</th>
				<th scope="col" class="numsrt">Jäsennumero</th>
				<th scope="col" class="numsrt">HCP</th>
				<th scope="col" class="srt">HCP voimassa</th>
				<th> </th>
				</tr>
			</thead>
			<tbody>
				<#list pelaajat as p>
					<tr onmouseover="mouseOver(this)" onmouseout="mouseOut(this)" onclick="window.location='/pelaaja/get/${p.id?c}'">
						<td class='num' >${p.id?c}</td>
						<td class="num" >${p.pvm?string('dd.MM.yyyy HH:mm:ss')}</td>
						<td class='num' >${p.seuraId?c}</td>
						<td class='num' >${p.jasennumero?c}</td>
						<td class='num' >${p.tasoitus}</td>
						<td>${p.tasoitus_voimassa?string('kyllä', 'ei')}</td>
						<td>
  							<form name='f' action="/pelaaja/del/${p.id?c}" method='POST'>
  								<#if _csrf??><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></#if>
 								<input name="submit" type="submit" value="delete" />
							   	<a href="/pelaaja/edit/${p.id?c}">Edit</a>
						   </form>
						</td>
					</tr>
				</#list>
			</tbody>

		</table>
	</body>
</html>