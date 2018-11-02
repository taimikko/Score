		<#if seurat??>
			seurat=[<#list seurat as seura>{id:"${seura.id?c}",lyhenne:"${seura.lyhenne}",nimi:"${seura.nimi}"}, </#list>];
		<#else>
			seurat=[{id:"500",lyhenne:"Edu",nimi:"Eduixin testiseura"}];
		</#if>
