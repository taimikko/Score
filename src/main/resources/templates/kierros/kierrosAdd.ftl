<#-- assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/ -->
<!DOCTYPE HTML>
<html>

<head>
    <title>Uusi Kierros</title>

    <script>
        var kenttaId=0;
        var tiit;
        var tiiId = 0; 
        
        function kenttaValinta() {
          kenttaId = document.getElementById('kentta').value;
          var kentan_nimi;

          var kentat=[<#list kentat as kentta>{id:"${kentta.id}",nimi:"${kentta.kentan_nimi}"}, </#list>];
          for (i=0;i<kentat.length;i++) {
             kentta = kentat[i];
             if (kentta.id == kenttaId) {
             	kentan_nimi = kentta.nimi;
             	break;  
             }
          }
          console.log("DEBUG: id=", kenttaId, kentan_nimi);
		  tiit=[<#list tiit as tii>{id:"${tii.id?c}",kentta_id:"${tii.kentta_id?c}",tii_id:"${tii.tii_id?c}",nimi:"${tii.tii_nimi}",sukup:"${tii.sukup}",slope:"${tii.slope}",cr:"${tii.cr}"},</#list>];

		  var pelaajanSukup = <#if (pelaaja.sukup)??>${pelaaja.sukup}<#else>1</#if> ;
          if (pelaajanSukup != 2) pelaajanSukup = 1;
          var tii;
          var ok= false;
          var optiot="";
          for (i=0;i<tiit.length;i++) {
             tii = tiit[i];
             if ((tii.kentta_id == kenttaId) && (tii.sukup == pelaajanSukup)) {
               console.log("for[",i,"]:",tii.kentta_id, tii.nimi, tii.slope, tii.cr);
               optiot+= '<option value="' + tii.id + '">' + tii.tii_id + ' ' + tii.nimi + '</option> '
               ok = true;
             }
          }
          if (ok == true) {
             document.getElementById('tiiluettelo').innerHTML='`'+optiot+'`';
		  } else {
            console.log("Alusta oletusarvoilla.");
            document.getElementById('tiiluettelo').innerHTML=`
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
          for (i=0;i<tiit.length;i++) {
             tii = tiit[i];
             if (tii.id == tiiId) {
             	tii_nimi = tii.nimi;
             	break;  
             }
          }
          console.log("DEBUG: tii=", tiiId, tii_nimi);
          document.getElementById('tii_nimi').innerHTML= tii_nimi;
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
        <form name='f' action="/kierros/add" method='POST'>
            <datalist id='tiiluettelo'>
     			<option value="2">Keltainen</option>
	           	<option value="4">Punainen</option>
            </datalist>

		  	<table>
				<tr>
					<td>pvm:</td>
					<td><input type="date" <#-- "datetime-local" ei toimi --> name='pvm' <#if (kierros.pvm)??> value='${kierros.pvm?string('yyyy-MM-dd HH:mm:ss')}'<#else>value='2018-10-15 12:10:00' </#if> /></td>
				</tr>
				<tr>
					<td>pelaajan kotiseura:</td>
					<td><input type='number' name='seura_id' <#if (pelaaja.seuraId)??> value='${pelaaja.seuraId?c}' </#if>  /></td>
					<td><#if seurat??>
						<#list seurat as seura>
		                    <#if pelaaja.seuraId==seura.id> ${seura.nimi}</#if>
		                </#list>
		                </#if>
		            </td>
				</tr>
				<tr>
					<td>pelaajan jäsennumero:</td>
					<td><input type='number' name='jasennumero' <#if (pelaaja.jasennumero)??> value='${pelaaja.jasennumero?c}' </#if> /></td>
				</tr>
				<tr>
					<td>Valitse kenttä:</td>
					<td><input list="kenttaluettelo" id='kentta' name='kentta_id' onselect="kenttaValinta()" />
						<datalist id="kenttaluettelo">
		                    <#list kentat as kentta>
		                        <option value="${kentta.id}">${kentta.id} (${kentta.seura_id}) ${kentta.kentan_nimi}</option>
		                    </#list>
		                </datalist>
		            </td>
		            <td id='kentta_nimi'>
		            </td>
		            <#--  kentän valinta pitäisi hakea kenttää vastaavat tiit seuraavaan listaan ja poistaa mahdollinen aiempi valinta tii:ltä  -->
		        </tr>
		        <tr>
		            <td>pelaajan tasoitus:</td>
		            <td><input type='text' name='tasoitus' <#if (pelaaja.tasoitus)??> value='${pelaaja.tasoitus}' </#if> /> </td>
		        </tr>
		       <tr>
		            <td>Tii, jolta pelattu:</td>
		            <td>
		                <input id='tii' list='tiiluettelo' name='tii_id' onselect="tiiValinta()" >
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
		            <td><input type='number' name='h1' <#if (kierros.h1)??> value='${kierros.h1} </#if> /></td>
		            <td>'p1' <#if (kierros.p1)??> '${kierros.p1} </#if> </td>
		        </tr>
		        <tr>
		            <td>2.</td>
		            <td><input type='number' name='h2' /></td>
		            <td>'p2'</td>
		        </tr>
		        <tr>
		            <td>3.</td>
		            <td><input type='number' name='h3' /></td>
		            <td>'p3'</td>
		        </tr>
		        <tr>
		            <td>4.</td>
		            <td><input type='number' name='h4' /></td>
		            <td>'p4'</td>
		        </tr>
		        <tr>
		            <td>5.</td>
					<td><input type='number' name='h5' /></td>
		            <td>'p5'</td>
		        </tr>
		        <tr>
		            <td>6.</td>
					<td><input type='number' name='h6' /></td>
		            <td>'p6'</td>
		        </tr>
		        <tr>
		            <td>7.</td>
					<td><input type='number' name='h7' /></td>
		            <td>'p7'</td>
		        </tr>
		        <tr>
		            <td>8.</td>
					<td><input type='number' name='h8' /></td>
		            <td>'p8'</td>
		        </tr>
		        <tr>
		            <td>9.</td>
					<td><input type='number' name='h9' /></td>
		            <td>'p9'</td>
		        </tr>
		        <tr>
		            <td>h_out</td>
					<td><#--  input type='number' name='h_out' --></td>
		            <td>'p_out'</td>
		        </tr>
		        <tr>
		            <td>10.</td>
					<td><input type='number' name='h10' /></td>
		            <td>'p10'</td>
		        </tr>
		        <tr>
		            <td>11.</td>
					<td><input type='number' name='h11' /></td>
		            <td>'p11'</td>
		        </tr>
		        <tr>
		            <td>12.</td>
					<td><input type='number' name='h12' /></td>
		            <td>'p12'</td>
		        </tr>
		        <tr>
		            <td>13.</td>
					<td><input type='number' name='h13' /></td>
		            <td>'p13'</td>
		        </tr>
		        <tr>
		            <td>14.</td>
					<td><input type='number' name='h14' /></td>
		            <td>'p14'</td>
		        </tr>
		        <tr>
		            <td>15.</td>
					<td><input type='number' name='h15' /></td>
		            <td>'p15'</td>
		        </tr>
		        <tr>
		            <td>16.</td>
					<td><input type='number' name='h16' /></td>
		            <td>'p16'</td>
		        </tr>
		        <tr>
		            <td>17.</td>
					<td><input type='number' name='h17' /></td>
		            <td>'p17'</td>
		        </tr>
		        <tr>
		            <td>18.</td>
					<td><input type='number' name='h18' /></td>
		            <td>'p18'</td>
		        </tr>
		        <tr>
		            <td>h_in</td>
					<td><#-- input type='number' name='h_in' --></td>
		            <td>'p_in'</td>
		        </tr>
		        <tr>
		            <td>yhteensä</td>
					<td><#--  input type='number' name='yhteensa' --></td>
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