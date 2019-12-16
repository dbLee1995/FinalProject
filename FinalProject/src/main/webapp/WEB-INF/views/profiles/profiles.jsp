<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Andrea - Free Bootstrap 4 Template by Colorlib</title>
	<style>
		.img.prof{
			width:40px;
			height:250px;
			border-radius:50%;
		}
		.p1{
			float:left;	
		}
    </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${cp}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${cp}/resources/css/animate.css">   
    <link rel="stylesheet" href="${cp}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${cp}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${cp}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${cp}/resources/css/aos.css">
    <link rel="stylesheet" href="${cp}/resources/css/ionicons.min.css">
    <link rel="stylesheet" href="${cp}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${cp}/resources/css/jquery.timepicker.css">    
    <link rel="stylesheet" href="${cp}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${cp}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${cp}/resources/css/style.css">
  </head>
  <body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight">
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="fashion.html">Fashion</a></li>
					<li><a href="travel.html">Travel</a></li>
					<li class="colorlib-active"><a href="about.html">About</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul>
			</nav>

			<div class="colorlib-footer">
				<h1 id="colorlib-logo" class="mb-5"><a href="index.html" style="background-image: url(images/bg_1.jpg);">Andrea <span>Moore</span></a></h1>
				<p class="pfooter"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
			</div>
		</aside> <!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="about-section">
	    	<div class="container-fluid px-0">
	    		<div class="row d-flex">
	    			<div class="col-md-6 d-flex">
	    				<div style="width:100%;height:100%;margin-left:50px;">
 <!-- background이미지 --><div class="img d-flex align-self-stretch align-items-center js-fullheight" style="background-image:url(images/about.jpg);">	    					
	    					<div style="background-color:lightgray;width:90%;height:880px;margin:auto;padding-top:250px;padding-bottom:30px;">	    						
	    	  <!-- 이미지 -->		<div style="width:280px;height:300px;margin:auto;">
	    	  					<a href="#">
	    	   						<img src="${cp}/resources/upload/image_4.jpg" class="img prof">
	    	   					</a>
	    	     	   	    	</div>							    						
	    					<div style="text-align:center;width:100%;height:50%;padding-bottom:500px;font-size:large;"><!-- 전화번호/이메일 -->
	    			<!-- 이름 --><label>${id}</label> <a href="#" class="icon-pencil"></a>
	    						<hr style="border: 1px solid white;width:95%;margin-top: -3px;">
	    						<div style="width:300px;margin:auto;">
	    							<label class="p1">생일 : </label>&nbsp;<label>${pvo.birth}</label><br>
		    						<label class="p1">전화번호 : </label>&nbsp;<label>${pvo.phone}</label><br>
		    						<label class="p1">이메일 : </label>&nbsp;<label>${pvo.email}</label><br>
	    						</div>
	    					</div>	    						
	    					</div>
	    				</div>
	    				</div>
	    			</div>
	    			<div class="col-md-6 d-flex align-items-center">
	    				<div class="text px-4 pt-5 pt-md-0 px-md-4 pr-md-5 ftco-animate">
		            <h2 class="mb-4">I'm <span>Andrea Moore</span> a Scotish Blogger &amp; Explorer</h2>
		            <p>${pvo.num}; A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	            </div>
		        </div>
	        </div>
	    	</div>
	    </section>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${cp}/resources/js/jquery.min.js"></script>
  <script src="${cp}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${cp}/resources/js/popper.min.js"></script>
  <script src="${cp}/resources/js/bootstrap.min.js"></script>
  <script src="${cp}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${cp}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${cp}/resources/js/jquery.stellar.min.js"></script>
  <script src="${cp}/resources/js/owl.carousel.min.js"></script>
  <script src="${cp}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${cp}/resources/js/aos.js"></script>
  <script src="${cp}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${cp}/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${cp}/resources/js/google-map.js"></script>
  <script src="${cp}/resources/js/main.js"></script>   
  </body>
</html>