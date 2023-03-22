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
<title>List of Boarders</title>
</head>
<body>
	<div class="bg-img d-flex align-items-center justify-content-center" style="background-image: url('img/children-g38dda8e37_1920.jpg');
		height: 100vh; background-size: cover;">
		<div class="container-md p-5 bg-white">
			<h6>Currently logged in: <span class="text-danger"><c:out value="${user.getUsername()}"/></span></h6>
			<h1>List of Boarders & House Rules</h1>
			<div class="row">
				<div class="col-8 form-group" style="height:300px; overflow:scroll;">
					<table class="table table-secondary table-striped">
						<thead>
							<tr>
								<th>Boarder Last Name</th>
								<th>Boarder First Name</th>
								<th>Age</th>
								<th>Room</th>
								<th>Terminate</th>
								<th>Balance</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="allBoarder" items="${boarders}">
								<tr>
									<td><c:out value="${allBoarder.getlName() }"/></td>
									<td><c:out value="${allBoarder.getfName() }"/></td>
									<td><c:out value="${allBoarder.getAge() }"/></td>
									<td><c:out value="${allBoarder.getRooms() }"/></td>
									<td><a href="/deleteBoarder/${allBoarder.getId()}" onclick="return confirm('Are you sure you want to delete this record?')">remove</a></td>
									<td>
										<form:form action="/addAmount/${allBoarder.getId()}" method="post" modelAttribute="amount">
											<form:errors path="fName" class="form-control is-invalid"/>
											<form:hidden path="fName" value="${allBoarder.getfName()}"/>
											<form:errors path="lName" class="form-control is-invalid"/>
											<form:hidden path="lName" value="${allBoarder.getlName()}"/>
											<form:errors path="age" class="form-control is-invalid"/>
											<form:hidden path="age" value="${allBoarder.getAge()}"/>
											<form:errors path="rooms" class="form-control is-invalid"/>
											<form:hidden path="rooms" value="${allBoarder.getRooms()}"/>
											
											<c:if test="${allBoarder.getRooms()=='(new boarder)None'}">
												<form:input path="balance" type="number" style="width:100px;" placeholder="${allBoarder.getBalance()} Php"/>
												<input disabled="disabled" type="submit" class="btn btn-secondary mt-2" value="set amount"/>
											</c:if>
											<c:if test="${allBoarder.getRooms()!='(new boarder)None'}">
												<form:errors path="balance" class="form-control is-invalid"/>
												<form:input path="balance" type="number" style="width:100px;" placeholder="${allBoarder.getBalance()} Php"/>
												<input type="submit" class="btn btn-secondary mt-2" value="set amount"/>
											</c:if>
										</form:form>								
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col form-group">
					<form:form action="/addRules" method="post" modelAttribute="rule">
						<form:label path="rules">Enter house rule:</form:label>
						<form:errors path="rules" class="form-control is-invalid"/>
						<form:input path="rules" type="text"/>
						<form:errors path="user"/>
						<form:hidden path="user" value="${user.getId()}"/>
						<input type="submit" class="d-grid gap-2 m-2" value="Add"/>
					</form:form>
					<div style="height:220px; overflow:scroll;">
						<table class="table table-secondary table-striped">
							<thead>
								<tr>
									<th>Rules</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="allRules" items="${rules}">
									<tr>
										<td><c:out value="${allRules.getRules()}"/></td>
										<td><a href="/removeRules/${allRules.getId()}">remove</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
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