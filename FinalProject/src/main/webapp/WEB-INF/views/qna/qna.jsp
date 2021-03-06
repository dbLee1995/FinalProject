<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>코코아톡:: 문의하기</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="${cp }/resources/images/icons/favicon.ico">
	<link rel="icon" href="${cp }/resources/images/icons/favicon.ico">
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
	<style>
	#boardForm{
		width:1200px;
		margin-top: 100px;
		margin-left:-130px; 
	}
	.btn.btn-success{
		margin-left: 900px;
		margin-bottom: 5px;
		background-color:lightblue;
		border:none;
	}
	#title{
		width:300px;
	}
	table{
		text-align:center;
	}
	.container{
		width:1000px;
		margin-top:30px;
		margin-left: 50px;
	}
	</style>
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
					<li><a href="${cp }/logout">로그아웃</a></li>
				</ul>
			</nav>
			</aside>
			<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
	    	<div class="container">
	    		<div class="row d-flex">
	    			<div class="col-xl-8 px-md-5 py-5">
<div class="container">
 
    	<div style="width:1000px;">            
            <a href="${cp}/qna/insert?num=${num}"  class="btn btn-success">글쓰기</a>            
        </div>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>번호</th>
                    <th id="title">제목</th>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>답변여부</th>
                </tr>
            </thead>
             <tbody>
                <c:forEach var="lis" items="${list}" varStatus="status">
                    <tr>
                        <td>${lis.qnanum}</td>
                        <c:choose>
                        	<c:when test="${sessionScope.num eq lis.num or sessionScope.id eq 'admin'}">
                        		<td><a href="${cp}/qna/info?qnanum=${lis.qnanum}">${lis.qnatitle}</a></td>
                        	</c:when>
                        	<c:otherwise>
                        		<td>${lis.qnatitle}</td>
                        	</c:otherwise>
                        </c:choose>
                        <td>${plist[status.index].name}</td>
                        <td>${lis.qnaregdate}</td>
                        <td><c:if test="${lis.qnaanswer == null}">X</c:if><c:if test="${lis.qnaanswer != null}">O</c:if></td>
                        <td></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </div>
    </div>
    </div>
    </div>
    </section>
</div>
</div>

<!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<script>

</script>
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