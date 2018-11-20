<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<title>Käyttäjät</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">
		<script type="application/javascript" src="/js/utils.js"></script>

		<script>
			window.onload = function (e) {
		    	console.log("kayttajaLista.ftl window.onload");
    			makeAllSortable();
	    		makeChoosable('kayttajat');
			}
		</script>
	</head>
	<body>
		<h1>Käyttäjät</h1>
	
	<#include "../_menu.ftl">
		<div>
			<#if rajaus??>${rajaus}</#if>
		</div>
		<table id='kayttajat' name='kayttajat' class="table">
			<thead>
				<tr>
				<th scope="col" class="numsrt" >#</th>
				<th scope="col" class="srt" >Käyttäjätunnus</th>
				<th scope="col" class="srt" >Etunimi</th>
				<th scope="col" class="srt" >Sukunimi</th>
				<th scope="col" class="numsrt" >Seura</th>
				<th scope="col" class="numsrt" >Jäsennumero</th>
				<th scope="col" class="srt" >Voimassa</th>
				<th scope="col" class="srt" >jäsenyys</th> 
				</tr>
			</thead>
			<tbody>
				<#list kayttajat as user>
					<tr onmouseover="mouseOver(this)" onmouseout="mouseOut(this)" onclick="window.location='/kayttaja/info?kayttajatunnus=${user.username}'">
						<td class="num">${user.kayttajaId}</td>
						<td >${user.username}</td>
						<td >${user.etunimi}</td>
						<td >${user.sukunimi}</td>
						<td class="num">${user.seura}</td>
						<td class="num">${user.jasennumero?c}</td>
						<td >${user.enabled?string('kyllä', 'ei')}</td>
						<td class="num">${user.tyyppi}</td>
						<#-- Käyttäjää ei voi enää poistaa
						<td>
  							<form name='f' action="/kayttaja/del/${user.username}" method='POST'>
  								<#if _csrf??><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></#if>
 								<input name="submit" id="submit${user.id?c}" type="submit" value="delete" />
								<script>
									document.getElementById("submit${user.id?c}").addEventListener("click", function (event) {	event.stopPropagation(); });
								</script>

							   	<a href="/pelaaja/history/${user.seuraId}/${user.jasennumero?replace(",","")}">pelaajahistoria</a>
						   </form>
						</td>  -->
					</tr>
				</#list>
			</tbody>
		</table>
		<div>
			<p>
			<a href="/kayttaja/new">Lisää käyttäjä</a>
		</div>
	</body>
</html>