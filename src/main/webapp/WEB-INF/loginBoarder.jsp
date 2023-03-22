<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Boarder Login / Register</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body class="bg-img bg-dark" style="background-image: url('img/people.jpg');
	height: 100%vh;
	background-size: cover;
	background-repeat: no-repeat;
  ">
	<div class="container-md">
		<h1 class="mt-2 text-center" style="color: orange;">Boarder Login/Registration Page</h1>	
		<div class="row">
			<div class="col bg-light border m-2">
				<h3 class="m-2" style="color: #cc5500;">Register</h3>
				
				<div class="form-group m-2">
					<form:form action="/registerBoarder" method="post" modelAttribute="newUser">
						<form:label path="username">Username:</form:label>
						<form:errors path="username" class="form-control is-invalid"/>
						<form:input path="username" type="text" class="form-control mb-2" placeholder="Enter username"/>	
						<form:label path="email">Email Address:</form:label>
						<form:errors path="email" class="form-control is-invalid"/>
						<form:input path="email" type="email" class="form-control mb-2" placeholder="Enter email address"/>		
						<form:label path="password">Password:</form:label>
						<form:errors path="password" class="form-control is-invalid"/>
						<form:input path="password" type="password" class="form-control mb-2" placeholder="Enter password"/>	
						<form:label path="confirm">Confirm Password:</form:label>
						<form:errors path="confirm" class="form-control is-invalid"/>
						<form:input path="confirm" type="password" class="form-control mb-2" placeholder="Enter password confirmation"/>
						<input type="submit" value="Register" class="btn text-white" style="background-color: #cc5500;"/>					
					</form:form>
					
				</div>
				
			</div>
			<div class="col bg-light border m-2">
				<h3 class="m-2" style="color: #cc5500;">Login</h3>
				
				<div class="form-group m-5">
					<form:form action="/loginBoarder" method="post" modelAttribute="newLogin">	
						<form:label path="email">Email Address:</form:label>
						<form:errors path="email" class="form-control is-invalid"/>
						<form:input path="email" type="email" class="form-control mb-2" placeholder="Enter email address"/>		
						<form:label path="password">Password:</form:label>
						<form:errors path="password" class="form-control is-invalid"/>
						<form:input path="password" type="password" class="form-control mb-2" placeholder="Enter password"/>	
						<input type="submit" value="Login" class="btn text-white" style="background-color: #cc5500;"/>	
								
					</form:form>
				
				</div>
			</div>
		</div>
			<form action="/" class="d-grid gap-2 m-2">
				<input type="submit" value="Home" class="btn text-white" style="background-color: #cc5500;"/>
			</form>
	</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>

</body>
</html>