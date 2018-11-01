<#assign security=JspTaglibs[ "http://www.springframework.org/security/tags"]/>
<!DOCTYPE HTML>
<html>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">

	<title>Väylätietojen päivitys</title>
	
	<script>
		var vayla;
		<#if vayla??>
			vayla = {numero:"${vayla.numero}",nimi:"${vayla.nimi}",par:"${vayla.par}",pit1:"${vayla.pit1}",pit2:"${vayla.pit2}",pit3:"${vayla.pit3}",pit4:"${vayla.pit4}",hcp:"${vayla.hcp}"};
		<#else>
			vayla = {numero:"1",nimi:"eka väylä",par:"5",pit1:"430",pit2:"420",pit3:"400",pit4:"380",hcp:"12"};
		</#if>
		var tiit;
		<#if tiit??>
        	tiit=[<#list tiit as tii>{id:"${tii.id?c}",tii_id:"${tii.tii_id?c}",nimi:"${tii.tii_nimi}",sukup:"${tii.sukup}",slope:"${tii.slope}",cr:"${tii.cr}"},</#list>];
		<#else>
        	tiit=[{id:"1",tii_id:"1",nimi:"Eka",sukup:"1",slope:"128",cr:"74.0"},
	      		  {id:"2",tii_id:"2",nimi:"Toka",sukup:"1",slope:"125",cr:"72.0"},
		 		  {id:"3",tii_id:"3",nimi:"Kolmas",sukup:"1",slope:"123",cr:"70.0"}, 
        	      {id:"4",tii_id:"4",nimi:"Nelkku",sukup:"1",slope:"120",cr:"68.0"}];
   		</#if>
   		
   		function alustaPituudet() {
   			var id;
	    	for (const tii of tiit) {
	    		id = "pit"+tii.tii_id;
	    	    if (tii.sukup == 1) {
		    	    document.getElementById(id).value = vayla[id];
    	    	    console.log(id, vayla[id]);
		    	}
	    	}
   		}
   		
		window.onload = function (e) {
    		console.log("vaylaEdit.ftl window.onload");
    		alustaPituudet();
		}

	</script>
</head>

<body>
	<#include "../_menu.ftl">

    <h2>Väylän tiedot</h2>
    <div>
        <form name='f' action="/kentta/vayla" method='POST'>
        <table>
            <#if kentta??>
	    		<tr>
	    			<td>kenttä:</td>
	    			<td><input name='kentta_id' readonly value=${kentta.id?c} /></td>
	    			<td><input id='kentan_nimi' readonly value='${kentta.kentan_nimi}' /> </td>
	    		</tr>
	    		<tr>
		    		<td>seura:</td>
					<td><input id='seura_id'   readonly value='${kentta.seura_id}' /></td>
	    			<td><input id='seura_nimi' readonly <#if seura??>value='${seura.nimi} (${seura.lyhenne})'</#if> /></td>
	    		</tr>
            </#if>
		    <br/>
            <#if vayla??>
				<tr>
					<td class='hed' >väylä:</td>
	    			<td><input name='numero' id='numero' type='number' min='1' max='18' required value='${vayla.numero}' class='num2' > </td>
					<td><input name='nimi' id='nimi' value='${vayla.nimi}' title='Väylän nimi'> </td>
	    			<td><input name='id' id='id' readonly value='${vayla.id}' /> </td>
				</tr><tr>   
					<td class='hed' >par</td>  
	    			<td><input name='par' id='par' type='number' min='3' max='5' required value='${vayla.par}' class='num2' > </td>
				</tr>   
					<#if tiit??>
						<#list tiit as tii> 
							<#if tii.sukup==1> <#-- tiit vain yhteen kertaan -->
								<tr>   
									<td class='hed' >${tii.tii_nimi}</td>
		    						<td><input name='pit${tii.tii_id}' id='pit${tii.tii_id}' type='number' min='1' max='999' required value='${vayla.pit1}' class='num2' ></td>
		    						<#--  td>pit_${tii.tii_id} ${tii.id}</td> -->
								</tr>   
							</#if> 
						</#list>
					<#else>
						<tr>   
							<td class='hed' >Virhe: Kentälle ei ole määritelty tiitä. </td>     
						</tr>
					</#if>     
				<tr>   
					<td class='hed' >hcp</td>     
	    			<td><input name='hcp' id='hcp' type='number' min='1' max='18' required value='${vayla.hcp}' class='num2' ></td>
				</tr>
	            <tr>
	               <td><input name="submit" type="submit" value="submit" /></td>
	            </tr>
            </#if>
        </table>
        </form>
   	</div>
</body>

</html>