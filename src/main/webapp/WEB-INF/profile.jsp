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

	<section> <c:forEach items="${user}" var="u">
		<c:set var="id" value="${u.id}"></c:set>
		<c:set var="name" value="${u.name}"></c:set>
		<c:set var="uname" value="${u.userName}"></c:set>
		<c:set var="email" value="${u.email}"></c:set>
		<c:set var="mobile" value="${u.mobile}"></c:set>
		<c:set var="address" value="${u.address}"></c:set>
	</c:forEach>
	
<div class="container mt-5 py-5">
		<div class="row g-0">
  			<div class="col-md-6">
    			<div class="d-flex flex-column justify-content-center align-items-center">
      				<div class="main_image">
        				<img src="/images/img_avatar3.png" alt="avatar" class="rounded-circle img-fluid mg-thumbnail mt-4 mb-2" style="width: 130px; z-index: 1">
        				<h5 class="text-center" style="z-index: 1;">${name}</h5>
					</div>
				</div>
			</div>
		<div class="col-md-6">
			<div class="p-3 right-side">
				<div class="d-flex">
					<div style="width: 300px;">
						<span class="fw-bold">Full Name</span>
						<p>${name}</p>
					</div>	
					<div style="width: 300px;">
						<span class="fw-bold">UserName</span>
						<p>${uname}</p>
					</div>
				</div>
				
				<div class="d-flex">
					<div style="width: 300px;">
						<span class="fw-bold">Email</span>
						<p>${email}</p>
					</div>	
					<div style="width: 300px;">
						<span class="fw-bold">Phone Number</span>
						<p>${mobile}</p>
					</div>
				</div>
				
				<div style="width: 300px;">
					<span class="fw-bold">Address</span>
					<p>${address}</p>
				</div>
				
				<div align="right">
            		<a href="update" class="btn" style="background: #86A6DF; color: white" data-bs-toggle="modal"
					data-bs-target="#exampleModal">Edit Profile</a>
           	 	</div>
					
			</div>
		</div>
	</div>
</div>

<div class="container">
	<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Update User</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">

							<!-- User Update Form -->
							<sf:form action="update" method="post" class="was-validated row g-2"
								modelAttribute="user">
								<div class="col-md-6 mb-3">
									<label for="name" class="form-label">Name:</label> <input
										type="text" class="form-control" placeholder="Enter name"
										name="name" path="name" value="${name}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="userName" class="form-label">Username:</label> <input
										type="text" class="form-control" id="userName"
										placeholder="Enter username" name="userName" path="userName"
										value="${uname}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="email" class="form-label">Email:</label> <input
										type="email" class="form-control" placeholder="Enter username"
										name="email" path="email" value="${email}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="mobile" class="form-label">Mobile:</label> <input
										type="text" class="form-control" id="mobile"
										placeholder="Enter mobile" name="mobile" path="mobile"
										value="${mobile}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>
								<div class="col-md-6 mb-3">
									<label for="address" class="form-label">Address:</label> <input
										type="text" class="form-control" id="address"
										placeholder="Enter address" name="address" path="address"
										value="${address}" required="true" />
									<div class="valid-feedback">Valid.</div>
									<div class="invalid-feedback">Please fill out this field.</div>
								</div>

								<button type="submit" class="btn btn-primary">Update</button>
							</sf:form>
							<!-- User Update Form -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>

						</div>
					</div>
				</div>
			</div>
		</div>

<div class="container">
	<div class="row p-3">
		<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<button class="nav-link active" id="nav-home-tab"
					data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
					role="tab" aria-controls="nav-home" aria-selected="true">Post
					Status</button>
				<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
					data-bs-target="#nav-profile" type="button" role="tab"
					aria-controls="nav-profile" aria-selected="false">Booking
					Status</button>
				<button class="nav-link" id="nav-booked-tab" data-bs-toggle="tab"
					data-bs-target="#nav-booked" type="button" role="tab"
					aria-controls="nav-booked" aria-selected="false">Booked
					Status</button>

			</div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th scope="col">Post</th>
											<th scope="col">Car</th>
											<th scope="col">Post Date</th>
											<th scope="col">Action</th>
											<th scope="col">Sale status</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${cars}" var="c" varStatus="status">
										<tr>
											<th scope="row">${status.count}</th>
											<td>${c.name}</td>
											<td>${c.postDate}</td>
											<td>
											<!-- view car --> 
											<a type="button" class="btn btn-primary" href="/car_detail?cid=${c.id}"> 
												<i class="far fa-eye"></i></a> 
											<!-- delete car --> 
											<a type="button" class="btn btn-danger" href="/deleteCarByUser?cid=${c.id}"> 
												<i class="far fa-trash-alt"></i></a> <!-- delete car -->
											</td>
												<c:forEach items="${c.biddings}" var="b" begin="0" end="0">
													<c:set var="bidPrice" value="${b.bidderPrice}"></c:set>
													<c:if test="${bidPrice > 0}">
														<td>${b.bidderPrice}</td>
														<td>${b.bidderName}</td>
													</c:if>
														<td>${c.sellStatus}</td>
													</c:forEach>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
							<!-- end of row -->
					</div>
			</div>
			<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th scope="col">No.</th>
										<th scope="col">Book Date</th>
										<th scope="col">Car</th>
										<th scope="col">Book Status</th>
										<th scope="col">View Car</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${bids}" var="b" varStatus="status">
										<c:set var="bookDate" value="${b.bookDate}"></c:set>
											<c:if test="${bookDate != null}">
											<tr>
												<th scope="row">${status.count}</th>
												<td>${b.bookDate}</td>
												<td>${b.car.name}</td>
												<td>${b.bookStatus}</td>
												<td>
												<!-- view car --> <a type="button" class="btn btn-primary" href="/car_detail?cid=${b.car.id}">
													<i class="far fa-eye"></i>
														</a> <!-- view car -->
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>	
			<div class="tab-pane fade" id="nav-booked" role="tabpanel" aria-labelledby="nav-booked">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th scope="col">No.</th>
										<th scope="col">Car</th>
										<th scope="col">Book Date</th>
										<th scope="col">Book By</th>
										<th scope="col">Book Status</th>
										<th scope="col">Accepting</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${cars}" var="c" varStatus="status">
									<c:forEach items="${c.biddings}" var="b">
										<c:set var="bookDate" value="${b.bookDate}"></c:set>
										<c:if test="${bookDate != null}">
											<tr>
												<th scope="row">${status.count}</th>
												<td>${c.name}</td>
												<td>${b.bookDate}</td>
												<td>${b.bidderName}</td>
												<td>${b.bookStatus}</td>
												<td> <a type="button" class="btn btn-primary" href="/buyAcc?cid=${c.id}&bid=${b.id}">
													<i class="fas fa-check"></i></a>
													<a type="button" class="btn btn-danger" href="/buyDenied?cid=${c.id}&bid=${b.id}">
													<i class="fas fa-times"></i></a> 
												</td>
											</tr>
										</c:if>
									</c:forEach>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	</section>


	<%@ include file="footer.jsp"%>
</body>
</html>