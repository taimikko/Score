<#-- assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/ -->
<!DOCTYPE HTML>
<html>

<head>
    <title>Uusi Kierros</title>
    <link rel="stylesheet" type="text/css" href="/css/score.css">
<#-- 
	<script type="application/javascript" src="/js/kierros.js" 	/>
-->
    <script language="javascript">
 
var kenttaId=0;
var tiiId = 0;
var kentat;
var tiit;
var seurat;
var jasentyypit;
var vaylat;
var pelaajanSukup;
 
function kenttaValinta() {
    kenttaId = document.getElementById('kentta').value;
    if (kentat === undefined) {
        console.log("DEBUG: kenttaValinta() id=", kenttaId, "kentat===undefined");
    } else {
        console.log("DEBUG: kenttaValinta() id=", kenttaId, "kenttiä on ",kentat.length);
    }

    var kentan_nimi;
    var kentta;
    for (var i = 0; i < kentat.length; i++) {
        kentta = kentat[i];
        if (kentta.id == kenttaId) {
            kentan_nimi = kentta.nimi;
            break;
        }
    }
    console.log("DEBUG: id=", kenttaId, kentan_nimi);

    var tii;
    var ok = false;
    var optiot = "";
    for (i = 0; i < tiit.length; i++) {
        tii = tiit[i];
        if ((tii.kentta_id == kenttaId) && (tii.sukup == pelaajanSukup)) {
            console.log("for[", i, "]:", tii.kentta_id, tii.nimi, tii.slope, tii.cr);
            optiot += '<option value="' + tii.id + '">' + tii.tii_id + ' ' + tii.nimi + '</option> '
            ok = true;
        }
    }
    if (ok == true) {
        document.getElementById('tiiluettelo').innerHTML = '`' + optiot + '`';
    } else {
        console.log("Alusta oletusarvoilla.");
        document.getElementById('tiiluettelo').innerHTML = `
        <option value="2">Keltainen</option>
        <option value="3">Sininen</option>
        <option value="4">Punainen</option>
        `;
    }
    document.getElementById('tii').value = '';
    document.getElementById('tii_nimi').innerHTML = '';
    document.getElementById('kentta_nimi').innerHTML = kentan_nimi;
}


function tiiValinta() {
    tiiId = document.getElementById('tii').value;
    var tii_nimi;
    var tii;
    for (var i = 0; i < tiit.length; i++) {
        tii = tiit[i];
        if (tii.id == tiiId) {
            tii_nimi = tii.nimi;
            break;
        }
    }
    console.log("DEBUG: tii=", tiiId, tii_nimi);
    document.getElementById('tii_nimi').innerHTML = tii_nimi;
}

function getRandomPvm() {
    var end = new Date();
    var start = new Date(2000, 1, 1);
    var date = new Date(+start + Math.random() * (end - start));
    console.log("Date", date, date.toString(), date.getDate());
    return date;
}

function pvmUpdate() {
    var pvm = document.getElementById('pvm1').value; //.innerHTML; 
    console.log("pvmUpdate", pvm);
    document.getElementById('pvm_str').innerHTML = pvm;
}

function setRandomPvm() {
    var date = getRandomPvm();
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    var pvm = [y, (m > 9 ? '' : '0') + m, (d > 9 ? '' : '0') + d].join('-');

    console.log("RandomPvm", date, pvm);

    document.getElementById('pvm1').innerHTML = pvm; // pvmUpdate haki ennen innerHTML:ää
    document.getElementById('pvm1').value = pvm; // value asettaa arvon näkyviin
    pvmUpdate();
}

window.onload = function (e) {
   // console.log("kierros.js window.onload", e);
    setRandomPvm();
<#-- 
}
	    window.onload = function(e) {
 -->
	        console.log("kierrosAdd window.onLoad");
	    	<#if kentat??>
    			kentat=[<#list kentat as kentta>{id:"${kentta.id?c}", nimi:"${kentta.kentan_nimi}", seura_id:"${kentta.seura_id?c}"}, </#list>];
    		<#else>
    			kentat=[{id:"999",nimi:"Eduix testikenttä",seura_id:"999"}, {id:"1000",nimi:"Eduix toinen kenttä",seura_id:"999"}];
    		</#if>
    		console.log(kentat);
    		<#if tiit??>
            	tiit=[<#list tiit as tii>{id:"${tii.id?c}",kentta_id:"${tii.kentta_id?c}",tii_id:"${tii.tii_id?c}",nimi:"${tii.tii_nimi}",sukup:"${tii.sukup}",slope:"${tii.slope}",cr:"${tii.cr}"},</#list>];
 			<#else>
            	tiit=[{id:"121",kentta_id:"999",tii_id:"2",nimi:"Edu54",sukup:"1",slope:"125",cr:"72.0"}, 
            	     {id:"126",kentta_id:"999",tii_id:"4",nimi:"Edu45",sukup:"2",slope:"125",cr:"72.0"}];
	   		</#if>
        	
 			setRandomPvm();
 			
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
   
    	  	pelaajanSukup = <#if (pelaaja.sukup)??> ${pelaaja.sukup} <#else>1 </#if> ;
    	  	if (pelaajanSukup != 2) pelaajanSukup = 1;
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

		  	<table>
				<tr>
					<td>pvm:</td>
					<td><input id='pvm1' type="date" name='pvm' onchange="pvmUpdate()" <#if (kierros.pvm)??> value='${kierros.pvm?string('yyyy-MM-dd')}'<#else>value='01/01/1999' </#if> /></td>
					<td><p id='pvm_str' name='pvm_str'></p> 
					</td>
				</tr>
				<tr>
					<td>pelaajan kotiseura:</td>
					<td><input type='number' class='num' name='seura_id' <#if (pelaaja.seuraId)??> value='${pelaaja.seuraId?c}' </#if>  /></td>
					<td><#if seurat??>
						<#list seurat as seura>
		                    <#if pelaaja.seuraId==seura.id> ${seura.nimi}</#if>
		                </#list>
		                </#if>
		            </td>
				</tr>
				<tr>
					<td>pelaajan jäsennumero:</td>
					<td><input type='number' class='num' name='jasennumero' <#if (pelaaja.jasennumero)??> value='${pelaaja.jasennumero?c}' </#if> /></td>
					<td><p id='pelaajan_nimi' name='pelaajan_nimi'></p>
				</tr>
				<tr>
					<td>Valitse kenttä:</td>
					<td><input style="color:blue;" list="kenttaluettelo" title="Valitse kenttä" class='num' id='kentta' name='kentta_id' onselect="kenttaValinta()" />

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
		            <td><input type='text'  class='num' name='tasoitus' <#if (pelaaja.tasoitus)??> value='${pelaaja.tasoitus}' </#if> /> </td>
		        </tr>
		       <tr>
		            <td>Tii, jolta pelattu:</td>
		            <td>
		                <input id='tii'  class='num' list='tiiluettelo' name='tii_id' onselect="tiiValinta()" >
		            </td>
		            <td id='tii_nimi'> </td>
		        </tr>
		        <tr>
		            <td>pelitasoitus:</td>
		            <td>pitäisi askea jostain jos kiinnostaaa</td>
		        </tr>
		        <tr>
		            <td>cba:</td>
		            <td>tätä ei käyttäjä tiedä, tulee kilpailuissa jostain</td>
		        </tr>
		   	</table>
		   <table>
		        <thead>
		            <th scope="col">reikä</th>
		            <th scope="col">lyönnit</th>
		            <th scope="col">pisteet</th>
		        </thead>
		        <tbody>
		        <tr>
		            <td>1.</td>
		            <td><input type='number'  class='num' name='h1' <#if (kierros.h1)??> value='${kierros.h1} </#if> /></td>
		            <td>'p1' <#if (kierros.p1)??> '${kierros.p1} </#if> </td>
		        </tr>
		        <tr>
		            <td>2.</td>
		            <td><input type='number' class='num' name='h2' /></td>
		            <td>'p2'</td>
		        </tr>
		        <tr>
		            <td>3.</td>
		            <td><input type='number' class='num' name='h3' /></td>
		            <td>'p3'</td>
		        </tr>
		        <tr>
		            <td>4.</td>
		            <td><input type='number' class='num' name='h4' /></td>
		            <td>'p4'</td>
		        </tr>
		        <tr>
		            <td>5.</td>
					<td><input type='number'  class='num' name='h5' /></td>
		            <td>'p5'</td>
		        </tr>
		        <tr>
		            <td>6.</td>
					<td><input type='number'  class='num' name='h6' /></td>
		            <td>'p6'</td>
		        </tr>
		        <tr>
		            <td>7.</td>
					<td><input type='number'  class='num' name='h7' /></td>
		            <td>'p7'</td>
		        </tr>
		        <tr>
		            <td>8.</td>
					<td><input type='number'  class='num' name='h8' /></td>
		            <td>'p8'</td>
		        </tr>
		        <tr>
		            <td>9.</td>
					<td><input type='number'  class='num' name='h9' /></td>
		            <td>'p9'</td>
		        </tr>
		        <tr>
		            <td>h_out</td>
					<td><#--  input type='number'  class='num' name='h_out' --></td>
		            <td>'p_out'</td>
		        </tr>
		        <tr>
		            <td>10.</td>
					<td><input type='number'  class='num' name='h10' /></td>
		            <td>'p10'</td>
		        </tr>
		        <tr>
		            <td>11.</td>
					<td><input type='number'  class='num' name='h11' /></td>
		            <td>'p11'</td>
		        </tr>
		        <tr>
		            <td>12.</td>
					<td><input type='number'  class='num' name='h12' /></td>
		            <td>'p12'</td>
		        </tr>
		        <tr>
		            <td>13.</td>
					<td><input type='number'  class='num' name='h13' /></td>
		            <td>'p13'</td>
		        </tr>
		        <tr>
		            <td>14.</td>
					<td><input type='number'  class='num' name='h14' /></td>
		            <td>'p14'</td>
		        </tr>
		        <tr>
		            <td>15.</td>
					<td><input type='number'  class='num' name='h15' /></td>
		            <td>'p15'</td>
		        </tr>
		        <tr>
		            <td>16.</td>
					<td><input type='number'  class='num' name='h16' /></td>
		            <td>'p16'</td>
		        </tr>
		        <tr>
		            <td>17.</td>
					<td><input type='number'  class='num' name='h17' /></td>
		            <td>'p17'</td>
		        </tr>
		        <tr>
		            <td>18.</td>
					<td><input type='number'  class='num' name='h18' /></td>
		            <td>'p18'</td>
		        </tr>
		        <tr>
		            <td>h_in</td>
					<td><#-- input type='number'  class='num' name='h_in' --></td>
		            <td>'p_in'</td>
		        </tr>
		        <tr>
		            <td>yhteensä</td>
					<td><#--  input type='number'  class='num' name='yhteensa' --></td>
		            <td>'p_yht'</td>
		        </tr>
		        </tbody>
		    </table>
		    <table>
		        <tr>
		            <td>merkitsijä:</td>
					<td><input type='text' name='merkitsija' /></td>
		            <#--  ${kierros.merkitsija} -->
		        </tr>
		        <tr>
		            <td>lisätieto:</td>
		            <td><input type='text' name='lisatieto' /></td>
		            <#--  ${kierros.lisatieto} -->
		        </tr>
		        <tr>
		            <td>onko tasoituskierros:</td>
                    <td><input type='checkbox' name='tasoituskierros' <#if (kierros.tasoituskierros)??><#if kierros.tasoituskierros> checked </#if></#if> /> </td>
		            <#-- <td>${kierros.tasoituskierros?string('kyllä', 'ei')}</td> -->
		        </tr>
		        <tr>
		            <td>uusi tasoitus:</td>
		            <td><input type='text' name='uusi_tasoitus' readonly /></td>
		            <#--  ${kierros.uusi_tasoitus} -->
		        </tr>
		        <tr>
		            <td>etuysi/takaysi/koko kierros:</td>
    				<td><input type='radio' name='pelattu' <#if (kierros.pelattu)??><#if (kierros.pelattu==1)>checked='checked'</#if></#if>value='1'>Etuysi</input><br>
				    <input type='radio' name='pelattu' <#if (kierros.pelattu)??><#if (kierros.pelattu==2)>checked='checked'</#if></#if>value='2'>Takaysi</input><br>
				    <input type='radio' name='pelattu' <#if (kierros.pelattu)??><#if (kierros.pelattu)==3>checked='checked'</#if><#else>checked='checked'</#if>value='3'>Koko kierros</input>
		            <#--  ${kierros.pelattu} -->
		        </tr>
		  		<tr>
		             <td><input name="submit" type="submit" value="submit" /></td>
		        </tr>
		    </table>
		</form>		    
	</#if>
	<br/>
</body>
</html>