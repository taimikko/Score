<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>

<head>
<title>Kenttätietojen päivitys</title>
</head>

<body>
	<#include "../_menu.ftl">

    <h2>kenttätiedot</h2>
    <div>
        <form name='f' action="/kentta/edit" method='POST'>
        <table>
            <#if kentta??>
	    		<tr>
	    			<td>id:</td>
	    			<td><input type='number' name='id' readonly value=${kentta.id?c} /></td>
	    		</tr>
	    		<tr>
		    		<td>seura:</td>
					<td><input list="seuraluettelo" name='seura_id' required value='${kentta.seura_id}'>
						<#list seurat as seura>
							<#if seura.id==kentta.seura_id>${seura.nimi} (${seura.lyhenne})</#if>
		                </#list>
						<datalist id="seuraluettelo">
		                    <#list seurat as seura>
		                        <option value="${seura.id}">${seura.id} ${seura.nimi} (${seura.lyhenne})</option>
		                    </#list>
		                </datalist>
		            </td>
	    		</tr>
	    		<tr>
	    			<td>nimi:</td>
	    			<td><input type='text' name='kentan_nimi' required value='${kentta.kentan_nimi}' /> </td>
	    		</tr>
	    		<tr>
	    			<td>lyhenne:</td>
	    			<td><input type='text' name='kentan_lyhenne' required value='${kentta.kentan_lyhenne}' /></td>
	    		</tr>
            </#if>
            <tr>
               <td><input name="submit" type="submit" value="submit" /></td>
            </tr>
        </table>
        </form>
    </div>
</body>

</html>