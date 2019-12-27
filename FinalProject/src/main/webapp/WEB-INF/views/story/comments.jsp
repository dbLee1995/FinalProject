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
					<li><a href="${cp}/nquire/list">문의하기</a></li>
					</ul>
					</nav>
		<div class="colorlib-footer">
			<h1 id="colorlib-logo" class="mb-4"><a href="index.html" style="background-image: url(images/bg_1.jpg);">Andrea <span>Moore</span></a></h1>
			
			<div class="mb-4">
				<h3>Subscribe for newsletter</h3>
				<form action="#" class="colorlib-subscribe-form">
					<div class="form-group d-flex">
						<div class="icon"><span class="icon-paper-plane"></span></div>
							<input type="text" class="form-control" placeholder="Enter Email Address">
					</div>
				</form>
			</div>
			<p class="pfooter"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			Copyright &copy;<script>document.write(new Date().getFullYear());</script> 
			All rights reserved | This template is made with 
			<i class="icon-heart" aria-hidden="true"></i> by 
			<a href="https://colorlib.com" target="_blank">Colorlib</a>
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
		</div>
			</aside> <!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
				<div class="container">
					<div class="row d-flex">
						<div class="col-lg-8 px-md-5 py-5">                                    
							<div class="row pt-md-4"><!-- form start /////////////-->
							                                   
<!-- ////////////////// title ##################/////////////////////////////// -->                                                                                                                                                                       
								<div class="blog-entry-2 ftco-animate">                                                                                        
									<div class="author mb-4 d-flex align-items-center">
										<a href="#" class="img" style="background-image:url(${cp}/resources/upload/${profileimg})"></a>
											<div class="mb-3" style="margin-top:20px;margin-left:20px;">${name}
											</div>
									</div>           
									<h1 style="width:700px;">${vo.stitle}</h1>                        
                                </div><div style="width:700px;">
								<img src="${pageContext.request.contextPath}/resources/upload/${vo.saveimg}"class="img-fluid">
								</div> 
								<h3>${vo.scontent}</h3>                           
<!-- ////////////////// title End ##################/////////////////////////////// -->  
         
<!-- ////////////////// tag start ##################/////////////////////////////// -->                          
		<div class="tag-widget post-tag-container mb-5 mt-5">
			<div class="tagcloud">
				<div class="icon-tag"/>
				<a href="#" class="">#Life</a>
				<a href="#" class="tag-cloud-link">#Sport</a>
				<a href="#" class="tag-cloud-link">#Tech</a>
				<a href="#" class="tag-cloud-link">#Travel</a>               
			</div>
		</div>                 

<!-- ///////////////////// 댓글리스트 //////////////////////////////////////// -->
		<div class="pt-5 mt-5">  
			<h3 class="mb-5 font-weight-bold">Comments</h3>        
			<c:forEach var="voa" items="${cvoa}" varStatus="status">           
			
			<c:if test="${voa.storynum == storynum }">
			
			                                     
				<ul class="comment-list">                                                                                       
					<li class="comment">                             
					<div class="vcard bio" style="width:50px;">
						<img src="${pageContext.request.contextPath}/resources/upload/${pname[status.index].profileimg}">
							${pname[status.index].name}
					</div>
					<div class="comment-body">
						<div>${voa.commcontent}<br>
							${voa.regdate}
							<a href="${pageContext.request.contextPath}/story/commentsDel" class="icon-trash"></a>
							<a href="${pageContext.request.contextPath}/story/commentsUpdate?storynum=${voa.storynum}&num=${sessionScope.num}" class="icon-update"></a>
						</div>        
                                                                                                   
<!--/////////////////// reply 답글 /////-->                                                                                   
						<input type="button" class="replyBtn ${status.index}" class="reply" value="Reply">                            
						<form class="replyForm ${status.index}" method="post" action="${pageContext.request.contextPath}/story/commentsReply?storynum=${voa.storynum}&num=${sessionScope.num}" style="display:none">                                                                                                                                                         
						<div>
							<c:forEach var="ccvo" items="${cvo}">
								<c:if test="${ccvo.commref == voa.commnum && ccvo.commref != ccvo.commnum}"> <!-- 자식댓글 -->
								<div>
								<div class="vcard bio" style="width:50px;">
								<img src="${pageContext.request.contextPath}/resources/upload/${usernameMap[ccvo.num]}">
								${usernameMapReal[ccvo.num]}
								</div>
								&nbsp; ${ccvo.commcontent} &nbsp;
									<a href="${pageContext.request.contextPath}/story/commentsDel" class="icon-trash"></a>
									<a href="${pageContext.request.contextPath}/story/commentsUpdate?storynum=${voa.storynum}&num=${sessionScope.num}" class="icon-update"></a>&nbsp; &nbsp; &nbsp; 
									${ccvo.regdate}
								</div>
								<br><br>
								</c:if>
								
							</c:forEach>                                  
						</div> 
						<div class="img" name="profileimg" style="background-image: ${profileimg};">${id} &nbsp; &nbsp;
							<input type="hidden" name="commnum" value="${voa.commnum }">
							<input type="text" name="commcontent" style="width:600px;height:80px;">
							<input type="submit" value="저장" class="reply">
							<input type="reset" value="취소" class="reply">         
						</div>                                                                                       
						</form>
<!--////////////////// reply 답글end /////-->      
					</div>  
					</li>                                           
				</ul>     
				
				
				</c:if>
				   
			</c:forEach><!--/////// END comment-list -->

<!-- Form Start /////////////////////////////////////////////////--> 
		<div class="comment-form-wrap pt-5">
			<h3 class="mb-5">댓글쓰기</h3>                        
			<form method="post" action="${pageContext.request.contextPath}/story/comments?storynum=${vo.storynum}&num=${sessionScope.num}" class="p-3 p-md-5 bg-light">
				<div class="form-group">
					<div class="author mb-4 d-flex align-items-center">					
							<div class="ml-3 info">
							<a href="#" class="img" style="background-image:url(${profileimg})"></a>
								<label for="num" >Name *</label> &nbsp;
								<label for="name" style="font-size:1.2em;">${sessionScope.id}</label>
							</div>
					</div>
				</div>                                 
				<div class="form-group">
					<label for="message">Message</label>
					<textarea name="commcontent" id="message" cols="30" rows="3" class="form-control"></textarea>
				</div>
				<div class="form-group">
					<input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
				</div>
			</form>
		</div>
		</div><!-- ///////////////////// 댓글리스트 END //////////////////////////////////////// -->
							</div> <!-- Form END /////////////////////////////////////////////////-->                                                 
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
	<script type="text/javascript" src="${cp}/resources/js/jquery-3.4.1.js"></script> 
	<script type="text/javascript">
	  $(function(){
	         var count=$(".replyBtn").size();         
	          for(var i=0;i<count;i++){
	                  $(".replyBtn."+i).click(function(){                        
	                                 $(this).next().slideToggle(100);
	                        
	                        
	                  });
	          }         
	  });                         
	</script>
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
  </body>
</html>