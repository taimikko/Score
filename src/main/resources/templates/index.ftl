<#import "/spring.ftl" as spring/>
<html>
    <head>
        <meta charset="ISO-8859-1" />
        	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		    <link rel="stylesheet" type="text/css" href="/css/score.css">

        <title>User Registration</title>
    </head>
    <body>
        <form action="register" method="post">
            <@spring.bind path="user" />
            Email: <@spring.formInput "user.email"/>
            Password: <@spring.formPasswordInput "user.password"/>
            <input type="submit" value="Submit" />
        </form>
    </body>
</html>