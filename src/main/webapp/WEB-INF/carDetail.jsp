<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<c:forEach items="${car}" var="c">
		<c:set var="id" value="${c.id}"></c:set>
		<c:set var="name" value="${c.name}"></c:set>
		<c:set var="image" value="${c.photoImagePath}"></c:set>
		<c:set var="make" value="${c.make}"></c:set>
		<c:set var="model" value="${c.model}"></c:set>
		<c:set var="registeration" value="${c.registeration}"></c:set>
		<c:set var="price" value="${c.price}"></c:set>
		<c:set var="mileage" value="${c.mileage}"></c:set>
		<c:set var="plate" value="${c.plate}"></c:set>
		<c:set var="transmission" value="${c.transmission}"></c:set>
		<c:set var="location" value="${c.location}"></c:set>
		<c:set var="sellStatus" value="${c.sellStatus}"></c:set>
	</c:forEach>

<div class="container mt-5 py-5">
	<div class="card">
		<div class="row g-0">
			<div class="col-md-6 border-end">
				<div class="d-flex flex-column justify-content-center">
					<div class="main_image">
						<img src="${image}" id="main_product_image" width="100%">
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="p-3 right-side">
					<div class="d-flex justify-content-between align-items-center">
						<h2>${model} ${name}</h2>
						<hr>
					</div>
					<div class="my-3 mx-5 content">
					
					<div class="d-flex">
						<div style="width: 300px;">
							<span class="fw-bold">Current Price</span>
							<h3 class="text-danger">RP ${price}</h3>
						</div>
						<div style="width: 300px;">
							<span class="fw-bold">Current Bid</span>
							<c:if test="${empty highest}">
								<h3 class="text-danger">RP 0</h3>
							</c:if>
							<c:if test="${not empty highest}">
								<h3 class="text-danger">RP ${highest}</h3>
							</c:if>
						</div>	
					</div>
					
					<div style="width: 300px;">
						<span class="fw-bold">Location</span>
						<p>${location}</p>
					</div>
			
					<div class="d-flex">
						<div style="width: 300px;">
							<i class="fa fa-heart"></i>
							<span class="text-danger">favorit</span>
						</div>	
						<div style="width: 300px;">
							<i class="fa fa-share"></i>
							<span class="text-danger">Share</span>
						</div>
						<div style="width: 300px;">
							<i class="fa fa-phone"></i>
							<span class="text-danger">Contact the seller</span>
						</div>	
					</div> 
				</div>
			</div>
			<c:if test="${sellStatus == 'sold'}">
				<h3 align="center">Car Sold!</h3>
			</c:if>
			<c:if test="${sellStatus == 'Booked'}">
				<h3 align="center">Car Booked!</h3>
			</c:if>
			<c:if test="${sellStatus == 'on sale'}"> 
				<div class="buttons mt-3 justify-content-center align-items-center">
				
				<sf:form action="book" method="post" class="was-validated"
					modelAttribute="booking">
					<input type="hidden" name="cid" value="${id}">
					<button type="submit" class="btn btn-outline-dark"
					style="width: 500px; margin-left: 20px; margin-bottom : 10px">Book Now</button>
				</sf:form>
				
						</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-12">
		<h2 style="margin-left: 10px">Car Detail</h2>
				<div class="card mb-4">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-2 ">
								<p class="mb-0"><b>Fuel Type</b></p>
							</div>
							<div class="col-sm-4 border-end">
								<p class="text-muted mb-0">Gasoline</p>
							</div>
							<div class="col-sm-2">
								<p class="mb-0"><b>Condition</b></p>
							</div>
							<div class="col-sm-4">
								<p class="text-muted mb-0">Used Car</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-2">
								<p class="mb-0"><b>Service Books</b></p>
							</div>
							<div class="col-sm-4 border-end">
								<p class="text-muted mb-0">Yes</p>
							</div>
							<div class="col-sm-2">
								<p class="mb-0"><b>Backup Key</b></p>
							</div>
							<div class="col-sm-4">
								<p class="text-muted mb-0">Yes</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-2">
								<p class="mb-0"><b>Manufacture Year</b></p>
							</div>
							<div class="col-sm-4 border-end">
								<p class="text-muted mb-0">${make}</p>
							</div>
							<div class="col-sm-2">
								<p class="mb-0"><b>Registration Date</b></p>
							</div>
							<div class="col-sm-4">
								<p class="text-muted mb-0">${registeration}</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-2">
								<p class="mb-0"><b>Registration Type</b></p>
							</div>
							<div class="col-sm-4 border-end">
								<p class="text-muted mb-0">Individual</p>
							</div>
							<div class="col-sm-2">
								<p class="mb-0"><b>Number of Seats</b></p>
							</div>
							<div class="col-sm-4">
								<p class="text-muted mb-0">2 or more</p>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-2">
								<p class="mb-0"><b>Current Mileage</b></p>
							</div>
							<div class="col-sm-4 border-end">
								<p class="text-muted mb-0">${mileage}</p>
							</div>
							<div class="col-sm-2">
								<p class="mb-0"><b>License plate</b></p>
							</div>
							<div class="col-sm-4">
								<p class="text-muted mb-0">${plate}</p>
							</div>
						</div>
					</div>
				</div>
			</div>

<div class="card mt-5">
	<h5 class="card-header" align="center">Featured</h5>
  		<div class="card-body">
    		<div class="container text-center">
  				<div class="row">
				    <div class="col">
				   		<i class="fa fa-exclamation-triangle"></i>
				    	<p>emergency stop signal<p>
				    </div>
				    <div class="col">
				    	<i class="fa fa-car"></i>
				    	<p>Airbag</p>
				    </div>
				    <div class="col">
				    	<i class="fa fa-play"></i>
				    	<p>Button Start</p>
				    </div>
				    <div class="col">
				    	<i class="fa fa-car"></i>
				    	<p>Keyless Door Locking System</p>
				    </div>
				</div>
			</div>
			<div class="container text-center py-3">
  				<div class="row">
				    <div class="col">
				    	<i class="fas fa-paragraph"></i>
				    	<p>Parking Brake</p>
				    </div>
				    <div class="col">
				    	<i class="fab fa-bluetooth"></i>
				    	<p>Bluetooth</p>
				    </div>
				    <div class="col">
				    	<i class="fas fa-snowflake"></i>
				    	<p>Rear Ac</p>
				    </div>
				    <div class="col">
				    	<i class="fas fa-plug"></i>
				    	<p>Power Socket</p>
				    </div>
				</div>
			</div>
 		</div>
</div>

<div class="container mt-5">
	<h3 style="margin-bottom: 20px;" align="center">Bidding & Booking Status</h3>
	<hr>
<div class="buttons d-flex flex-row gap-2 justify-content-center align-items-center">
	
<!-- Button trigger modal -->
	<button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#exampleModal1"
			style="width: 500px;">Book for Test Drive</button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModal1Label" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModal1Label">Book for Test Drive</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<!-- Book Form -->
					<sf:form action="book" method="post" class="was-validated" modelAttribute="booking">
						<div class="mb-3 mt-3">
							<label for="bookDate" class="form-label">Booking Date:</label> <input type="date" class="form-control"
								name="bookDate" required="true" />
								<div class="valid-feedback">Valid.</div>
								<div class="invalid-feedback">Please fill out this field.</div>
						</div>
							<input type="hidden" name="cid" value="${id}">
							
							<button type="submit" class="btn btn-primary" style="width: auto;">Book on this Date</button>
					</sf:form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#exampleModal"
			style="width: 500px;">Bid</button>
			
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Car Bidding</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">

				<!-- Bid Form -->
				<sf:form action="bid" method="post" class="was-validated" modelAttribute="bidding">
					<div class="mb-3 mt-3">
						<label for="name" class="form-label">Bid Price (RM):</label> <input type="text" class="form-control"
							placeholder="Enter bidding price" name="bidderPrice" required="true" />
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
					</div>
						<input type="hidden" name="cid" value="${id}">
						<button type="submit" class="btn btn-primary">Bid at this price</button>
				</sf:form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<div class="container py-5">
	<div class="row">
		<div class="col-12">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Bidding Date</th>
						<th scope="col">Bidding Price (RM)</th>
						<th scope="col">Test Drive Book Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${bid}" var="b">
						<tr>
							<td>${b.bidderName}</td>
							<td>${b.bidDate}</td>
							<td>${b.bidderPrice}</td>
							<td>${b.bookDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>


	<%@ include file="footer.jsp"%>
</body>
</html>