<!DOCTYPE HTML>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/score.css">
	<title>Access Denied</title>
</head>
 
<body>
    <#include "_menu.ftl">
 
    <h3>
    <#if message??>
    <#--  style="color: red;"-->
    ${message}
    </#if>
    </h3>
 
    <div>
    <#if userInfo??>
    ${userInfo}
    </#if>
    </div>
     
</body>
 
</html>