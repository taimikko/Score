<#if tiit??>
	tiit=[<#list tiit as tii>{id:"${tii.id?c}",kentta_id:"${tii.kentta_id?c}",tii_id:"${tii.tii_id?c}",nimi:"${tii.tii_nimi}",slope:"${tii.slope}",cr:"${tii.cr}",slope_n:"${tii.slope_n}",cr_n:"${tii.cr_n}"},</#list>];
<#else>
	tiit=[{id:"120",tii_id:"1",nimi:"Eka",slope:"128",cr:"74.0",slope_n:"0",cr_n:"0"},
  		  {id:"121",tii_id:"2",nimi:"Toka",slope:"125",cr:"72.0",slope_n:"130",cr_n:"75"},
 		  {id:"122",tii_id:"3",nimi:"Kolmas",slope:"123",cr:"70.0",slope_n:"128",cr_n:"73"}, 
	      {id:"123",tii_id:"4",nimi:"Nelkku",slope:"120",cr:"68.0",slope_n:"125",cr_n:"72"}];
</#if>
<#-- 
console.log("tiit:",tiit);
-->