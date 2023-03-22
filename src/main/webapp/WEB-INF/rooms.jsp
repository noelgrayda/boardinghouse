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
<title>Rooms</title>
</head>
<body>
	<div class="bg-img d-flex align-items-center justify-content-center" style="background-image: url('img/children-g38dda8e37_1920.jpg');
		height: 100vh; background-size: cover;">
		<div class="container-md p-5 bg-white">
			<h6>Currently logged in: <span class="text-danger"><c:out value="${user.getUsername()}"/></span></h6>
			<h1>List of Rooms</h1>
			<div class="border border-secondary p-2 d-flex align-items-center justify-content-center">
				<form:form action="/addroom" method="post" modelAttribute="addroom">
					<form:label path="roomName">Add room:</form:label>
					<form:errors path="roomName" class="form-control is-invalid"/>
					<form:input path="roomName" type="text"/>
					<form:label path="description">Location:</form:label>
					<form:errors path="description" class="form-control is-invalid"/>
					<form:input path="description" type="text"/>
					<form:label path="creator">Created by:</form:label>
					<form:errors path="creator" class="form-control is-invalid"/>
					<form:input path="creator" type="text"/>
					<form:errors path="status"/>
					<form:hidden path="status" value="available"/>
					<form:errors path="renter"/>
					<form:hidden path="renter" value="none"/>
					<form:errors path="user"/>
					<form:hidden path="user" value="${user.getId()}"/> <!-- FOR LINKAGE -->
					<input type="submit" class="btn btn-secondary" value="Add"/>
				</form:form>
			</div>
			<div style="height:300px; overflow:scroll;">
				<table class="table table-secondary table-striped">
					<thead>
						<tr>
							<th>Room Name</th>
							<th>Location</th>
							<th>Created by</th>
							<th>Updated by</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="roomsInfo" items="${allrooms}">
							<tr>
								<td><span class="fw-bold"><c:out value="${roomsInfo.getRoomName()}"/></span></td>
								<td><c:out value="${roomsInfo.getDescription()}"/></td>
								<td><c:out value="${roomsInfo.getCreator()}"/></td>
								<td><c:out value="${roomsInfo.getUser().getUsername()}"/></td>
								<c:if test="${roomsInfo.getStatus()=='full'}">
									<td class="text-danger fw-bold">
										<c:out value="${roomsInfo.getStatus()}"/>
									</td>
								</c:if>
								<c:if test="${roomsInfo.getStatus()=='available'}">
									<td class="text-success fw-bold">
										<c:out value="${roomsInfo.getStatus()}"/>
									</td>
								</c:if>
								<td>
									<a href="/editRoom/${roomsInfo.getId()}">edit</a>
									<a href="/deleteRoom/${roomsInfo.getId()}">delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<form action="/dashboard">
				<input type="submit" class="btn btn-secondary mt-2" value="Home"/>
			</form>
		</div>
	 </div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</body>
</html>