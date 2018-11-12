<#if kentat??>
<#-- 
	if (kentat === undefined) {
	  console.log("kentät puuttuu");
	  var kentat=[{id:"1", nimi:"koe", seura_id:"0"}]
	} else {
	  console.log("kentät on olemassa");
	}
 -->
	kentat=[<#list kentat as kentta>{id:"${kentta.id?c}", nimi:"${kentta.kentan_nimi}", seura_id:"${kentta.seura_id?c}"}, </#list>];
<#else>
	kentat=[{id:"500",nimi:"Eduix testikenttä",seura_id:"500"}, {id:"501",nimi:"Eduix toinen kenttä",seura_id:"500"}];
</#if>
<#-- 
console.log("kentät:",kentat);
-->