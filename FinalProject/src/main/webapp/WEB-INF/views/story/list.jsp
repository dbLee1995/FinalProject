<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Andrea - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
  </head>
  <body>
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight">
			<nav id="colorlib-main-menu" role="navigation">
				<ul>		
					<c:choose>
						<c:when test="${empty sessionScope.id}">					
							<li><a href="${pageContext.request.contextPath}/member/login">Login</a></li>		
						</c:when>	
				 		<c:otherwise>
				 			<li><a href="${cp}/profiles/info?num=${sessionScope.num}">마이페이지</a></li>
							<li class="colorlib-active" ><a href="${pageContext.request.contextPath}/story/list?num=${sessionScope.num}">코코아 스토리</a></li>
							<li ><a href="${cp }/friends/list?num=${sessionScope.num}">친구들</a></li>			
						</c:otherwise>	 
					</c:choose>
					<li><a href="${pageContext.request.contextPath}/ChatList?num=${sessionScope.num}&clnum=-1">채팅</a></li>
					<li><a href="${cp }/emoShop/main">코코아 이모티콘</a></li>
					<li><a href="javascript:void(0);" onclick="showCalendar();">달력</a></li>
					<li><a href="${cp}/qna/list">문의하기</a></li>
					<li><a href="${cp }/logout">로그아웃</a>
				</ul>
			</nav>
		</aside> <!-- END COLORLIB-ASIDE -->
				
		<!-- start list //////////////////////////////////////////////////////// -->		
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
	    	<div class="container">
	    		<div class="row d-flex">
	    			<div class="col-xl-8 px-md-5 py-5">
	    			<h1>COCOA Story</h1>
	    				<c:choose>
	    					<c:when test="${sessionScope.num eq num }">
	    						<h3><a href="${pageContext.request.contextPath}/story/insert?num=${sessionScope.num}">글등록해봐요</a></h3>
	    					</c:when>
	    				</c:choose>
	    				<c:forEach var="list" items="${list}">	
	    				<c:choose>
							<c:when test="${empty list.storynum}">
								<h1><a href="${pageContext.request.contextPath}/story/insert">+</a></h1>
							</c:when>
							
							<c:otherwise>    				   			
	    				<div class="row pt-md-4">    				
	    					<div class="col-md-12">	    				    			
		    					<div class="blog-entry-2 ftco-animate">		    					
	    							<a href="#" class="img" style="background-image: url(${pageContext.request.contextPath}/resources/upload/${list.saveimg});'>"></a>
	    							<div class="text pt-4">
				              <h3 class="mb-4"><a href="#">${list.stitle}</a></h3>
				              <p class="mb-4">${list.scontent}</p>
				              <div class="author mb-4 d-flex align-items-center">
				              		<c:if test="${profileimg eq null && profileimg ne null }"/>
				            		<a href="${pageContext.request.contextPath}/profiles/info?num=${num}" class="img" style="background-image: url(${pageContext.request.contextPath}/resources/upload/${profileimg});"></a>
				            		<div class="ml-3 info">
				            			<span>Written by</span>
				            			<h3><a href="${cp}/profiles/info?num=${num}">${name}</a>, <span>${list.sregdate}</span></h3>
				            		</div>
				            	</div>
				              <div class="meta-wrap d-md-flex align-items-center">
				              	<div class="half order-md-last text-md-right">
					              	<p class="meta">
					              		<span><i class="icon-heart"></i>3</span>
					              		<span><i class="icon-eye"></i>100</span>
					              		<span><a href="${pageContext.request.contextPath}/story/comments?storynum=${list.storynum}&num=${list.num}"><i class="icon-comment"></i>5</a></span>
					              		<c:choose>
					              			<c:when test="${sessionScope.num == num}">
					              				<span><a href="${pageContext.request.contextPath}/story/update?storynum=${list.storynum}&num=${sessionScope.num}"><i class="icon-person"></i>수정</a></span>
					              				<span><a href="${pageContext.request.contextPath}/story/delete?storynum=${list.storynum}&num=${sessionScope.num}"><i class="icon-trash"></i>삭제</a></span>
					              			</c:when>
					              		</c:choose>
					              	</p>
				              	</div>
				              	<div class="half">
					            
				              	</div>
				              </div>
				            </div>
	    						</div>
	    					</div>	    					
			    		</div>
			    		</c:otherwise>
			    		</c:choose>	
			    		</c:forEach>
			    				    			    
			    		<!--///// END //////////////////////////////////////////////////////-->

			    	</div>
	    		</div>
	    	</div>
	    </section>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/aos.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath }/resources/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
      <script src="${pageContext.request.contextPath }/resources/js/alarm2.js"></script>
  </body>
</html>