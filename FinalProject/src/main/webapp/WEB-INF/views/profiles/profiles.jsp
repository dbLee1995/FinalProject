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
		.tb, tr, th{
			text-align:right;
			padding-left: 30px;
			color:white;
		}
		td{
    		text-align: left;
    		padding-left: 15px;
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
	    		<c:choose>	
	    			<c:when test="${sessionScope.num eq pvo.num}">
	    			<div class="col-md-6 d-flex">
	    				<div style="width:100%;height:100%;margin-left:50px;">	    				
 <!-- background이미지 --><div class="img d-flex align-items-center full-img" style="background-image:url(${cp}/resources/upload/${pvo.backimg});">					    					
	    					<div style="width:90%;height:880px;margin:auto;padding-top:250px;padding-bottom:30px;">	    						
	    	  <!-- 이미지 -->		<div style="width:280px;height:300px;margin:auto;">
	    	  					<a href="#">
	    	   						<img src="${cp}/resources/upload/image_4.jpg" class="img prof">
	    	   					</a>
	    	     	   	    	</div> 								    						
	    					<div style="text-align:center;width:100%;height:50%;padding-bottom:500px;font-size:large;"><!-- 전화번호/이메일 -->
	    			<!-- 이름 --><label>${id}</label> <a href="#" class="icon-pencil"></a>
	    						<hr style="border: 1px solid white;width:95%;margin-top: -3px;">
	    						<table class="tb" style="width:400px;margin:auto;">
	    								<tr><th>Birth : </th><td><b id="birth">${pvo.birth}</b><a href="#" id="birthClick" class="icon-pencil" style="padding-left:5px;"></a></td></tr>
	    								<tr><th>Phone : </th><td>${pvo.phone}<a href="#" id="birth" class="icon-pencil" style="padding-left:5px;"></a></td></tr>
	    								<tr><th>Email : </th><td>${pvo.email}<a href="#" class="icon-pencil" style="padding-left:5px;"></a></td></tr>
	    						</table>			
	    						<table class="tb" style="width:500px;margin-top:10px; text-color:white;">
	    							<tr><th><hr style="color:white;border:1px"></th></tr>
	    							<tr>
	    								<th>
	    									<form method="post" id="setform" enctype="multipart/form-data">
	    									<input type="file" name="changeFile1" id="changeFile1" onChange="changeFile(this);" style="display:none;"/>
	    									<a href="javascript:void(0);" class="file1" name="file1" onClick="uploadFile();" style="color:white;font-size:20px;"><b class="icon-magic"></b><br>배경편집</a>
	    									</form>
	    								</th>		
	    							<tr>	
	    							<th><a href="${pageContext.request.contextPath}/story/list?num=${pvo.num}" style="color:white;font-size:20px;"><b class="icon-comments"></b><br>MyStory</a></th>
	    							<th><a href="${pageContext.request.contextPath}/friends/list?num=${pvo.num}" style="color:white;"><b class="icon-person"></b><br>Friends</a></th></tr>    							
	    						</table>	    						
	    					</div>	    						
	    					</div>
	    				</div>
	    				</div>
	    			</div>
	    			</c:when>
	    				<c:otherwise>
	    					<div class="col-md-6 d-flex">
	    				<div style="width:100%;height:100%;margin-left:50px;">	    				
 <!-- background이미지 --><div class="img d-flex align-self-stretch align-items-center js-fullheight" style="margin:auto;padding-top:250px;padding-bottom:30px;">					    					
	    					<img src="${pvo.backImg}">
	    					<div style="background-image:url(${pvo.backImg})">	    						
					<!-- 이미지 --><div style="width:280px;height:300px;margin:auto;">
	    	   						<img src="${cp}/resources/upload/image_4.jpg" class="img prof">				
								 </div> 								    						
	    					<div style="text-align:center;width:100%;height:50%;padding-bottom:500px;font-size:large;"><!-- 전화번호/이메일 -->
	    			<!-- 이름 --><label>${id}</label> <a href="#" class="icon-pencil"></a>
	    						<hr style="border: 1px solid white;width:95%;margin-top: -3px;">
	    						<table class="tb" style="width:400px;margin:auto;">
	    							<tr><th>Birth : </th><td>${pvo.birth}</td></tr>
	    							<tr><th>Phone : </th><td>${pvo.phone}</td></tr>
	    							<tr><th>Email : </th><td>${pvo.email}</td></tr>
	    						</table>			
	    						<table class="tb" style="margin-top:10px;margin-left:210px;">
	    							<tr><th><hr style="color:white;border:1px"></th></tr>
	    							<tr>    							
	    							<th><a href="${pageContext.request.contextPath}/story/list?num=${pvo.num}">CocoaStory</a></th> 							
	    						</table>	    						
	    					</div>	    						
	    					</div>
	    				</div>
	    				</div>
	    			</div>
	    				</c:otherwise>
	    			</c:choose>
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
  <script type="text/javascript">
		function uploadFile(){			
			$("#changeFile1").click();
			
		}
		function changeFile(e){				
			setFile(e);
		}
		function setFile(e){
			//var form=jQuery("#setform");			
			var formData=new FormData();							
  			formData.append("file1",$("#changeFile1")[0].files[0]);
  							// display:none으로 만든 input창 id입력
			$.ajax({
				url:"${cp}/profile/updateBackImg?num=${pvo.num}",
				type:"POST",
				processData:false,
				contentType:false,
				data:formData,
				success:function(){					
					alert("업로드완료!!!");
					location.reload();
				}
			});
		}
		
		$(function(){
			$("#birthClick").click(function(){
				$("#birth").html("<form method='post' id='birthform' enctype='multipart/form-data' style='display:inline-flex;'>" +
								 "<input type='text' value='${pvo.birth}' style='width:110px;height:30px;text-align:center;'>" +
								 "<a href='#' id='abirth'></a></form>");
	
			});
		});
	</script>
  </body>
</html>