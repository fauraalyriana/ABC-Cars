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
	
<div class="container mt-5 py-5">
	<div class="row align-items-center py-3">
    	<div class="col-6">
        	<h3>Start to post your car!</h3>
        	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
		<div class="col-6">
    		<img class="card-img-top" src=/images/post.png />
  		</div>
	</div>
</div>

<div class="container">
	<h2 align="center">Sell Your Car Today!</h2>
	<hr>
	<div class="modal-body">
		<c:if test="${success_post != null}">
		<div class="alert alert-success">${success_post}</div>
		</c:if>

	<!-- Car Post Form -->
	<form action="car_post" method="post" class="was-validated row g-2" modelAttribute="car" enctype="multipart/form-data">
	<div class="col-md-6 mb-3">
		<label for="name" class="d-flex form-label">Name:</label>
		<input type="text" class="form-control" placeholder="Enter car name" name="name" path="name" required="true" />
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
	</div>
	<div class="col-md-6 mb-3">
		<label for="model" class="d-flex form-label">Model:</label>
		<input type="text" class="form-control" placeholder="Enter model" name="model" path="model" required="true" />
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
	</div>
	<div class="col-md-6 mb-3">
		<label for="price" class="d-flex form-label">Price (RP):</label>
		<input type="text" class="form-control" id="price" placeholder="Enter car price" name="price" path="price" required="true" />
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
	</div>
	<div class="col-md-6 mb-3">
		<label for="make" class="d-flex form-label">Make Year:</label>
		<input type="text" class="form-control" placeholder="Enter make year" name="make" path="make" required="true" />
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
		</div>
	<div class="col-md-6 mb-3">
		<label for="registeration" class="d-flex form-label">Registration Date:</label>
		<input type="text" class="form-control" id="registeration" placeholder="Enter registeration date" name="registeration" path="registeration" required="true" />
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
	</div>
	<div class="col-md-6 mb-3">
		<label for="transmission" class="d-flex form-label">Transmission System:</label>
		<select class="form-select" id="transmission" name="transmission" path="transmission" required="true">
  			<option selected disabled value>Choose an option</option>
  			<option value="1">Automatic</option>
  			<option value="2">Manual</option>
		</select>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
	</div>
	<div class="mb-3">
		<label for="location" class="d-flex form-label">Car Location:</label>
		<textarea type="text" class="form-control" id="location" placeholder="Enter car location" name="location" path="location" required="true"></textarea>
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
	</div>
	<div class="mb-3">
		<label class="d-flex form-label">Photo:</label> 
		<input type="file" class="form-control" name="fileImage" id="photo" accept="image/png, image/jpeg" required="true" />
			<div class="valid-feedback">Valid.</div>
			<div class="invalid-feedback">Please fill out this field.</div>
	</div>
	<div class="mb-3">
		<button type="submit" class="btn btn-primary d-flex">Post</button>
	</div>
	</form>
	<!-- Car Post Form -->
	</div>
</div>

<c:if test="${success_post != null}">
	<div class="alert alert-success">${success_post}
		Click here to <a href="/car_detail?cid=${id}">View</a> your carpost
	</div>
</c:if>

	<%@ include file="footer.jsp"%>


</body>
</html>