<!DOCTYPE HTML>
<html>
<head>
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