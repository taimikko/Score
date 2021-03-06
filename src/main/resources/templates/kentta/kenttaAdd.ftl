<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">

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
   	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	</body>
</html>