<#-- assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/ -->
<!DOCTYPE HTML>
<html>

<head>
    <title>Uusi Kierros</title>
    <link rel="stylesheet" type="text/css" href="/css/score.css">
	<script type="application/javascript" src="/js/kierros.js"></script>

<script>
	    <#-- console.log("nakkivene"); -->

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
		<#if vaylat??>
        	vaylat=[<#list vaylat as vayla>{id:"${vayla.id?c}",kentta_id:"${vayla.kentta_id?c}",numero:"${vayla.numero?c}",nimi:"${vayla.nimi}",par:"${vayla.par}",
        			pit1:"${vayla.pit1?c}",pit2:"${vayla.pit2?c}",pit3:"${vayla.pit3?c}",pit4:"${vayla.pit4?c}",hcp:"${vayla.hcp}"},</#list>];
		<#else>
        	vaylat=[{id:"649",kentta_id:"999",numero:"1",nimi:"",par:"5", pit1:"435",pit2:"428",pit3:"420",pit4:"401",hcp:"5"},
					{id:"650",kentta_id:"999",numero:"2",nimi:"",par:"4", pit1:"338",pit2:"331",pit3:"315",pit4:"311",hcp:"9"},
					{id:"651",kentta_id:"999",numero:"3",nimi:"",par:"4", pit1:"344",pit2:"319",pit3:"300",pit4:"287",hcp:"3"},
					{id:"652",kentta_id:"999",numero:"4",nimi:"",par:"4", pit1:"357",pit2:"327",pit3:"300",pit4:"287",hcp:"13"},
					{id:"653",kentta_id:"999",numero:"5",nimi:"",par:"4", pit1:"404",pit2:"371",pit3:"350",pit4:"346",hcp:"1"},
					{id:"654",kentta_id:"999",numero:"6",nimi:"",par:"5", pit1:"457",pit2:"443",pit3:"416",pit4:"350",hcp:"7"},
					{id:"655",kentta_id:"999",numero:"7",nimi:"",par:"4", pit1:"318",pit2:"308",pit3:"261",pit4:"241",hcp:"17"},
					{id:"656",kentta_id:"999",numero:"8",nimi:"",par:"4", pit1:"358",pit2:"345",pit3:"301",pit4:"293",hcp:"11"},
					{id:"657",kentta_id:"999",numero:"9",nimi:"",par:"3", pit1:"137",pit2:"130",pit3:"110",pit4:"99",hcp:"15"},
					{id:"658",kentta_id:"999",numero:"10",nimi:"",par:"4", pit1:"340",pit2:"310",pit3:"280",pit4:"268",hcp:"10"},
					{id:"659",kentta_id:"999",numero:"11",nimi:"",par:"3", pit1:"198",pit2:"192",pit3:"174",pit4:"161",hcp:"8"},
					{id:"660",kentta_id:"999",numero:"12",nimi:"",par:"5", pit1:"514",pit2:"499",pit3:"475",pit4:"460",hcp:"6"},
					{id:"661",kentta_id:"999",numero:"13",nimi:"",par:"4", pit1:"321",pit2:"301",pit3:"290",pit4:"270",hcp:"14"},
					{id:"662",kentta_id:"999",numero:"14",nimi:"",par:"3", pit1:"149",pit2:"145",pit3:"135",pit4:"130",hcp:"18"},
					{id:"663",kentta_id:"999",numero:"15",nimi:"",par:"4", pit1:"345",pit2:"330",pit3:"317",pit4:"277",hcp:"4"},
					{id:"664",kentta_id:"999",numero:"16",nimi:"",par:"5", pit1:"464",pit2:"419",pit3:"400",pit4:"382",hcp:"12"},
					{id:"665",kentta_id:"999",numero:"17",nimi:"",par:"3", pit1:"179",pit2:"155",pit3:"151",pit4:"148",hcp:"16"},
					{id:"666",kentta_id:"999",numero:"18",nimi:"",par:"4", pit1:"400",pit2:"381",pit3:"359",pit4:"344",hcp:"2"}];
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
						<td>ADMIN pelaajan kotiseura:
						<#-- kotiseura = readonly, pitäisi tulla pelaajan nimen perusteella -->
						<input type='number' min='0' class='num' id='seura_id' name='seura_id'  <#if (kierros.seura_id)??> value='${kierros.seura_id?c}' <#elseif (pelaaja.seuraId)??> value='${pelaaja.seuraId?c}' </#if>  >
						</td>
						<td><#if seurat??>
							<#list seurat as seura> <#if pelaaja.seuraId==seura.id> ${seura.nimi}</#if> </#list>
			                </#if>
			            </td>
						<td>
							<span> jäsennumero:</span>
						<#-- jäsennumero = readonly, tulee kirjautuneen käytäjän tietojen mukaan paitsi adminilla, joka voi syöttää muidenkin tietoja -->
							<input type='number' class='num' name='jasennumero' <#if (kierros.jasennumero)??> value='${kierros.jasennumero?c}' <#elseif (pelaaja.jasennumero)??> value='${pelaaja.jasennumero?c}' </#if> >
						</td>
						</tr><tr>
						<#--  etu- ja sukunimi voidaan täyttää kotiseuran ja jäsennumeron perusteella -->	
			            <td>etunimi:  <input type='text' maxlength='50' class='txt' name='etunimi' id='etunimi' readonly <#if (kierros.etunimi)??> value='${kierros.etunimi}' <#elseif (pelaaja.etunimi)??>  value='${pelaaja.etunimi}' </#if> >
			            </td>
			            <td>
							sukunimi: <input type='text' maxlength='50' class='txt' name='sukunimi' id='sukunimi' readonly <#if (kierros.sukunimi)??> value='${kierros.sukunimi}' <#elseif (pelaaja.sukunimi)??>  value='${pelaaja.sukunimi}'  </#if> >
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
					<td><input id='pvm1' autofocus type="date" name='pvm' onchange="pvmUpdate()" <#if (kierros.pvm)??> value='${kierros.pvm?string('yyyy-MM-dd')}'<#else>value='01/01/1999' </#if> ></td>
					<td><span id='pvm_str' name='pvm_str'></span> </td>
					<td> <#if (kierros.id)??> <p id='id' name='id'>id:${kierros.id}</p> </#if> </td> 
				</tr>
				<tr>
					<td>Valitse kenttä:</td>
					<td><input style="color:blue;" list="kenttaluettelo" title="Valitse kenttä" class='num' id='kentta' name='kentta_id' onselect="kenttaValinta()" <#if (kierros.kentta_id)??> value='${kierros.kentta_id?c}' 
					<#-- TODO: select myös alustaa oletuksena valitun kentän tiit -->
					</#if> >

						<datalist id="kenttaluettelo" >
		                    <#list kentat as kentta>
		                        <option value="${kentta.id?c}">${kentta.id?c} ${kentta.kentan_nimi} (${kentta.seura_id?c})</option>
		                    </#list>
		                </datalist>
		                
		            </td>
		            <td id='kentta_nimi'>
		            </td>

		        </tr>
		        <tr>
		            <td>pelaajan tasoitus:</td>
		            <td><input type='text'  class='num' name='tasoitus' <#if (kierros.tasoitus)??> value='${kierros.tasoitus}' <#elseif (pelaaja.tasoitus)??> value='${pelaaja.tasoitus}' </#if> > </td>
		        </tr>
		       <tr>
		            <td>Tii, jolta pelattu:</td>
		            <td>
		                <input id='tii'  class='num' list='tiiluettelo' name='tii_id' onselect="tiiValinta()" <#if (kierros.tii_id)??> value='${kierros.tii_id?c}' </#if>  >
		            </td>
		            <td id='tii_nimi'> </td>
		        </tr>
		        <tr>
		            <td>pelitasoitus:</td>
		            <td>lasketaan myöhemmin</td>
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
			
			<table>
				<thead>
				<#-- 
					<th scope="col">etuysi</th>
					<th scope="col">takaysi</th>
					 -->
				</thead>
				<tbody>
					<tr>
					<td> <#-- etuysi -->
						<table>
							<thead>
								<th scope="col" style="width:40%">reikä</th>
								<th scope="col" style="width:30%">lyönnit</th>
								<th scope="col" style="width:30%">pisteet</th>
							</thead>
							<tbody>
								<tr>
									<td>1.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h1' id='h1' onkeyup="seuraava(event, 'h2')" <#if (kierros.h1)??> value='${kierros.h1}' </#if> ></td>
									<td>p1
										<#if (kierros.p1)??> '${kierros.p1}' </#if>
									</td>
								</tr>
								<tr>
									<td>2.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h2' id='h2' onkeyup="seuraava(event, 'h3')" <#if (kierros.h2)??> value='${kierros.h2}' </#if> ></td>
									<td>p2</td>
								</tr>
								<tr>
									<td>3.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h3' id='h3' onkeyup="seuraava(event, 'h4')" <#if (kierros.h3)??> value='${kierros.h3}' </#if> ></td>
									<td>p3</td>
								</tr>
								<tr>
									<td>4.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h4' id='h4' onkeyup="seuraava(event, 'h5')" <#if (kierros.h4)??> value='${kierros.h4}' </#if> ></td>
									<td>p4</td>
								</tr>
								<tr>
									<td>5.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h5' id='h5' onkeyup="seuraava(event, 'h6')" <#if (kierros.h5)??> value='${kierros.h5}' </#if> ></td>
									<td>p5</td>
								</tr>
								<tr>
									<td>6.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h6' id='h6' onkeyup="seuraava(event, 'h7')" <#if (kierros.h6)??> value='${kierros.h6}' </#if> ></td>
									<td>p6</td>
								</tr>
								<tr>
									<td>7.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h7' id='h7' onkeyup="seuraava(event, 'h8')" <#if (kierros.h7)??> value='${kierros.h7}' </#if> ></td>
									<td>p7</td>
								</tr>
								<tr>
									<td>8.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h8' id='h8' onkeyup="seuraava(event, 'h9')" <#if (kierros.h8)??> value='${kierros.h8}' </#if> ></td>
									<td>p8</td>
								</tr>
								<tr>
									<td>9.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h9' id='h9' onkeyup="seuraava(event, 'h10')" <#if (kierros.h9)??> value='${kierros.h9}' </#if> ></td>
									<td>p9</td>
								</tr>
								<tr>
									<td>1-9</td>
									<td>
										<input type='text' maxlength='3' class='num' name='hout' id='hout' readonly <#if (kierros.hout)??> value='${kierros.hout}' </#if> ></td>
									<td>p_out</td>
								</tr>
								<tr>
									<#-- tilaa yhteensä -riville -->
								</tr>
							</tbody>
						</table>
					</td>
		
					<td> <#-- takaysi -->
						<table>
							<thead>
								<th scope="col" style="width:40%">reikä</th>
								<th scope="col" style="width:30%">lyönnit</th>
								<th scope="col" style="width:30%">pisteet</th>
							</thead>
							<tbody>
								<tr>
									<td>10.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h10' id='h10' onkeyup="seuraava(event, 'h11')" <#if (kierros.h10)??> value='${kierros.h10}' </#if> ></td>
									<td>p10</td>
								</tr>
								<tr>
									<td>11.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h11' id='h11' onkeyup="seuraava(event, 'h12')" <#if (kierros.h11)??> value='${kierros.h11}' </#if> ></td>
									<td>p11</td>
								</tr>
								<tr>
									<td>12.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h12' id='h12' onkeyup="seuraava(event, 'h13')" <#if (kierros.h12)??> value='${kierros.h12}' </#if> ></td>
									<td>p12</td>
								</tr>
								<tr>
									<td>13.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h13' id='h13' onkeyup="seuraava(event, 'h14')" <#if (kierros.h13)??> value='${kierros.h13}' </#if> ></td>
									<td>p13</td>
								</tr>
								<tr>
									<td>14.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h14' id='h14' onkeyup="seuraava(event, 'h15')" <#if (kierros.h14)??> value='${kierros.h14}' </#if> ></td>
									<td>p14</td>
								</tr>
								<tr>
									<td>15.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h15' id='h15' onkeyup="seuraava(event, 'h16')" <#if (kierros.h15)??> value='${kierros.h15}' </#if> ></td>
									<td>p15</td>
								</tr>
								<tr>
									<td>16.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h16' id='h16' onkeyup="seuraava(event, 'h17')" <#if (kierros.h16)??> value='${kierros.h16}' </#if> ></td>
									<td>p16</td>
								</tr>
								<tr>
									<td>17.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h17' id='h17' onkeyup="seuraava(event, 'h18')" <#if (kierros.h17)??> value='${kierros.h17}' </#if> ></td>
									<td>p17</td>
								</tr>
								<tr>
									<td>18.</td>
									<td>
										<input type='text' maxlength='2' class='num' name='h18' id='h18' onkeyup="seuraava(event, 'merkitsija')" <#if (kierros.h18)??> value='${kierros.h18}' </#if> ></td>
									<td>p18</td>
								</tr>
								<tr>
									<td>10-18</td>
									<td>
										<input type='text' maxlength='3' class='num' name='hin' id='hin' readonly <#if (kierros.hin)??> value='${kierros.hin}' </#if> ></td>
									<td>p_in</td>
								</tr>
								<tr>
									<td>yhteensä</td>
									<td>
										<input type='text' maxlength='3' class='num' name='yhteensa' id='yhteensa' readonly <#if (kierros.yhteensa)??> value='${kierros.yhteensa}' </#if> >
										</td>
									<td>p_yht</td>
								</tr>

							</tbody>
						</table>
					</td>
					</tr>
				</tbody>
			</table>
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
</body>
</html>