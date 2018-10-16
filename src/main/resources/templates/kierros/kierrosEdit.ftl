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
	<table>
		<tr>
			<td>pvm:</td>
			<td><input type='text' name='pvm' <#if (kierros.pvm)??> value='${kierros.pvm?string('yyyy-MM-dd HH:mm:ss')}' </#if> /></td>
		</tr>
		<tr>
			<td>pelaajan kotiseura:</td>
			<td><input type='text' name='seura_id' <#if (pelaaja.seura_id)??> value='${pelaaja.seura_id?c}' </#if> /></td>
		</tr>
		<tr>
			<td>pelaajan jäsennumero:</td>
			<td><input type='text' name='jasennumero' <#if (pelaaja.jasennumero)??> value='${pelaaja.jasennumero?c} </#if> /></td>
		</tr>
		<tr>
			<td>Valitse kenttä:</td>
            <#-- ${kierros.kentta_id?c} -->
			<td><input list="kenttaluettelo" name='kentta_id' value='78'>
				<datalist id="kenttaluettelo">
                    <#list kentat as kentta>
                        <option value="${kentta.id}">${kentta.seura_id} ${kentta.kentan_nimi}</option>
                    </#list>
                </datalist>
            </td>

            <#--  kentän valinta pitäisi hakea kenttää vastaavat tiit seuraavaan listaan ja poistaa mahdollinen aiempi valinta tii:ltä  -->
        </tr>
        <tr>
            <td>pelaajan tasoitus:</td>
            <td><input type='text' name='tasoitus' <#if (pelaaja.tasoitus)??> value='${pelaaja.tasoitus} </#if> /> </td>
        </tr>
        <tr>
            <td>Tii, jolta pelattu:</td>
            <#-- ${kierros.tii_id}
            <td>
                <input list="tiiluettelo" name='tii_id'>
                <datalist id="tiiluettelo">
                    <#list tiit as tii>
                        <#if tii.kentta_id==kentta.kentta_id>
                            <#if pelaaja.sukup==tii.sukup>
                                <option value="${tii.id}">${tii.tii_id} ${tii.tii_lyhenne}</option>
                            </#if>
                        </#if>
                
                    </#list>
                </datalist>
            </td>
             -->
            # tehtävä valintalista, josta haetaan
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
            <td><input type='number' name='p1' <#if (kierros.p1)??> value='${kierros.p1} </#if> /></td>
        </tr>
        <tr>
            <td>2.</td>
            <td><input type='number' name='h2' /></td>
            <td><input type='number' name='p2' /></td>
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
            <td>out</td>
			<td><input type='number' name='out' /></td>
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
            <td>in</td>
			<td><input type='number' name='in' /></td>
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
</#if>

<br/>

</body>

</html>