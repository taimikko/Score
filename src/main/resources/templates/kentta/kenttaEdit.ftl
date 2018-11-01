<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">

	<title>Kenttätietojen päivitys</title>
	
	<script>
		var vaylat;
		<#if vaylat??>
			vaylat = [<#list vaylat as vayla>{numero:"${vayla.numero}",nimi:"${vayla.nimi}",par:"${vayla.par}",pit1:"${vayla.pit1}",pit2:"${vayla.pit2}",pit3:"${vayla.pit3}",pit4:"${vayla.pit4}",hcp:"${vayla.hcp}"}, </#list>];
		<#else>
			vaylat=[{numero:"1",nimi:"eka väylä",par:"5",pit1:"430",pit2:"420",pit3:"400",pit4:"380",hcp:"12"}];
		</#if>
		var tiit;
		<#if tiit??>
        	tiit=[<#list tiit as tii>{tii_id:"${tii.tii_id?c}",nimi:"${tii.tii_nimi}",sukup:"${tii.sukup}",slope:"${tii.slope}",cr:"${tii.cr}"},</#list>];
		<#else>
        	tiit=[{tii_id:"1",nimi:"Eka",sukup:"1",slope:"128",cr:"74.0"},
	      		  {tii_id:"2",nimi:"Toka",sukup:"1",slope:"125",cr:"72.0"},
		 		  {tii_id:"3",nimi:"Kolmas",sukup:"1",slope:"123",cr:"70.0"}, 
        	      {tii_id:"4",nimi:"Nelkku",sukup:"1",slope:"120",cr:"68.0"}];
   		</#if>
   		
	
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
						<th class='num' scope="col">#</th> <#-- numero -->   
						<th scope="col">nimi</th>     
						<th class='num' scope="col">par</th>  
						<#if tiit??>
							<#list tiit as tii> 
								<#if tii.sukup==1> <#-- tiit vain yhteen kertaan -->
									<th class='num' scope="col">${tii.tii_nimi}</th>
								</#if> 
							</#list>
						<#else>
							<th class='num' scope="col">pit1</th>     
							<th class='num' scope="col">pit2</th>     
							<th class='num' scope="col">pit3</th>     
							<th class='num' scope="col">pit4</th>
						</#if>     
						<th class='num' scope="col">hcp</th>     
						<th></th>
					</tr>
            	</thead>
            	<tbody>
	            <#list vaylat as vayla>
		    		<tr>
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
	    		</tbody>
            </#if>
        </table>
   	</div>
</body>

</html>