<!DOCTYPE HTML>
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">
	    <title>${title}</title>
	    
	    <script>
	    
	    function kenttaChange() {
	    	const kentta = document.getElementById("kentta_id").value;
	        document.getElementById("pelatut_kierrokset").href = "/admin/kierrokset?kentta_id="+kentta;
	    }

	    function seuraChange() {
	    	const seura = document.getElementById("seura_id").value;
	        document.getElementById("seuran_jasenet").href = "/kayttajaluettelo?seura_id="+seura;
	    }

   	    </script>
   	</head>
   	<body>
      	<#include "_menu.ftl">
      	<h2>Admin -sivu</h2>
		<br/>
      	<@security.authorize url="/admin"> <#--  Näkyy vain niille, joilla on oikeus /admin -sivuun -->
			<div class="admin">
				<fieldset>
	  				<legend>seura:</legend>
	  				<p>
					<a href="/seura/seuraluettelo">seurat</a>
					<p>
					<a href="/kayttajaluettelo?seura_id=${seura_id}" id="seuran_jasenet" >seuran jäsenet</a>
					<select id='seura_id' name='seura_id' required  onchange="seuraChange()" >
			      		<#if seurat??>
			      			<#list seurat as seura>
			      				<option value='${seura.id}' <#if seura_id == seura.id>selected="selected" </#if> > ${seura.id} ${seura.nimi} (${seura.lyhenne}) </option>
			      			</#list>
			      		</#if>
			      	</select>
					<p>
					<p>
					<@security.authorize url="/kayttaja/new">
						<a href="/kayttaja/new">Lisää uusi käyttäjä</a>
					</@security.authorize>
				</fieldset>				
			</div>
			<div class="admin">
				<fieldset>
	  				<legend>kentät:</legend>
					<p><a href="/admin/kentat">kentät</a></p>
				    <p>
				    <a href="/admin/kierrokset?kentta_id=${kentta_id}" id="pelatut_kierrokset" >kentällä pelatut kierrokset</a>
		      	   	<select id='kentta_id' name='kentta_id' required  onchange="kenttaChange()" >
			      		<#if kentat??>
			      			<#list kentat as kentta>
			      				<option value='${kentta.id}' <#if kentta_id == kentta.id>selected="selected" </#if> > ${kentta.id} ${kentta.kentan_nimi} (${kentta.seura_id}) </option>
			      			</#list>
			      		</#if>
			      	</select>
			      	</p>
				</fieldset>
			</div>
	        <div class="admin">
		        <a href="/kayttajaInfo?kayttajatunnus=<@security.authentication property="principal.username" />"> omat käyttäjätiedot</a>
    	    </div>
		</@security.authorize>
   </body>
</html>