<#-- assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/ -->
<!DOCTYPE HTML>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">

	<title>Uusi Kierros</title>

    <script type="application/javascript" src="/js/kierros.js"></script>    
	<script>
	    <#include "/util/vaylat.ftl">

		<#if seurat??>
			seurat=[<#list seurat as seura>{id:"${seura.id?c}",lyhenne:"${seura.lyhenne}",nimi:"${seura.nimi}"}, </#list>];
		<#else>
			seurat=[{id:"999",lyhenne:"Edu",nimi:"Eduixin testiseura"}];
		</#if>
		<#if jasentyypit??>
			jasentyypit = [<#list jasentyypit as jt>{id:"${jt.id}",tyyppi:"${jt.tyyppi}",kuvaus:"${jt.kuvaus}"}, </#list>];
		<#else>
			jasentyypit = [{id:"2", tyyppi:"jäsen", kuvaus:"Jäsenet"}];
		</#if>

	   	<#if kentat??>
    	<#-- 
    		if (kentat === undefined) {
    		  console.log("kentät puuttuu");
    		  var kentat=[{id:"1", nimi:"koe", seura_id:"0"}]
    		} else {
    		  console.log("kentät on olemassa");
    		}
    	 -->
			kentat=[<#list kentat as kentta>{id:"${kentta.id?c}", nimi:"${kentta.kentan_nimi}", seura_id:"${kentta.seura_id?c}"}, </#list>];
		<#else>
			kentat=[{id:"999",nimi:"Eduix testikenttä",seura_id:"999"}, {id:"1000",nimi:"Eduix toinen kenttä",seura_id:"999"}];
		</#if>
		console.log("KierrosAdd latasi kentät:",kentat);
   		<#if tiit??>
    	<#--
    		if (tiit === undefined) {
    		  console.log("tiit puuttuu");
    		  var tiit=[{id:"0"}]
    		} else {
    		  console.log("tiit on olemassa");
    		}
    	 -->
        	tiit=[<#list tiit as tii>{id:"${tii.id?c}",kentta_id:"${tii.kentta_id?c}",tii_id:"${tii.tii_id?c}",nimi:"${tii.tii_nimi}",sukup:"${tii.sukup}",slope:"${tii.slope}",cr:"${tii.cr}"},</#list>];
		<#else>
        	tiit=[{id:"121",kentta_id:"999",tii_id:"2",nimi:"Edu54",sukup:"1",slope:"125",cr:"72.0"}, 
        	     {id:"126",kentta_id:"999",tii_id:"4",nimi:"Edu45",sukup:"2",slope:"125",cr:"72.0"}];
   		</#if>
		console.log("KierrosAdd latasi tiit:",tiit);

<#-- 		
		if (kierros === undefined) {
			console.log("kierros undefined");
			var kierros = 0;
		} else {
			console.log("kierros on defined");
		}
	 -->
		<#if kierros??>
			kierros = '${kierros}';
		<#else>
			kierros = "kierros puuttuu";
		</#if>
		console.log("KierrosAdd latasi kierroksen:", kierros);

	  	pelaajanSukup = <#if (pelaaja.sukup)??> ${pelaaja.sukup} <#else>1 </#if> ;
	  	if (pelaajanSukup != 2) pelaajanSukup = 1;
<#-- -->
 	  	pelaaja = '${pelaaja}';
		console.log("KierrosAdd latasi pelaajanSukup:",pelaajanSukup, pelaaja);
		
		<#if principal??> <#-- testaukseen: -->
		 var principal = '${principal}';
		<#else>
		 var principal = "principal puuttuu";
		</#if>
		console.log("principal",principal);

		window.onload = function (e) {
			console.log("kierrosAdd window.onload");
		    alustaPvm();
 			alustaKentta(<#if (kierros.kentta_id)??> ${kierros.kentta_id?c}<#else>0</#if>,<#if (kierros.tii_id)??>${kierros.tii_id?c}<#else>0</#if>);
    		alustaPelaajat(<#if (pelaaja.seura_id)??> ${pelaaja.seura_id?c}<#elseif (kierros.seura_id)??>${kierros.seura_id?c}<#else>0</#if>)
		}
</script>   
    
</head>

<body>
    <#include "../_menu.ftl">

    <h2>uusi kierros</h2>
 
	<#if message??>
	     <div style="color:red;margin:10px 0px;">
	     <span>
	     ${message}
	     </span>
		 </div>
	</#if>
	<#if kierros??> 
        <form name='f' action="/kierros/add" method='POST' autocomplete='off'>
            <datalist id='tiiluettelo'>
     			<option value="2">Keltainen</option>
	           	<option value="4">Punainen</option>
            </datalist>

		<#--  kenttä ja tiit pitäisi alustaa myös silloin kun palataan lomakkeelle virheen jälkeen -->
		  	<table>
		  		<tr>
	  	  			<#-- ADMIN voi tehdä vähän enemmän -->
	  	  			<@security.authorize access="hasRole('ROLE_ADMIN')">
 
						<td>pelaajan kotiseura:	</td>
						<td>
							<select class='num2' id='seura_id' name='seura_id' onchange="seuraChange()" required >
							<#if seurat??>
								<#list seurat as seura><option value='${seura.id}' > ${seura.id}. ${seura.nimi}</option></#list>
			                </#if>
			                </select>
			            </td>
						</tr>
					
						<tr>
						<td>jäsennumero:
						</td><td>
							<select class='num2' id='jasennumero' name='jasennumero' onchange="pelaajaValinta()" required >
							<#if pelaajat??>
								<#list pelaajat as pelaaja><option value='${pelaaja.jasennumero?c}' > ${pelaaja.jasennumero?c}. ${pelaaja.etunimi} ${pelaaja.suknimi}</option></#list>
							<#else>
								<option value='${pelaaja.jasennumero?c}' selected='selected' > ${pelaaja.jasennumero?c}</option>
							</#if>
							</select>
						</td>
						<td><span id='vanha_jasennumero' name='vanha_jasennumero'></span></td>
						</tr><tr>

			            <td>etunimi:</td>
			            <td>
			            	<input type='text' maxlength='50' class='txt' name='etunimi' id='etunimi' <#if (kierros.etunimi)??> value='${kierros.etunimi}' <#elseif (pelaaja.etunimi)??>  value='${pelaaja.etunimi}' </#if> >
			            </td>
			            <td>
							sukunimi: <input type='text' maxlength='50' class='txt' name='sukunimi' id='sukunimi' <#if (kierros.sukunimi)??> value='${kierros.sukunimi}' <#elseif (pelaaja.sukunimi)??>  value='${pelaaja.sukunimi}'  </#if> >
						</td>
					</@security.authorize>
					<@security.authorize access="! hasRole('ROLE_ADMIN')">
						<td>pelaaja:
						</td>
						<td>
							<span id='etunimi' name='etunimi' > <#if (kierros.etunimi)??> ${kierros.etunimi} <#elseif (pelaaja.etunimi)??> ${pelaaja.etunimi} <#else> 'nimi puuttuuu' </#if> </span>
							<span id='sukunimi' name='sukunimi' > <#if (kierros.sukunimi)??> ${kierros.sukunimi} <#elseif (pelaaja.sukunimi)??> ${pelaaja.sukunimi} </#if> </span>
			            	<input type='hidden' maxlength='50' class='txt' name='etunimi' id='etunimi' readonly <#if (kierros.etunimi)??> value='${kierros.etunimi}' <#elseif (pelaaja.etunimi)??>  value='${pelaaja.etunimi}' </#if> >
							<input type='hidden' maxlength='50' class='txt' name='sukunimi' id='sukunimi' readonly <#if (kierros.sukunimi)??> value='${kierros.sukunimi}' <#elseif (pelaaja.sukunimi)??>  value='${pelaaja.sukunimi}' </#if> >
						</td>
						<td>
							jäsennumero:
						<#-- jäsennumero = readonly, tulee kirjautuneen käytäjän tietojen mukaan paitsi adminilla, joka voi syöttää muidenkin tietoja -->
							<input type='hidden' class='num' name='jasennumero' <#if (kierros.jasennumero)??> value='${kierros.jasennumero?c}' <#elseif (pelaaja.jasennumero)??> value='${pelaaja.jasennumero?c}' </#if> >
							<span id='jnro' ><#if (kierros.jasennumero)??> ${kierros.jasennumero?c} <#elseif (pelaaja.jasennumero)??> ${pelaaja.jasennumero?c} </#if></span>
							&nbsp;
							seura:
						<#-- kotiseura = readonly, pitäisi tulla pelaajan nimen perusteella -->
							<input type='hidden' min='0' class='num' id='seura_id' name='seura_id'  <#if (kierros.seura_id)??> value='${kierros.seura_id?c}' <#elseif (pelaaja.seuraId)??> value='${pelaaja.seuraId?c}' </#if>  >
							<span id='seura' > <#if (kierros.seura_id)??> ${kierros.seura_id?c} <#elseif (pelaaja.seuraId)??> ${pelaaja.seuraId?c} </#if></span>
							<#if seurat??>
								&nbsp;
								<#list seurat as seura> <#if pelaaja.seuraId==seura.id> ${seura.nimi}</#if> </#list>
							</#if>
						</td>
					</@security.authorize>
				</tr>
				<tr>
					<td>pvm:</td>
					<td><input id='pvm1' type="date" name='pvm' onchange="pvmUpdate()" <#if (kierros.pvm)??> value='${kierros.pvm?string('yyyy-MM-dd')}'<#else>value='01/01/1999' </#if> ></td>
					<td><span id='pvm_str' name='pvm_str'></span> 
					<input type='hidden' id='id' name='id' <#if (kierros.id)??> value='${kierros.id}'</#if> ></input>  
					</td> 
				</tr>
				<tr>
					<td>Valitse kenttä:</td>
					<td>
						<#--
						<select title="Valitse kenttä" id='kentta' name='kentta_id' onselect="alustaTiitSelect()" > 
		                    <#list kentat as kentta>
		                        <option <#if (kierros.kentta_id)??> <#if (kierros.kentta_id?c) == (kentta.id?c)> selected="selected" </#if> </#if> value="${kentta.id?c}">${kentta.id?c} ${kentta.kentan_nimi} (${kentta.seura_id?c})</option>
		                    </#list>
						</select>
						-->
						
						<input autofocus list="kenttaluettelo" autocomplete="off" title="Valitse kenttä" class='num' id='kentta' name='kentta_id' onselect="kenttaValintaInput()" 
						<#if (kierros.kentta_id)??> value='${kierros.kentta_id?c}' 
						 
						</#if> > </input>
						<datalist id="kenttaluettelo" >
		                    <#list kentat as kentta>
		                        <option value="${kentta.id?c}">${kentta.id?c} ${kentta.kentan_nimi} (${kentta.seura_id?c})</option>
		                    </#list>
		                </datalist>
		                 
		            </td>
		            <td id='kentta_nimi'> </td>
		        </tr>
				<tr>
		            <td>Tii, jolta pelattu:</td>
		            <td>
  		                <select id='tii' name='tii_id' onchange="tiiChange()" <#if (kierros.tii_id)??> value='${kierros.tii_id?c}' </#if>  >
   						</select>
		            </td>
		            <td id='tii_nimi'><#if (kierros.tii_id)??>${kierros.tii_id?c}</#if> <#if (kierros.tii_nimi)??>${kierros.tii_nimi}</#if></td>
		        </tr>
		        <tr>
		            <td>pelaajan tasoitus:</td>
		            <td><input type='text'  class='num' name='tasoitus' <#if (kierros.tasoitus)??> value='${kierros.tasoitus}' <#elseif (pelaaja.tasoitus)??> value='${pelaaja.tasoitus}' </#if> > </td>
		            <td>pelitasoitus: lasketaan myöhemmin</td>
		        </tr>
		        <tr>
				<@security.authorize access="hasRole('ROLE_ADMIN')">
		            <td>cba:</td>
		            <td>		                
		            	<input type='number' id='cba' name='cba' class='num' <#if (kierros.cba)??> value='${kierros.cba}' <#else> value='0' </#if>  >
					</td>
				</@security.authorize>
				<@security.authorize access="! hasRole('ROLE_ADMIN')">
		            <td>cba: 
			            <#if (kierros.cba)??> ${kierros.cba} <#else> 0 </#if>
   		            	<input type='hidden' id='cba' name='cba' class='num' <#if (kierros.cba)??> value='${kierros.cba}' <#else> value='0' </#if>  >
		            </td>
				</@security.authorize>
		        </tr>

		   	</table>
			
<#include "/kierros/kierros.ftl">
		    <table>
		        <tr>
		            <td>merkitsijä:</td>
					<td><input type='text' name='merkitsija' id='merkitsija' <#if (kierros.merkitsija)??> value='${kierros.merkitsija}' </#if> ></td>
		            <#--  ${kierros.merkitsija} -->
		        </tr>
		        <tr>
		            <td>lisätieto:</td>
		            <td><input type='text' name='lisatieto' id='lisatieto' <#if (kierros.lisatieto)??> value='${kierros.lisatieto}' </#if> ></td>
		            <#--  ${kierros.lisatieto} -->
		        </tr>
		        <tr>
		            <td>onko tasoituskierros:</td>
                    <td><input type='checkbox' name='tasoituskierros' id='tasoituskierros' <#if (kierros.tasoituskierros)??><#if kierros.tasoituskierros> checked </#if></#if> > </td>
		            <#-- <td>${kierros.tasoituskierros?string('kyllä', 'ei')}</td> -->
		        </tr>
		        <tr>
		            <td>uusi tasoitus:</td>
		            <td><input type='text' name='uusi_tasoitus' id='uusi_tasoitus' readonly <#if (kierros.uusi_tasoitus)??> value='${kierros.uusi_tasoitus}' </#if> ></td>
		            <#--  ${kierros.uusi_tasoitus} -->
		        </tr>
		        <tr>
		            <td>osa/koko kierros:</td>
    				<td><input type='radio' name='pelattu' <#if (kierros.pelattu)??><#if (kierros.pelattu==1)>checked='checked'</#if></#if>value='1'>Etuysi</input><br>
				    <input type='radio' name='pelattu' <#if (kierros.pelattu)??><#if (kierros.pelattu==2)>checked='checked'</#if></#if>value='2'>Takaysi</input><br>
				    <input type='radio' name='pelattu' <#if (kierros.pelattu)??><#if (kierros.pelattu)==3>checked='checked'</#if><#else>checked='checked'</#if>value='3'>Koko kierros</input>
		            <#--  ${kierros.pelattu} -->
		        </tr>
		  		<tr>
		             <td><input name="submit" type="submit" value="submit" onclick='laske_yhteensa()' ></td>           
		        </tr>
		    </table>
		</form>		    
	</#if>
	<br/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>