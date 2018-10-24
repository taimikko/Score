<!DOCTYPE HTML>
<#-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">
		<script type="application/javascript" src="/js/kierros.js"></script>

		<title>Kierros lista</title>
		<script>
		</script>
<#--		
		<input type="hidden"
				name="${_csrf.parameterName}"
				value="${_csrf.token}"/>
-->
		</head>
	<body>
		<h1>kierrosHistoria.FTL</h1>
	
	<#include "../_menu.ftl">
	<div>
	<#if pelaaja??>
		<table>
			<tr><td>Käyttäjätunnus:</td><td><a href="/kayttaja/${pelaaja.username}">${pelaaja.username}</a></td></tr>
			<tr><td>Etunimi:</td><td>${pelaaja.etunimi}</td></tr>
			<tr><td>Sukunimi:</td><td>${pelaaja.sukunimi}</td></tr>
			<tr><td>Seura:</td><td>${pelaaja.seuraId?c}</td></tr>
			<tr><td>Jäsennumero:</td><td>${pelaaja.jasennumero?c}</td></tr>
			<tr><td>Voimassa:</td><td>${pelaaja.enabled?string('kyllä', 'ei')}</td></tr>
			<tr><td>.</td></tr>
		</table>
	</#if>
	</div>
		<table  class="table">
			<thead>
				<tr>
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
						<td scope="row">${k.id}</td>
						<td><a href="/kierros/edit/${k.id?c}">${k.pvm?string('dd.MM.yyyy')}</a></td>
						<td>${k.kentta_id?c} <#-- +kentän nimi --></td>
						<td>${k.tii_id?c} <#-- +tiin nimi --></td>
						<td>${k.yhteensa}</td>
						<td>${k.p_yht}</td>
						<td>${k.tasoituskierros?string('kyllä', 'ei')}</td>
						<td>${k.pelattu?replace(1,"etuysi")?replace(2,"takaysi")?replace(3,"koko kierros")} <#-- +koodia vastaava tieto 9/18 --></td>
						<td>${k.lisatieto}</td>
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