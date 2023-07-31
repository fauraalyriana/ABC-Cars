<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>ABC Car</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	<!-- Font Awesome CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<!-- Custom CSS -->
	<link rel="stylesheet" href="css/style.css">
	<style>
		.footer-text {
			font-size: 24px;
			display: block;
			text-align: center;
		}
	</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="header.jsp"%>

	<!-- Masthead -->
<div class="masthead" style="background-image: url('./images/icon.jpg'); background-size: cover; background-position: center;">
		<div class="text">
			<h4>WELCOME TO ABC CAR</h4>
			<h1 style="color: #cf3030">Find Your Dream Car</h1>
				<hr>
				<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Odio, distinctio? Excepturi aliquam, quas saepe voluptas maiores praesentium esse odio laboriosam maxime dignissimos, quaerat distinctio impedit minus illum! Minus, laborum voluptatum.</p>
					<a href="register" class="btn btn-outline-danger me-md-2" type="button">Sign Up</a>
					<a href="login" class="btn btn-outline-danger me-md-2" type="button">Sign In</a>
		</div>
	</div>
	
<div class="card py-5">
	<h5 class="card-header" align="center">What they say about us?</h5>
  		<div class="card-body">
    		<div class="container text-center">
  				<div class="row">
				    <div class="col">
				   		<h4>Cassy</h4>
				    	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.<p>
				    </div>
				    <div class="col">
				    	<h4>Beiggie</h4>
				    	<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
				    </div>
				    <div class="col">
				    	<h4>Rendika</h4>
				    	<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
				    </div>
				    <div class="col">
				    	<h4>Aslan</h4>
				    	<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
				    </div>
			</div>
		</div>
	</div>
</div>


	<div class="container-fluid px-5 py-5 mb-5">
	<div class="contact">
    	<h3>CONTACT US</h3>
        <hr>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo cons</p>
    </div>
    <div class="contact_section">
    	<div class="row">
        	<div class="col-lg-4 col-sm-12">
            	<div class="contact_main">
                	<form action="">
                            <div class="col-md-10">
         						<label for="Name" class="form-label">Name</label>
        						<input type="text" class="form-control" id="Name" name="Name" required>
       						</div>
       						<div class="col-md-10">
         						<label for="email" class="form-label">Email</label>
        						<input type="email" class="form-control" id="email" name="email" required>
       						</div>
       						<div class="col-md-10">
         						<label for="phone" class="form-label">Phone Number</label>
        						<input type="number" class="form-control" id="phone" name="phone" required>
       						</div>
       						<div class="col-md-10">
       							<label for="message" class="form-label">Message</label>
         						<textarea class="form-control" id="email" name="email" required></textarea>
       						</div>
                        </form>
                        <br>
                        <button type="submit" class="btn btn-outline-dark">Send</button>
                     </div>
                  </div>
                  <div class="col-lg-8 col-sm-12">
                     <div class="map_main">
                        <div class="map-responsive">
                           <iframe src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA0s1a7phLN0iaD6-UE7m4qP-z21pH0eSc&amp;q=A108+Adam+Street+NY+535022+USA" width="600" height="400" frameborder="0" style="border:0; width: 100%;" allowfullscreen=""></iframe>
                	</div>
            	</div>
        	</div>
    	</div>
	</div>
</div>


	<%@ include file="footer.jsp"%>

	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
