<!DOCTYPE HTML>
<!-- <#import "/spring.ftl" as spring/>  -->
<html>
	<head>
		<title>User list</title>
		<script>
			function deleteUser(user_name) {
				console.log("DEBUG:", user_name);
				window.location = "/deleteuser/" + user_name;
			}
		</script>
<!--		
    <script src="jquery.js"></script> 
    <script> 
    $(function(){
      $("#menu").load("_menu.html"); 
    });
    </script> 



		<input type="hidden"
				name="${_csrf.parameterName}"
				value="${_csrf.token}"/>
-->
		</head>
	<body>
		<h1> userlist1.FTL</h1>
	
<!--
	  <link rel="html-import" href="_menu.html" > 0 </link>
		1 <br>	
	  <div data-include="_menu.html"></div>
        2 <br>
      <div id="menu"></div>
        3 <br>
<#import "/_menu.html" as menjuu/>
-->
		<table>
			<thead>
				<tr>
				<th><a href="/users/username">Username</a></th>
				<th><a href="/users/firstname">Firstname</a></th>
				<th><a href="/users/lastname">Lastname</a></th>
				<th><a href="/users/displayorder">Displayorder</a></th>
				</tr>
			</thead>
<!--			
			<tbody>
				<#list users as user>
					<tr>
						<td><a href="/user/${user.username}">${user.username}</a></td>
						<td>${user.firstname}</td>
						<td>${user.lastname}</td>
						<td><a href="/userup/${user.username}">up</a> 
							<a href="/userdown/${user.username}">down</a>
						</td>
						<td>
						   <a href="/deleteuser/${user.username}">Del</a>
						   <button id="del" onclick="deleteUser('${user.username}')">Delete</button>
						   <a href="/edit/${user.username}">Edit</a>
						</td>
					</tr>
				</#list>
			</tbody>
-->
		</table>
		<div>
			<p>
			<a href="/add">Lisää käyttäjä</a>
		</div>
	</body>
</html>