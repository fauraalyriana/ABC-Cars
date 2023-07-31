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

<div class="container-fluid mt-5 px-5 py-5"  style="background: #f0f0f0; padding-top: 25px; padding-bottom: 25px">
	<div class="align-items-center">
    		<h3>About ABC Car</h3>
    		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quam quisque id diam vel. Ridiculus mus mauris vitae ultricies leo integer malesuada. Sodales ut eu sem integer vitae. Felis eget nunc lobortis mattis. Interdum posuere lorem ipsum dolor sit amet consectetur adipiscing. Consequat interdum varius sit amet mattis vulputate enim. Adipiscing elit ut aliquam purus sit amet luctus. Mi in nulla posuere sollicitudin aliquam ultrices. Adipiscing diam donec adipiscing tristique risus nec. Maecenas pharetra convallis posuere morbi leo urna molestie. Nisl nunc mi ipsum faucibus vitae aliquet. Ac odio tempor orci dapibus ultrices in iaculis nunc sed. Morbi tristique senectus et netus.</p>
		</div>
	</div>
</div>

<div class="container-fluid text-center py-5 px-5">
<h2 class="mb-4">Our Vision and Mission</h2>
	<div class="row">
    	<div class="col ">
     		<div class="card mx-3 border-primary">
  				<div class="card-header">
    				<b>Vision</b>
  				</div>
 				<div class="card-body">
    				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
  				</div>
			</div>
    	</div>
    	<div class="col">
      		<div class="card mx-3 border-primary">
  				<div class="card-header">
    				<b>Mission</b>
  				</div>
 				<div class="card-body">
    				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
  				</div>
			</div>
    	</div>
	</div>
</div>

<div class="container-fluid" style="background: #f0f0f0; padding-top: 30px; padding-bottom: 30px; padding-left: 150px; padding-right: 150px">
	<div class="row align-items-center">
    	<div class="col-6">
    		<h3>History</h3>
    		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quam quisque id diam vel. Ridiculus mus mauris vitae ultricies leo integer malesuada. Sodales ut eu sem integer vitae. Felis eget nunc lobortis mattis. Interdum posuere lorem ipsum dolor sit amet consectetur adipiscing. Consequat interdum varius sit amet mattis vulputate enim. Adipiscing elit ut aliquam purus sit amet luctus. Mi in nulla posuere sollicitudin aliquam ultrices. Adipiscing diam donec adipiscing tristique risus nec. Maecenas pharetra convallis posuere morbi leo urna molestie. Nisl nunc mi ipsum faucibus vitae aliquet. Ac odio tempor orci dapibus ultrices in iaculis nunc sed. Morbi tristique senectus et netus.</p>
		</div>
		<div class="col-6">
    		<img src="/images/history.png" style="width:95%">
    	</div>
	</div>
</div>
				
	<%@ include file="footer.jsp"%>

