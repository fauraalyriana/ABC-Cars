<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp"%>
	
<div class="container-fluid mt-5" style="padding-top: 100px; background: #dee1ec; padding-bottom: 100px; 
padding-left: 150px; padding-right: 150px;">
	<c:if test="${error_string != null}">
		<div class="alert alert-danger">${error_string}
			Click here to <a href="register_user"> Register</a>
		</div>
	</c:if>
	<c:if test="${success_login != null}">
		<div class="alert alert-success">${success_login}
			Click here to navigate to <a href="home"> Home</a>
		</div>
	</c:if>
	<c:if test="${success_logout != null}">
		<div class="alert alert-success">${success_logout}
			Click here to <a href="login">Login</a>
		</div>	
	</c:if>
	
	<c:if test="${ (success_logout == null) && (success_login == null) }">
		<div class="row align-items-center">
    		<div class="col-12">
				<c:url var="post_url" value="/login" />
				<h3 align="center">Login to your account</h3>
				<hr>
				
					<form action="${post_url}" method="post" class="was-validated">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<div class="mb-3 mt-3">
						<label for="username" class="form-label">Username:</label> 
						<input type="text" class="form-control" id="userName" placeholder="Enter username" name="username" value="" required>
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password:</label> 
						<input type="password" class="form-control" id="password" placeholder="Enter password" name="password" value="" required>
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
					</div>
						<input type="submit" name="Login" value="Sign In" class="btn" style="background-color: #e88a1a; color: black" />
					</form>
					<p class="mt-3"> New User? Click here to 
						<a href="register"  style="color: #cf3030">Sign Up</a>
					</p>
				</div>
    		</div>
	</c:if>
	</div>

	<%@ include file="footer.jsp"%>