<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>
	<head>
		<title>kentän lisäys</title>
	</head>
	<body>
	<#include "../_menu.ftl">

    <h2>uuden kentän lisäys</h2>
    <div>
        <form name='f' action="/kentta/add" method='POST'>
        <table>
    		<tr>
    			<td>id: (autoincrement täyttää, kun kenttä lisätään)</td>
    			<td><input type='hidden' name='id' readonly value="" /></td>
    		</tr>
    		<tr>
	    		<td>seura:</td>
				<td><input list="seuraluettelo" name='seura_id' required value='78'>
					<datalist id="seuraluettelo">
	                    <#list seurat as seura>
	                        <option value="${seura.id}">${seura.id} ${seura.nimi} (${seura.lyhenne})</option>
	                    </#list>
	                </datalist>
	            </td>
    		</tr>
    		<tr>
    			<td>nimi:</td><td><input type='text' name='kentan_nimi' required  /> </td>
    		</tr>
            <tr>
    			<td>lyhenne:</td><td><input type='text' name='kentan_lyhenne' required  /></td>
    		</tr>
    		<tr>
               <td><input name="submit" type="submit" value="submit" /></td>
            </tr>
        </table>
        </form>
    </div>
	</body>
</html>