<#-- assign security=JspTaglibs[ "http://www.springframework.org/security/tags" ]/ -->
<!DOCTYPE HTML>
<html>

<head>
	<title>Edit Kierros</title>
</head>

<body>
	<#include "../_menu.ftl">

	<h2>Edit kierros</h2>

	<#if kierros??>
    <form name='f' action="/kierros/edit" method='POST'>
		  	<table>
				<tr>
					<td>pvm:</td>
					<td><input id='pvm1' type="date" name='pvm' onchange="pvmUpdate()" <#if (kierros.pvm)??> value='${kierros.pvm?string('yyyy-MM-dd')}'<#else>value='01/01/1999' </#if> ></td>
					<td><p id='pvm_str' name='pvm_str'></p> 
					</td>
				</tr>
				<tr>
					<td>pelaajan kotiseura:</td>
					<td><input type='number' min='0' class='num' name='seura_id' <#if (kierros.seura_id)??> value='${kierros.seura_id?c}' <#else> <#if (pelaaja.seuraId)??> value='${pelaaja.seuraId?c}' </#if> </#if>  ></td>
					<td><#if seurat??>
						<#list seurat as seura>
		                    <#if pelaaja.seuraId==seura.id> ${seura.nimi}</#if>
		                </#list>
		                </#if>
		            </td>
				</tr>
				<tr>
					<td>pelaajan jäsennumero:</td>
					<td><input type='number' class='num' name='jasennumero' <#if (kierros.jasennumero)??> value='${kierros.jasennumero?c}' <#else> <#if (pelaaja.jasennumero)??> value='${pelaaja.jasennumero?c}' </#if> </#if> ></td>
					<td><p id='pelaajan_nimi' name='pelaajan_nimi'></p>
				</tr>
				<tr>
					<td>Valitse kenttä:</td>
					<td><input style="color:blue;" list="kenttaluettelo" title="Valitse kenttä" class='num' id='kentta' name='kentta_id' onselect="kenttaValinta()" <#if (kierros.kentta_id)??> value='${kierros.kentta_id?c}' </#if> >

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
		            <td><input type='text'  class='num' name='tasoitus' <#if (kierros.tasoitus)??> value='${kierros.tasoitus}' <#else> <#if (pelaaja.tasoitus)??> value='${pelaaja.tasoitus}' </#if></#if> > </td>
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
	            <td><input type='number' name='h1' <#if (kierros.h1)??> value='${kierros.h1}' </#if> /></td>
	            <td><input type='number' name='p1' <#if (kierros.p1)??> value='${kierros.p1}' </#if> /></td>
<#-- 
		            		            <td><input type='text' maxlength='2' class='num' name='h1' id='h1' onkeyup="seuraava(event, 'h2')" <#if (kierros.h1)??> value='${kierros.h1} </#if> /></td>
		            <td>'p1' <#if (kierros.p1)??> '${kierros.p1} </#if> </td>
 -->		            
	        </tr>
	        <tr>
	            <td>2.</td>
	            <td><input type='text' name='h2' value='${kierros.h1}'></td>
	            <td><input type='text' name='p2' value='${kierros.p1}'></td>
	        </tr>
	        <tr>
	            <td>3.</td>
	            <td><input type='number' name='h3' /></td>
	            <td><input type='number' name='p3' /></td>
	        </tr>
	        <tr>
	            <td>4.</td>
	            <td><input type='number' name='h4' /></td>
	            <td><input type='number' name='p4' /></td>
	        </tr>
	        <tr>
	            <td>5.</td>
				<td><input type='number' name='h5' /></td>
	            <td><input type='number' name='p5' /></td>
	        </tr>
	        <tr>
	            <td>6.</td>
				<td><input type='number' name='h6' /></td>
	            <td><input type='number' name='p6' /></td>
	        </tr>
	        <tr>
	            <td>7.</td>
				<td><input type='number' name='h7' /></td>
	            <td><input type='number' name='p7' /></td>
	        </tr>
	        <tr>
	            <td>8.</td>
				<td><input type='number' name='h8' /></td>
	            <td><input type='number' name='p8' /></td>
	        </tr>
	        <tr>
	            <td>9.</td>
				<td><input type='number' name='h9' /></td>
	            <td><input type='number' name='p9' /></td>
	        </tr>
	        <tr>
	            <td>h_out</td>
				<td><input type='number' name='h_out' /></td>
	            <td><input type='number' name='p_out' /></td>
	        </tr>
	        <tr>
	            <td>10.</td>
				<td><input type='number' name='h10' /></td>
	            <td><input type='number' name='p10' /></td>
	        </tr>
	        <tr>
	            <td>11.</td>
				<td><input type='number' name='h11' /></td>
	            <td><input type='number' name='p11' /></td>
	        </tr>
	        <tr>
	            <td>12.</td>
				<td><input type='number' name='h12' /></td>
	            <td><input type='number' name='p12' /></td>
	        </tr>
	        <tr>
	            <td>13.</td>
				<td><input type='number' name='h13' /></td>
	            <td><input type='number' name='p13' /></td>
	        </tr>
	        <tr>
	            <td>14.</td>
				<td><input type='number' name='h14' /></td>
	            <td><input type='number' name='p14' /></td>
	        </tr>
	        <tr>
	            <td>15.</td>
				<td><input type='number' name='h15' /></td>
	            <td><input type='number' name='p15' /></td>
	        </tr>
	        <tr>
	            <td>16.</td>
				<td><input type='number' name='h16' /></td>
	            <td><input type='number' name='p16' /></td>
	        </tr>
	        <tr>
	            <td>17.</td>
				<td><input type='number' name='h17' /></td>
	            <td><input type='number' name='p17' /></td>
	        </tr>
	        <tr>
	            <td>18.</td>
				<td><input type='number' name='h18' /></td>
	            <td><input type='number' name='p18' /></td>
	        </tr>
	        <tr>
	            <td>h_in</td>
				<td><input type='number' name='h_in' /></td>
	            <td><input type='number' name='p_in' /></td>
	        </tr>
	        <tr>
	            <td>yhteensä</td>
				<td><input type='number' name='yhteensa' /></td>
	            <td><input type='number' name='p_yht' /></td>
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
	            <td><input type='text' name='tasoituskierros' /></td>
	            <#--  ${kierros.tasoituskierros} -->
	        </tr>
	        <tr>
	            <td>uusi tasoitus:</td>
	            <td><input type='text' name='uusi_tasoitus' /></td>
	            <#--  ${kierros.uusi_tasoitus} -->
	        </tr>
	        <tr>
	            <td>etuysi/takaysi/koko kierros:</td>
	            <td><input type='text' name='pelattu' /></td>
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