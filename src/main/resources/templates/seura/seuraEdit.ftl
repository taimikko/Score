<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">

	<title>Seuran tietojen päivitys</title>
</head>

<body>
	<#include "../_menu.ftl">

    <h2>seuratiedot</h2>
    <div>
        <form name='f' action="/seura/edit" method='POST'>
        <table>
            <#if seura??>
	    		<tr>
	    			<td>id:</td>
	    			<td><input type='number' name='id' readonly value=${seura.id?c} /></td>
	    		</tr>
	    		<tr>
	    			<td>nimi:</td>
	    			<td><input type='text' name='nimi' required value='${seura.nimi}' /> </td>
	    		</tr>
	    		<tr>
	    			<td>lyhenne:</td>
	    			<td><input type='text' name='lyhenne' required value='${seura.lyhenne}' /></td>
	    		</tr>
            </#if>
            <#if kentat??>
	       		<table  class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">kenttä</th>
							<th scope="col">lyhenne</th>
						</tr>
					</thead>
				<tbody>
					<#list kentat as kentta>
						<#if kentta.seura_id==seura.id>
						<tr>
							<td scope="row">${kentta.id}</td>
							<td ><a href="/kentta/edit/${kentta.id?c}">${kentta.kentan_nimi}</a></td>
							<td>${kentta.kentan_lyhenne}</td>
						</tr>
						</#if>
					</#list>
				</tbody>
			</table>
			</#if>

            <tr>
               <td><input name="submit" type="submit" value="päivitä" /></td>
            </tr>
        </table>
        </form>
    </div>
</body>

</html>