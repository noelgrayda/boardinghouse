<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Room Info</title>
</head>
<body>
	<h3>Currently logged in: <c:out value="${user.getUsername()}"/></h3>
	<h1><c:out value="${roomInfo.getRoomName()}"/></h1>
	<h3>Description: <c:out value="${roomInfo.getDescription()}"/></h3>
	<h3>Created by: <c:out value="${roomInfo.getCreator()}"/></h3>
	<h3>Status: <c:out value="${roomInfo.getStatus()}"/></h3>
	
	<h1>Add boarder</h1>
	<form:form action="/roomInfo/${roomInfo.getId()}" method="post" modelAttribute="board">
		<form:select path="renter">
			<c:forEach var="allBoarder" items="${boarder}">
				<form:option value="${allBoarder.getUsername()}"><c:out value="${allBoarder.getUsername()}"/></form:option>
			</c:forEach>
		</form:select>
		<form:errors path="creator"/>
		<form:hidden path="creator" value="${roomInfo.getCreator()}"/>
		<form:errors path="description"/>
		<form:hidden path="description" value="${roomInfo.getDescription()}"/>
		<form:errors path="roomName"/>
		<form:hidden path="roomName" value="${roomInfo.getRoomName()}"/>
		<form:errors path="status"/>
		<form:hidden path="status" value="${roomInfo.getStatus()}"/>
		<form:errors path="user"/>
		<form:hidden path="user" value="${user.getId()}"/> <!-- FOR LINKAGE -->
		<input type="submit" value="Add boarder"/>
	</form:form>
	
	<h1>Boarders of this room:</h1>
	<table>
		<thead>
			<tr>
				<th>Boarders</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><c:out value="${roomInfo.getRenter()}"/></td>
			</tr>
		</tbody>
	</table>
	
	<form action="/rooms">
		<input type="submit" value="Back to Rooms"/>
	</form>

</body>
</html>