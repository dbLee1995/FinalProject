<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>코코아톡:: 이모티콘</title>
    <meta charset="UTF-8">
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <style type="text/css">
    	.linkIcon {
    		font-size: 40px;
    	}
    	.emoContainer {
    		display:flex;
    		flex-flow:column nowrap;
    		max-width:5000px;
    		margin-left:15%;
    		margin-right:2%;
    		padding:15px 0px 120px 0px;
    		background-color: #fbfbfb;
    	}
    	.emoHeadline {
    		display:flex;
    		flex-flow:row nowrap;
    		justify-content:space-between;
    		padding:100px 200px 10px 200px;
    	}
    	.emobox {
    		padding: 0px 100px 40px 130px;
    		max-width: 1700px;
    	}
    	.allView {
    		padding: 0px 110px 5px 0px;
    		align-self: last baseline;
    	}
    	.categoryBox {  
    		padding: 30px 15px 20px 15px;
    		margin-left: 50px;
    	}
    	.emo:hover {
    		border: 1px solid #a5a5a5;
    		box-shadow: 1px 1px 1px 1px #a5a5a5;
    	}
    </style>
</head>
<body>
  <div id="colorlib-page">
	<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
	  <aside id="colorlib-aside" role="complementary" class="js-fullheight" style="max-width: 250px;">
		<nav id="colorlib-main-menu" role="navigation">
		  <ul>
			<li><a href="${cp}/./">Home</a></li>
			  <c:choose>
				<c:when test="${empty sessionScope.id}">					
				  <li><a href="${pageContext.request.contextPath}/member/login">Login</a></li>		
				</c:when>	
				<c:otherwise>
				  <li><a href="${pageContext.request.contextPath}/story/list?num=${sessionScope.num}">Story</a></li>
				  <li><a href="${cp }/friends/list?num=${sessionScope.num}">Friends</a></li>			
				</c:otherwise>	 
			  </c:choose>
			<li><a href="${pageContext.request.contextPath}/ChatList?num=${sessionScope.num}&clnum=-1">WebSocket</a></li>
			<li class="colorlib-active"><a href="${cp }/emoShop/main">코코아 이모티콘</a></li>
			<li><a href="javascript:void(0);" onclick="showCalendar();">Calendar</a></li>
		  </ul>
		</nav>
		<div class="colorlib-footer">
	<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
		  <p class="pfooter">
	  	    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	  	  </p>
	  	</div>
	  </aside> <!-- END COLORLIB-ASIDE -->
	  
	  <section id="emoContainer" class="emoContainer">
	  	<div id="event" style="display:flex; flex-flow:row nowrap; text-align:center; justify-content:center; background-color:#4865A4;">
	  		<img src="${cp }/resources/images/emoShop/blue.png">
	  	</div>
		<article id="newEmo">
		  <div id="newEmoHeadline" class="emoHeadline">
			<h3>신규 이모티콘</h3>
			<a href="" class="allView">전체보기<span class="ion-ios-arrow-forward"></span></a>
		  </div>
		  <div class="emobox" style="display: inline-block;">
		  	<c:forEach items="${newEmoList }" var="vo">
		  	<div class="emo" style="display:inline-block;">
		  	  <a href="" style="display: flex; flex-flow: column nowrap; padding: 30px 40px 30px 40px;">
		  	  	<div style="padding:0px 0px 10px 0px;">
		  	      <img src="${cp }/resources/uploadImage/admin/emoticon/${vo.category }/${vo.name }/${vo.repreImg }" style="width:160px; height:160px;">
		  	    </div>
		  	    <span style="font-size:9px; color:royalblue;">신규</span>
		  	    <h5>${vo.name }</h5>
		  	    <span style="font-size:11px; color:gray;">${vo.category }</span>
		  	  </a>
		  	</div>
		  	</c:forEach>
		  </div>
		</article>
		<article id="populEmo" style="background-color: #ffffff">
		  <div id="populEmoHeadline" class="emoHeadline">
			<h3>인기 이모티콘</h3>
			<a href="" class="allView">전체보기<span class="ion-ios-arrow-forward"></span></a>
		  </div>
		  <div class="emobox" style="display:flex; justify-content: flex-start">
		  	<div class="emo" style="display:flex; flex-flow: column nowrap">
		  	  <c:forEach items="${populEmoList }" var="populVo" end="4" varStatus="s1">
		  	  <div style="display:flex; width: 500px; padding: 40px 0px 10px 0px; margin-left: 50px;">
		  	  	<h2 style="align-self:center;">${s1.count }</h3>
		  	    <img src="${cp }/resources/uploadImage/admin/emoticon/${populVo.category }/${populVo.name }/${populVo.repreImg }" style="width:140px; height:120px; padding: 0px 0px 0px 30px;">
		  	    <a href="" style="display: flex; flex-flow: column nowrap; padding: 30px 60px 30px 60px;">
		  	      <span style="font-size:9px; color:#dc3545;">인기!</span>
		  	      <h5>${populVo.name }</h5>
		  	      <span style="font-size:11px; color:gray;">${populVo.category }</span>
		  	    </a>
		  	  </div>
		  	  </c:forEach>
		  	</div>
		  	<div class="emo" style="display:flex; flex-flow: column nowrap">
		  	  <c:forEach items="${populEmoList }" var="populVo2" begin="5" varStatus="s2">
		  	  <div style="display:flex; width: 500px; padding: 40px 0px 10px 0px; margin-left: 100px;">
		  	  	<h2 style="align-self:center;">${s2.index+1 }</h3>
		  	    <img src="${cp }/resources/uploadImage/admin/emoticon/${populVo2.category }/${populVo2.name }/${populVo2.repreImg }" style="width:140px; height:120px; padding: 0px 0px 0px 30px;">
		  	    <a href="" style="display: flex; flex-flow: column nowrap; padding: 30px 60px 30px 60px;">
		  	      <span style="font-size:9px; color:#dc3545;">인기!</span>
		  	      <h5>${populVo2.name }</h5>
		  	      <span style="font-size:11px; color:gray;">${populVo2.category }</span>
		  	    </a>
		  	  </div>
		  	  </c:forEach>
		  	</div>
		  </div>
		</article>
		<article id="cotegory">
		  <div id="categoryHeadline" class="emoHeadline">
			<h3>스타일</h3>
			<a href="" class="allView">전체보기<span class="ion-ios-arrow-forward"></span></a>
		  </div>
		  <div class="emobox" style="display:flex; padding-top: 65px;">
		  	<a href="" class="categoryBox" style="border:1px solid rgb(236, 65, 65); width: 200px;">
		  		<span style="font-size: 18px; color: rgb(236, 65, 65);">#주제별</span><br>
		  		<span style="font-size: 18px; color: rgb(236, 65, 65);">#크리스마스</span><br><br><br><br>
				<span class="icon-arrow-right" style="color: rgb(236, 65, 65); font-size: 40px;"></span>
		  	</a>
		  	<c:forEach items="${category1 }" end="3" var="cate1">
		  	<div class="emo" style="display:inline-block;">
		  	  <a href="" style="display: flex; flex-flow: column nowrap; padding: 30px 40px 30px 40px;">
		  	  	<div style="padding:0px 0px 10px 0px;">
		  	      <img src="${cp }/resources/uploadImage/admin/emoticon/${cate1.category }/${cate1.name }/${cate1.repreImg }" style="width:160px; height:160px;">
		  	    </div>
		  	    <span style="font-size:9px; color:royalblue;">신규</span>
		  	    <h5>${cate1.name }</h5>
		  	    <span style="font-size:11px; color:gray;">${cate1.category }</span>
		  	  </a>
		  	</div>
		  	</c:forEach>
		  </div>
		  <div class="emobox" style="display:flex; padding-top: 65px;">
		  	<a href="" class="categoryBox" style="border:1px solid rgb(254, 149, 68); width: 200px;">
		  		<span style="font-size: 18px; color: rgb(254, 149, 68);">#동물</span><br>
		  		<span style="font-size: 18px; color: rgb(254, 149, 68);">#토끼</span><br><br><br><br>
				<span class="icon-arrow-right" style="color: rgb(254, 149, 68); font-size: 40px;"></span>
		  	</a>
		  	<c:forEach items="${category1 }" end="3" var="cate1">
		  	<div class="emo" style="display:inline-block;">
		  	  <a href="" style="display: flex; flex-flow: column nowrap; padding: 30px 40px 30px 40px;">
		  	  	<div style="padding:0px 0px 10px 0px;">
		  	      <img src="${cp }/resources/uploadImage/admin/emoticon/${cate1.category }/${cate1.name }/${cate1.repreImg }" style="width:160px; height:160px;">
		  	    </div>
		  	    <span style="font-size:9px; color:royalblue;">신규</span>
		  	    <h5>${cate1.name }</h5>
		  	    <span style="font-size:11px; color:gray;">${cate1.category }</span>
		  	  </a>
		  	</div>
		  	</c:forEach>
		  </div>
		  <div class="emobox" style="display:flex; padding-top: 65px;">
		  	<a href="" class="categoryBox" style="border:1px solid rgb(92, 184, 253); width: 200px;">
		  		<span style="font-size: 18px; color: rgb(92, 184, 253);">#분위기</span><br>
		  		<span style="font-size: 19px; color: rgb(92, 184, 253);">#고요한</span><br><br><br><br>
				<span class="icon-arrow-right" style="color: rgb(92, 184, 253); font-size: 40px;"></span>
		  	</a>
		  	<c:forEach items="${category1 }" end="3" var="cate1">
		  	<div class="emo" style="display:inline-block;">
		  	  <a href="" style="display: flex; flex-flow: column nowrap; padding: 30px 40px 30px 40px;">
		  	  	<div style="padding:0px 0px 10px 0px;">
		  	      <img src="${cp }/resources/uploadImage/admin/emoticon/${cate1.category }/${cate1.name }/${cate1.repreImg }" style="width:160px; height:160px;">
		  	    </div>
		  	    <span style="font-size:9px; color:royalblue;">신규</span>
		  	    <h5>${cate1.name }</h5>
		  	    <span style="font-size:11px; color:gray;">${cate1.category }</span>
		  	  </a>
		  	</div>
		  	</c:forEach>
		  </div>
		</article>
	  </section>
	  <footer style="font-size:11px; color:#636363; margin-left:15%; margin-right:2%; padding-bottom: 100px;">
	  	<center>
	  	  <span><b>카카오 이모티콘 스토어에서 판매되는 콘텐츠의 저작권은 제공처에 있으며, 이를 무단 이용하는 경우 저작권법 등에 따라 처벌될 수 있습니다.</b></span><br>
		  <span>상호: 주식회사 카카오, 대표자: 여민수, 조수용, 사업자등록번호: 120-81-47521, 사업자정보 확인 통신판매업신고번호: 제2012-제주아라-0011호</span><br>
		  <span>호스팅제공자: (주)카카오, 주소 : 제주특별자치도 제주시 첨단로 242(영평동), 고객센터 : 1577-3754<span><br>
		  <span>© kakao Corp.</span><br>
		  <span>중앙HTA 19-?? 파이널 프로젝트</span>
	  	</center>
	  </footer>
	  
	



<script type="text/javascript">

</script>

</body>
</html>