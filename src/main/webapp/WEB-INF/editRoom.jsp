<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Edit <c:out value="${editRoom.getRoomName()}"/></title>
</head>
<body>
	<div class="bg-img bg-secondary d-flex align-items-center justify-content-center" style="height: 100vh; background-size: cover;">
		<div class="container-md border bg-white p-5">
			<h6>Currently logged in: <span class="text-danger"><c:out value="${user.getUsername()}"/></span></h6>
			<h1>Edit <c:out value="${editRoom.getRoomName()}"/></h1>
			<div class="border border-secondary p-2 my-2">
				<form:form action="/editRoom/${editRoom.getId()}" method="post" modelAttribute="editRoom">
					<form:label path="roomName">Add room:</form:label>
					<form:errors path="roomName"/>
					<form:input path="roomName" type="text"/>
					<form:label path="description">Description:</form:label>
					<form:errors path="description"/>
					<form:input path="description" type="text"/>
					<form:select path="status">
						<form:option path="status" value="available">available</form:option>
						<form:option path="status" value="full">full</form:option>
					</form:select>
					<form:errors path="creator"/>
					<form:hidden path="creator" value="${editRoom.getCreator()}"/>
					<form:errors path="user"/>
					<form:hidden path="user" value="${user.getId()}"/> <!-- FOR LINKAGE -->
					<input type="submit" value="Add"/>
				</form:form>
			</div>
			
			<form action="/rooms">
				<input type="submit" value="Back to Rooms"/>
			</form>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</body>
</html>