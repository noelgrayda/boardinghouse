<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Welcome <c:out value="${user.getUsername()}"/>!</title>
</head>
<body>
	<div class="bg-img d-flex align-items-center justify-content-center" style="background-image: url('img/bedroom-gc5932b1be_1920.jpg');
		height: 100vh; background-size: cover;">
		<div class="container-md border bg-light p-5">
			<h6>Currently logged in: <span class="text-success"><c:out value="${user.getUsername()}"/></span></h6>
			<div class="row">
				<div class="col">
					<c:if test="${boarders.getId()==null }">
						<h2>Enter Details:</h2>
						<form:form class="m-2" action="/dashboardBoarder" method="post" modelAttribute="boarderInfo">
							<form:label path="fName">First Name:</form:label>
							<form:errors path="fName"/>
							<form:input path="fName" type="text" style="width:100px;"/>
							<form:label path="lName">Last Name:</form:label>
							<form:errors path="lName"/>
							<form:input path="lName" type="text" style="width:100px;"/>
							<form:label path="age">Age:</form:label>
							<form:errors path="age"/>
							<form:input path="age" type="number" style="width:50px;"/>
							<form:errors path="rooms"/>
							<form:hidden path="rooms" value="(new boarder)None"/>
							<form:errors path="balance"/>
							<form:hidden path="balance" value="0"/>
							<form:errors path="userBoarder"/>
							<form:hidden path="userBoarder" value="${user.getId() }"/>
							<input type="submit" value="Add"/>
						</form:form>
					</c:if>
					
					<h3>Your Details:</h3>
					<table class="table">
						<thead>
							<tr>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Age</th>
								<th>Room</th>
								<th>Details Date Entered</th>
								<th>Action</th>
								<th>Balance</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><c:out value="${boarders.getfName() }"/></td>
								<td><c:out value="${boarders.getlName() }"/></td>
								<td><c:out value="${boarders.getAge() }"/></td>
								<td><c:out value="${boarders.getRooms() }"/></td>	
								<td><fmt:formatDate value="${boarders.getOncreatedAt() }" type="date" /></td>							
								<c:if test="${boarders.getId()==null }">
									<td><a hidden="true" href="#">edit</a></td>
								</c:if>
								<c:if test="${boarders.getId()!=null }">
									<td><a href="/dashboardBoarder/${boarders.getId()}">edit</a></td>
								</c:if>
								<td><c:out value="${boarders.getBalance() }"/></td>
							</tr>
						</tbody>
					</table>
					<!-- ==================== FOR GCASH ===========================================-->
					<div>				
						<h4>Mode of payment:</h4>
						<form:form action="/gcash" method="post" modelAttribute="gcashInput">
							<form:label path="gcash">Gcash: +63</form:label>
							<form:errors path="gcash"/>
							<form:input path="gcash" type="text"/>
							<form:errors path="boarderInfo"/>
							<form:hidden path="boarderInfo"  value="${boarders.getId()}"/>
							<c:if test="${boarders.gcash.getGcash()!=null }">
								<input disabled type="submit" value="Add"/>
							</c:if>
							<c:if test="${boarders.gcash.getGcash()==null }">
								<input type="submit" value="Add"/>
							</c:if>
						</form:form>
						<c:if test="${boarders.gcash.getId()!=null}">
							<label class="my-3">
								Your Gcash Number: <span class="fst-italic">09*****<c:out value="${boarders.gcash.getGcash().substring(6, 10)}"/></span>
								<br><a href="/removeGcash/${boarders.gcash.getId()}" onclick="return confirm('Are you sure you want to delete this record?')">remove</a>
							</label>
						</c:if>
						<c:if test="${boarders.getBalance()!=null}">
							<c:if test="${boarders.getBalance()!='0'}">
								<div class="border p-2">
								<label>You have an outstanding balance of: <c:out value="${boarders.getBalance()}"/>Php</label>
								<c:if test="${boarders.gcash.getId()==null}">
									<br><label>Payment decline! You must setup your gcash!</label>
								</c:if>
								<c:if test="${boarders.gcash.getId()!=null}">
									<br><label>Pay using Gcash!</label>
									<form:form action="/payGcash/${boarders.getId()}" method="post" modelAttribute="gcashPayment">
									
										
										<input type="hidden" name="gcashBoarder" value="${boarders.getlName()}"/>
										<input type="hidden" name="gcashAmount" value="${boarders.getBalance()}"/>
										
										<form:errors path="fName"/>
										<form:hidden path="fName" value="${boarders.getfName()}"/>
										<form:errors path="lName"/>
										<form:hidden path="lName"  value="${boarders.getlName()}"/>
										<form:errors path="age"/>
										<form:hidden path="age"  value="${boarders.getAge()}"/>
										<form:errors path="rooms"/>
										<form:hidden path="rooms"  value="${boarders.getRooms()}"/>																			
										<form:errors path="balance"/>
										<form:hidden path="balance"  value="0"/>	
										<form:errors path="userBoarder"/>
										<form:hidden path="userBoarder" value="${user.getId() }"/>				
										<input type="submit" value="Pay" class="mt-2"/>
									</form:form>
								</c:if>
								</div>
							</c:if>
						</c:if>
					</div>
				</div>
				<!-- ==================== FOR GCASH ===========================================-->
				<div class="col-4">
					<div style="height:390px; overflow:scroll;">
						<table class="table table-light table-striped">
							<thead>
								<tr>
									<th class="table-secondary">House Rules</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="allRules" items="${rules}">
									<tr>
										<td><c:out value="${allRules.getRules()}"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<form action="/logout">
				<input type="submit" value="Logout" class="mt-2"/>
			</form>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
</body>
</html>