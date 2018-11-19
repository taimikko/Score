<!DOCTYPE HTML>
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">
	    <title>${title}</title>
	    
	    <script>
	    
	    function addOptions(allOptions, field, newOption) {
	    console.log(allOptions, field, newOption);
	    	if ((newOption == "") || (newOption == "kaikki")) return allOptions;
	    	if (allOptions == "") return '?'+field+'='+newOption; 
   			return allOptions + '&' + field + '=' + newOption;
	    }
	    
	    function kierrosluetteloChange() {
			var options = "";
	    	options = addOptions(options, "kentta_id", document.getElementById("kentta_id").value);
	    	// options = addOptions(options, "seura", document.getElementById("seura").value);
	    	options = addOptions(options, "tasoituskierros", document.getElementById("tasoituskierros").value);

	    	options = addOptions(options, "alkupvm", document.getElementById("alkupvm").value);
	    	options = addOptions(options, "loppupvm", document.getElementById("loppupvm").value);
	    	
	        document.getElementById("pelatut_kierrokset").href = "/admin/kierrokset"+options;
	    }

	    function seuraChange() {
	    	const seura = document.getElementById("seura_id").value;
	        document.getElementById("seuran_jasenet").href = "/kayttajaluettelo?seura_id="+seura;
	    }
	    
	 
	 	window.onload = function (e) {
	 		// Alustetaan päiväys kuluvan vuoden alusta tähän päivään
	        var pvm = new Date()
	        var y = pvm.getFullYear();
    		var m = pvm.getMonth() + 1;
			var d = pvm.getDate();
   			var pvmstr = [y, (m > 9 ? '' : '0') + m, (d > 9 ? '' : '0') + d].join('-');

	        document.getElementById("loppupvm").value=pvmstr;
    		document.getElementById("alkupvm").value= [pvm.getFullYear(),'01','01'].join('-');
    		kierrosluetteloChange();
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
				    <a href="/admin/kierrokset" id="pelatut_kierrokset" >kentällä pelatut kierrokset</a>
		      	   	<select id='kentta_id' name='kentta_id' required  onchange="kierrosluetteloChange()" >
			      		<option value='kaikki' selected="selected" > kaikki </option>
			      		<#if kentat??>
			      			<#list kentat as kentta>
			      				<option value='${kentta.id}' > ${kentta.id} ${kentta.kentan_nimi} (${kentta.seura_id}) </option>
			      			</#list>
			      		</#if>
			      	</select>
<#-- 			      	
			@RequestParam(value = "jasennumero", required = false) Long jasennumero,
			@RequestParam(value = "etunimi", required = false) String etunimi, 
			@RequestParam(value = "sukunimi", required = false) String sukunimi,

			@RequestParam(value = "pisteet", required = false) Long pisteet	) 
-->
<#-- 
		      	   	<select id='seura' name='seura' required  onchange="kierrosluetteloChange()" >
			      		<option value='kaikki' selected="selected" > kaikki </option>
			      		<#if seurat??>
			      			<#list seurat as seura>
			      				<option value='${seura.id}' > ${seura.id} ${seura.nimi} (${seura.lyhenne}) </option>
			      			</#list>
			      		</#if>
			      	</select>
-->			      	
		      	   	<select id='tasoituskierros' name='tasoituskierros' required  onchange="kierrosluetteloChange()" >
			      		<option value='kaikki' selected="selected" > kaikki </option>
			      		<option value='true' > kyllä </option>
			      		<option value='false'> ei </option>
			      	</select>
			      	
			      	<input id='alkupvm' type="date" name='alkupvm' onchange="kierrosluetteloChange()"  >
			      	<input id='loppupvm' type="date" name='loppupvm' onchange="kierrosluetteloChange()"  >

			      	</p>
				</fieldset>
			</div>
	        <div class="admin">
		        <a href="/kayttajaInfo?kayttajatunnus=<@security.authentication property="principal.username" />"> omat käyttäjätiedot</a>
    	    </div>
		</@security.authorize>
   </body>
</html>