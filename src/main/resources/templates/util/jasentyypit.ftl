		<#if jasentyypit??>
			jasentyypit = [<#list jasentyypit as jt>{id:"${jt.id}",tyyppi:"${jt.tyyppi}",kuvaus:"${jt.kuvaus}"}, </#list>];
		<#else>
			jasentyypit = [{id:"2", tyyppi:"jäsen", kuvaus:"Jäsenet"}];
		</#if>
