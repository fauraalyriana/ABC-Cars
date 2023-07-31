 <%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--  Enable Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!--  Access the Static Resources without using spring URL -->
<link href="/css/style.css" rel="stylesheet" />
<script src="/js/script.js"></script>

</head>
<body>
	<%@ include file="header.jsp"%>
	
<div class="container-fluid mt-5 py-5 px-5">
	<div class="row align-items-center">
    	<div class="col-8">
    		<h6>CONTACT OUR SUPPORT TEAM</h6>
    		<h3>We're here 24/7</h3>
    		<p>Reach out with your questions, concerns and challenges. Or just to say hi, We'll be happy to chat and help</p>
		</div>
	</div>
</div>

<div class="container text-center py-5">
	<div class="row align-items-start">
    	<div class="col">
      		<h4>Email</h4>
      		<hr>
      		<p>info@abcCar.com</p>
      		<p>help@abcCar.com</p>
    	</div>
		<div class="col">
    		<h4>Phone Number</h4>
      		<hr>
      		<p>+1 5589 55488 55</p>
      		<p>+62 8309 8493 8493</p>
    	</div>
    	<div class="col">
      		<h4>Address</h4>
      		<hr>
      		<p>A108 Adam Street NY 535022, USA</p>
    	</div>
  	</div>
</div>

<div class="container-fluid px-5 py-3 mb-5">
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
</body>
</html>
