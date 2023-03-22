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
<title>Select Room</title>
</head>
<body>
	<div class="bg-img bg-secondary d-flex align-items-center justify-content-center" style="height: 100vh; background-size: cover;">
		<div class="container-md border bg-white p-5">
			<h6>Currently logged in: <span class="text-success"><c:out value="${user.getUsername()}"/></span></h6>
			<h3>Select Room</h3>
			<form:form action="/dashboardBoarder/${boarder.getId()}" method="post" modelAttribute="boarderEdit">
				<form:label path="fName">First Name:</form:label>
				<form:errors path="fName"/>
				<form:input path="fName" type="text" placeholder="${boarder.getfName()}"/>
				<form:label path="lName">Last Name:</form:label>
				<form:errors path="lName"/>
				<form:input path="lName" type="text" placeholder="${boarder.getlName()}"/>
				<form:label path="age">Age:</form:label>
				<form:errors path="age"/>
				<form:input path="age" type="number" placeholder="${boarder.getAge()}"/>
				<form:select path="rooms" name="roomie">
					<c:forEach var="allRoom" items="${listRoom}">
						<c:if test="${allRoom.getStatus()=='available' }">
							<form:option value="${allRoom.getRoomName()}"><c:out value="${allRoom.getRoomName()}"/></form:option>
						</c:if>
					</c:forEach>
				</form:select>
				<form:errors path="balance"/>
				<form:hidden path="balance" value="${boarder.getBalance()}"/>
				<input type="submit" value="Submit"/>
			</form:form>
			
			<form action="/dashboardBoarder">
				<input type="submit" value="back"/>
			</form>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</body>
</html>