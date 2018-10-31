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
      	<@security.authorize url="/admin"> <#--  Näkyy vain niille, joilla on oikeus /admin -sivuun -->
      
      	<h2>Admin Page</h2>
      	<h3>
        	<@security.authorize access="isAuthenticated()">
        	Käyttäjätunnus : <@security.authentication property="principal.username" /> 
	 		</@security.authorize>
       	</h3>
		<br/>
       	<div>
            <a href="/seura/seuraluettelo">seurat</a>
		</div>
		<div>
			<a href="/kayttajaluettelo?seura_id=${seura_id}" id="seuran_jasenet" >seuran jäsenet</a>
			<select id='seura_id' name='seura_id' required  onchange="seuraChange()" >
	      		<#if seurat??>
	      			<#list seurat as seura>
	      				<option value='${seura.id}' <#if seura_id == seura.id>selected="selected" </#if> > ${seura.id} ${seura.nimi} (${seura.lyhenne}) </option>
	      			</#list>
	      		</#if>
	      	</select>
 		</div>
      	<div>
            <a href="/admin/kentat">kentät</a>
      	</div>
     	<div>
      		<a href="/admin/kierrokset?kentta_id=${kentta_id}" id="pelatut_kierrokset" >kentällä pelatut kierrokset</a>  		
	      	<select id='kentta_id' name='kentta_id' required  onchange="kenttaChange()" >
	      		<#if kentat??>
	      			<#list kentat as kentta>
	      				<option value='${kentta.id}' <#if kentta_id == kentta.id>selected="selected" </#if> > ${kentta.id} ${kentta.kentan_nimi} (${kentta.seura_id}) </option>
	      			</#list>
	      		</#if>
	      	</select>
		</div>
		<br/>
      	<div> 
	 	    <#if userInfo??>
	    	 	${userInfo}
	      	</#if>
		</div>
		</@security.authorize>
   </body>
</html>