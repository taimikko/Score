<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">
	<script type="application/javascript" src="/js/utils.js"></script>

	<title>Kenttätietojen päivitys</title>
	
	<script>
		var vaylat;
		<#include "/util/vaylat.ftl"> 		
		var tiit;
		<#include "/util/tiit.ftl"> 		
	
	    function laskeYhteensa() {
	    	var par = 0;
	    	var pit1 = 0;
	    	var pit2 = 0;
	    	var pit3 = 0;
	    	var pit4 = 0;
	    	for (const vayla of vaylat) {
	    		par += Number.parseInt(vayla.par);
	    		pit1 += Number.parseInt(vayla.pit1);
	    		pit2 += Number.parseInt(vayla.pit2);
	    		pit3 += Number.parseInt(vayla.pit3);
	    		pit4 += Number.parseInt(vayla.pit4);
	    	}
	        document.getElementById("par").innerHTML = par;
	        document.getElementById("pit1").innerHTML = pit1;
	        document.getElementById("pit2").innerHTML = pit2;
	        document.getElementById("pit3").innerHTML = pit3;
	        document.getElementById("pit4").innerHTML = pit4;
	    }

		window.onload = function (e) {
    		console.log("kenttaEdit.ftl window.onload");
    		laskeYhteensa();
			makeAllSortable();		    	
		}

	</script>
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
	<div>
		<#--  h3>väylät</h3> -->
        <table>
            <#if vaylat??>
            	<thead>
  					<tr>
						<th scope="col" class="numsrt">#</th>    
						<th scope="col" class="srt">nimi</th>     
						<th scope="col" class="numsrt">par</th>  
						<#if tiit??>
							<#list tiit as tii> 
								<th scope="col" class="numsrt">${tii.tii_nimi}</th>
							</#list>
						<#else>
							<th scope="col" class="numsrt" >pit1</th>     
							<th scope="col" class="numsrt" >pit2</th>     
							<th scope="col" class="numsrt" >pit3</th>     
							<th scope="col" class="numsrt" >pit4</th>
						</#if>     
						<th scope="col" class="numsrt" >hcp</th>     
						<th></th>
					</tr>
            	</thead>
            	<tbody>
	            <#list vaylat as vayla>
		    		<tr onmouseover="mouseOver(this)" onmouseout="mouseOut(this)" onclick="window.location='/kentta/vayla?kentta_id=${kentta.id?c}&vayla_id=${vayla.id}'">
		    			<td class='num' >${vayla.numero}</td>
		    			<td>${vayla.nimi}</td>
		    			<td class='num' >${vayla.par}</td>
		    			<td class='num' >${vayla.pit1}</td>
		    			<td class='num' >${vayla.pit2}</td>
		    			<td class='num' >${vayla.pit3}</td>
		    			<td class='num' >${vayla.pit4}</td>
		    			<td class='num' >${vayla.hcp}</td>
		    		</tr>
		    	</#list>
		    	</tbody>
		    	<tfoot>
		    		<tr>
		    			<td></td>
		    			<td>yhteensä</td>
		    			<td class='num'><span id="par" >0</span></td>
		    			<td class='num'><span id="pit1">1</span></td>
		    			<td class='num'><span id="pit2">2</span></td>
		    			<td class='num'><span id="pit3">3</span></td>
		    			<td class='num'><span id="pit4">4</span></td>
		    			<td></td>
		    		</tr>
	    		</tfoot>
            </#if>
        </table>
   	</div>
</body>

</html>