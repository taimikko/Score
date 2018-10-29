<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	    <link rel="stylesheet" type="text/css" href="/css/score.css">

		<title>seuran lisäys</title>
	</head>
	<body>
	<#include "../_menu.ftl">

    <h2>uuden seuran lisäys</h2>
    <div>
        <form name='f' action="/seura/add" method='POST'>
        <table>
    		<tr>
    			<td>id: (autoincrement täyttää, kun kenttä lisätään)</td>
    			<td><input type='hidden' name='id' readonly value="" /></td>
    		</tr>
    		<tr>
    			<td>nimi:</td><td><input type='text' name='nimi' required  /> </td>
    		</tr>
            <tr>
    			<td>lyhenne:</td><td><input type='text' name='lyhenne' required  /></td>
    		</tr>
    		<tr>
               <td><input name="submit" type="submit" value="lisää uusi kenttä" /></td>
            </tr>
        </table>
        </form>
    </div>
	</body>
</html>