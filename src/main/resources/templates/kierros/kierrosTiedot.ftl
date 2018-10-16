<#-- assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/ -->
<!DOCTYPE HTML>
<html>

<head>
    <title>Kierroksen tiedot</title>
</head>

<body>
    <#include "../_menu.ftl">

    <h2>Pelattu kiettos</h2>

    <#if kierros??>
    <form name='f' action="/kierros/add" method='POST'>
  	<table>
   		<tr>
    			<td>pvm:</td><td>${kierros.pvm?c}</td>
    		</tr>
	   		<tr>
    			<td>pelaajan kotiseura:</td><td>${kierros.seura_id?c}</td>
    		</tr>
	   		<tr>
    			<td>pelaajan jäsennumero:</td><td>${kierros.jasennumero?c}</td>
    		</tr>
	   		<tr>
    			<td>kenttä:</td><td>${kierros.kentta_id?c}</td>
    		</tr>
    		<tr>
    			<td>pelaajan tasoitus:</td><td>${kierros.tasoitus}</td>
    		</tr>
    		<tr>
    			<td>Tii:</td><td>${kierros.tii_id} tiin lyhenne</td>
    		</tr>
    		<tr>
    			<td>pelitasoitus:</td><td>pitäisi askea jostain jos kiinnostaaa</td>
    		</tr>
    		<tr>
    			<td>cba:</td><td>tätä ei käyttäjä tiedä, tulee kilpailuissa jostain</td>
    		</tr>
    	</table>
    	<table>
    	<th>
			<td>reikä</td><td>lyönnit</td><td>pisteet</td>
    	</th>
    	<tr>
			<td>1.</td><td>${kierros.h1}</td><td>${kierros.p1}</td>
		</tr>
		<tr>
			<td>2.</td><td>${kierros.h2}</td><td>${kierros.p2}</td>
		</tr>
		<tr>
			<td>3.</td><td>${kierros.h3}</td><td>${kierros.p3}</td>
		</tr>
		<tr>
			<td>4.</td><td>${kierros.h4}</td><td>${kierros.p4}</td>
		</tr>
		<tr>
			<td>5.</td><td>${kierros.h5}</td><td>${kierros.p5}</td>
		</tr>
		<tr>
			<td>6.</td><td>${kierros.h6}</td><td>${kierros.p6}</td>
		</tr>
		<tr>
			<td>7.</td><td>${kierros.h7}</td><td>${kierros.p7}</td>
		</tr>
		<tr>
			<td>8.</td><td>${kierros.h8}</td><td>${kierros.p8}</td>
		</tr>
		<tr>
			<td>9.</td><td>${kierros.h9}</td><td>${kierros.p9}</td>
		</tr>
		<tr>
			<td>out</td><td>${kierros.out}</td><td>${kierros.p_out}</td>
		</tr>
		<tr>
			<td>10.</td><td>${kierros.h10}</td><td>${kierros.p10}</td>
		</tr>
		<tr>
			<td>11.</td><td>${kierros.h11}</td><td>${kierros.p11}</td>
		</tr>
		<tr>
			<td>12.</td><td>${kierros.h12}</td><td>${kierros.p12}</td>
		</tr>
		<tr>
			<td>13.</td><td>${kierros.h13}</td><td>${kierros.p13}</td>
		</tr>
		<tr>
			<td>14.</td><td>${kierros.h14}</td><td>${kierros.p14}</td>
		</tr>
		<tr>
			<td>15.</td><td>${kierros.h15}</td><td>${kierros.p15}</td>
		</tr>
		<tr>
			<td>16.</td><td>${kierros.h16}</td><td>${kierros.p16}</td>
		</tr>
		<tr>
			<td>17.</td><td>${kierros.h17}</td><td>${kierros.p17}</td>
		</tr>
		<tr>
			<td>18.</td><td>${kierros.h18}</td><td>${kierros.p18}</td>
		</tr>
		<tr>
			<td>in</td><td>${kierros.in}</td><td>${kierros.p_in}</td>
		</tr>
		<tr>
			<td>yhteensä</td><td>${kierros.yhteensa}</td><td>${kierros.p_yht}</td>
		</tr>
		</table>
		<table>
		<tr>
			<td>merkitsijä:</td><td>${kierros.merkitsija}</td>
		</tr>
		<tr>
			<td>lisätieto:</td><td>${kierros.lisatieto}</td>
		</tr>
		<tr>
			<td>onko tasoituskierros:</td><td>${kierros.tasoituskierros}</td>
		</tr>
		<tr>
			<td>uusi tasoitus:</td><td>${kierros.uusi_tasoitus}</td>
		</tr>
		<tr>
			<td>etuysi/takaysi/koko kierros:</td><td>${kierros.pelattu}</td>
		</tr>
   		<tr>
              <td><input name="submit" type="submit" value="submit" /></td>
        </tr>
		</table>
 	    </#if>
   	</table>

    <br/>

</body>

</html>