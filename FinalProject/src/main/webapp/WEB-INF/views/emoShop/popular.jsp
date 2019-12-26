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
	color: #1eafed;
}

.emoContainer {
	display: flex;
	flex-flow: column nowrap;
	max-width: 5000px;
	margin-left: 15%;
	margin-right: 2%;
	padding: 15px 0px 120px 0px;
	background-color: #fbfbfb;
}

.emoHeadline {
	display: flex;
	flex-flow: row nowrap;
	justify-content: space-between;
	padding: 100px 200px 10px 200px;
}

.emobox {
	padding: 0px 100px 40px 130px;
	max-width: 1700px;
}

.emo:hover {
	box-shadow: 0px 0px 1px 1px #ccc;
}

.allView {
	padding: 0px 110px 5px 0px;
	align-self: last baseline;
}

.categoryBox {
	padding: 30px 15px 20px 15px;
	margin-left: 50px;
	margin-right: 10px;
}

.emoBasketBtn {
	display: none;
	position: relative;
	left: 40px;
	bottom: 0px;
	padding: 4px 4px 0px 4px;
	border-radius: 40px;
	border: 1px solid #ddd;
	background-color: white;
	width: 35px;
	height: 35px;
}

.emoBasketBtn:hover {
	border: 1px solid #43c7ff;
	box-shadow: 0px 0px 10px 0px #43c7ff;
	transition: border 0.3s, box-shadow 0.3s;
}

.emoWishBtn {
	display: none;
	position: relative;
	left: 40px;
	bottom: 0px;
	padding: 4px 4px 0px 4px;
	border-radius: 40px;
	border: 1px solid #ddd;
	background-color: white;
	width: 35px;
	height: 35px;
}

.emoWishBtn:hover {
	border: 1px solid #43c7ff;
	box-shadow: 0px 0px 10px 0px #43c7ff;
	transition: border 0.2s, box-shadow 0.3s;
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
			<li class="colorlib-active"><a href="${cp }/emoShop/main">코코아 이모티콘</a>
				<ul style="padding: 5px 0px 0px 15px;">
					<li style="margin:0px;"><a href="${cp }/emoShop/basket" style="font-size:15px;">내 바구니</a></li>
					<li style="margin:0px;"><a href="${cp }/emoShop/wishList" style="font-size:15px;">내 찜목록</a></li>
				</ul>
			</li>
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
	</div>
	  
	  <section id="emoContainer" class="emoContainer">
	  	<div id="event" style="display:flex; flex-flow:row nowrap; text-align:center; justify-content:center;">
	  		<img src="${cp }/resources/images/emoShop/blue.png">
	  	</div>
	  	
		<article id="populEmo" style="background-color: #ffffff">
		  <div id="populEmoHeadline" class="emoHeadline">
			<h1>인기 이모티콘</h1>
			<hr>
		  </div>
		  <div class="emobox" style="display:flex; justify-content: flex-start">
		  	<div style="display:flex; flex-flow: column nowrap">
		  	  <c:forEach items="${list }" var="vo" end="4" varStatus="s1">
		  	  <div class="emo" style="display:flex; width: 500px; padding: 40px 0px 10px 25px; margin-left: 75px;" data-name="popul" data-popul-index="${s1.index }">
		  	  	<a href="${cp }/emoShop/emoticon?emognum=${vo.emognum}" style="display: flex; flex-flow: row nowrap;">
		  	  	  <h2 style="align-self:center;">${s1.count }</h2>
		  	      <img src="${cp }/resources/uploadImage/admin/emoticon/${vo.category }/${vo.name }/${vo.repreImg }" style="width:140px; height:120px; padding: 0px 0px 0px 30px;">
		  	    </a>
		  	    <a href="${cp }/emoShop/emoticon?emognum=${vo.emognum}" style="display: flex; flex-flow: column nowrap; padding: 30px 20px 30px 60px;"> 
		  	      <span style="font-size:9px; color:#dc3545;">인기!</span>
		  	      <h5>${vo.name }</h5>
		  	      <span style="font-size:11px; color:dimgrey;">${vo.category }</span>
		  	    </a>
		  	      <button type="button" title="해당 이모티콘을 바구니에 담습니다." data-value="${vo.emognum }" data-popul-index="${s1.index }" class="emoBasketBtn jsEmoBtn" style="left:35px; top:90px;"><i class="icon-shopping-cart linkIcon" style="font-size:18px;"></i></button>
		  	      <button type="button" title="해당 이모티콘을 찜 목록에 추가합니다." data-value="${vo.emognum }" data-popul-index="${s1.index }" class="emoWishBtn jsEmoBtn" style="left:40px; top:90px;"><i class="icon-heart linkIcon" style="font-size:15px;"></i></button>
		  	  </div>
		  	  </c:forEach>
		  	</div>
		  	<div style="display:flex; flex-flow: column nowrap">
		  	  <c:forEach items="${list }" var="vo2" begin="5" varStatus="s2">
		  	  <div class="emo" style="display:flex; width: 500px; padding: 40px 0px 10px 25px; margin-left: 75px;" data-name="popul" data-popul-index="${s2.index+5 }">
		  	  	<a href="${cp }/emoShop/emoticon?emognum=${vo2.emognum}" style="display: flex; flex-flow: row nowrap;">  
		  	  	  <h2 style="align-self:center;">${s2.count+5 }</h2>
		  	      <img src="${cp }/resources/uploadImage/admin/emoticon/${vo2.category }/${vo2.name }/${vo2.repreImg }" style="width:140px; height:120px; padding: 0px 0px 0px 30px;">
		  	    </a>
		  	    <a href="${cp }/emoShop/emoticon?emognum=${vo2.emognum}" style="display: flex; flex-flow: column nowrap; padding: 30px 20px 30px 60px;">
		  	      <span style="font-size:9px; color:#dc3545;">인기!</span>
		  	      <h5>${vo2.name }</h5>
		  	      <span style="font-size:11px; color:dimgrey;">${vo2.category }</span>
		  	    </a>
		  	      <button type="button" title="해당 이모티콘을 바구니에 담습니다." data-value="${vo2.emognum }" data-popul-index="${s2.index+5 }" class="emoBasketBtn jsEmoBtn" style="left:35px; top:90px;"><i class="icon-shopping-cart linkIcon" style="font-size:18px;"></i></button>
		  	      <button type="button" title="해당 이모티콘을 찜 목록에 추가합니다." data-value="${vo2.emognum }" data-popul-index="${s2.index+5 }" class="emoWishBtn jsEmoBtn" style="left:40px; top:90px;"><i class="icon-heart linkIcon" style="font-size:15px;"></i></button>
		  	  </div>
		  	  </c:forEach>
		  	</div>
		  </div>
		  <button type="button" id="moreBtn" data-index="2" style="width:100%; padding:5px; text-align:center">이모티콘 더 보기</button>
		</article>
	  </section>
	  <footer style="font-size:11px; color:#636363; margin-left:15%; margin-right:2%; padding-bottom:100px; text-align:center;">
	  	<div>
	  	  <span><b>카카오 이모티콘 스토어에서 판매되는 콘텐츠의 저작권은 제공처에 있으며, 이를 무단 이용하는 경우 저작권법 등에 따라 처벌될 수 있습니다.</b></span><br>
		  <span>상호: 주식회사 카카오, 대표자: 여민수, 조수용, 사업자등록번호: 120-81-47521, 사업자정보 확인 통신판매업신고번호: 제2012-제주아라-0011호</span><br>
		  <span>호스팅제공자: (주)카카오, 주소 : 제주특별자치도 제주시 첨단로 242(영평동), 고객센터 : 1577-3754</span><br>
		  <span>© kakao Corp.</span><br>
		  <span>중앙HTA 19-?? 파이널 프로젝트</span>
	  	</div>
	  </footer>
	  

<script type="text/javascript">

	var btnList = document.querySelectorAll('div[data-name="popul"]');
	btnList.forEach((value, number, listObj) => {
		value.addEventListener('mouseover', e => {
			var btn = document.querySelectorAll('div.emo button[data-popul-index="' + value.dataset.populIndex + '"]');
			btn[0].style.display = 'inline-block';
			btn[1].style.display = 'inline-block';
		});
		value.addEventListener('mouseout', e => {
			var btn = document.querySelectorAll('div.emo button[data-popul-index="' + value.dataset.populIndex + '"]');
			btn[0].style.display = 'none';
			btn[1].style.display = 'none';
		});
	});
	
	var moreBtn = document.getElementById('moreBtn');
	moreBtn.addEventListener('click', e => {
        var xhr = new XMLHttpRequest();
        xhr.open('post', '${cp}/emoShop/popular');
        xhr.onreadystatechange = function() {
            if(xhr.status === 200 && xhr.readyState === 4) {
                
            }
        }
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
        xhr.send('thisPage=' + e.target.dataset.Index)
    });

	function putBasket(e) {
		var xhr = new XMLHttpRequest();
		xhr.open('post', '${cp}/emoShop/putBasket');
		xhr.onreadystatechange = function() {
			if(xhr.status === 200 && xhr.readyState === 4) {
				alert(xhr.responseText);
			}
		}
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		xhr.send('emognum=' + e.target.dataset.value);
	}
	
	function putWish(e) {
		var xhr = new XMLHttpRequest();
		xhr.open('post', '${cp}/emoShop/putWish');
		xhr.onreadystatechange = function() {
			if(xhr.status === 200 && xhr.readyState === 4) {
				alert(xhr.responseText);
			}
		}
	}
	
	var basketBtnList = document.querySelectorAll('.emoBasketBtn');
	var wishBtnList = document.querySelectorAll('.emoWishBtn');
	
	basketBtnList.forEach((value, number, listObj) => {
		value.addEventListener('click', putBasket);
	});
	wishBtnList.forEach((value, number, listObj) => {
		value.addEventListener('click', putWish);
	});

</script>
</body>
</html>