<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!--  Enable Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!--  Access the Static Resources without using spring URL -->
<link href="/css/style.css" rel="stylesheet" />
<script src="/js/script.js"></script>

</head>
<body>
	<%@ include file="header.jsp"%>
	
<c:if test="${success_register != null}">
	<div class="alert alert-success py-5 mt-5">${success_register} Click here to 
		<a href="login"> Sign In</a> </div>
</c:if>

<div class="container-fluid" style="padding-top: 150px; background: #dee1ec; padding-bottom: 50px; padding-left: 100px; padding-right: 100px">
	<h2 align="center">Create a new account</h2>
	<hr>
	<sf:form action="registerProcess" method="post" class="was-validated row g-2" modelAttribute="user">			
		<div class="col-md-6 mb-3">
			<label for="name" class="form-label">Name:</label> 
			<sf:input type="text" class="form-control" placeholder="Enter name" name="name" path="name" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
		</div>
		<div class="col-md-6 mb-3">
			<label for="userName" class="form-label">Username:</label> 
			<sf:input type="text" class="form-control" id="userName" placeholder="Enter username" name="userName" path="userName" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
		</div>
		<div class="col-md-6 mb-3">
			<label for="email" class="form-label">Email:</label> 
			<sf:input type="email" class="form-control" placeholder="Enter username" name="email" path="email" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
		<div class="col-md-6 mb-3">
			<label for="password" class="form-label">Password:</label> 
			<sf:input type="password" class="form-control" id="password" placeholder="Enter password" name="password" path="password" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
		</div>
			<input type="submit" value="Register" class="btn" style="background-color: #e88a1a; color: black" />
	</sf:form>
      <div>
      	<p>Have an account? <a href="login" style="color: #cf3030">Sign In</a></p>
      </div>
      </div>

	<%@ include file="footer.jsp"%>

</body>
</html>
