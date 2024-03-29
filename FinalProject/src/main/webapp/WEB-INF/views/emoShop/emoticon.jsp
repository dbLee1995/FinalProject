<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>코코아톡:: 이모티콘</title>
    <meta charset="UTF-8">
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
	left: 40px;
	bottom: 0px;
	padding: 4px 4px 0px 4px;
	border-radius: 40px;
	border: 1px solid #ddd;
	background-color: white;
	width: 50px;
	height: 50px;
	margin-right:10px;
}

.emoBasketBtn:hover {
	border: 1px solid #43c7ff;
	box-shadow: 0px 0px 10px 0px #43c7ff;
	transition: border 0.3s, box-shadow 0.3s;
}

.emoWishBtn {
	left: 40px;
	bottom: 0px;
	padding: 4px 4px 0px 4px;
	border-radius: 40px;
	border: 1px solid #ddd;
	background-color: white;
	width: 50px;
	height: 50px;
}

.emoWishBtn:hover {
	border: 1px solid #43c7ff;
	box-shadow: 0px 0px 10px 0px #43c7ff;
	transition: border 0.2s, box-shadow 0.3s;
}

.buyBtn {
	padding: 7px 15px;
	border: 1px solid #e5e5e5;
	appearance: unset;
	outline: none;
	border-radius: 70px;
	font-size: 18px;
	margin-right:40px;
	background-color: #333333;
	color: #43c7ff;
}
.buyBtn:hover {
	background-color: #43c7ff;
	color: #333333;
}

</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/alarm2.js"></script>
</head>
<body>
  <div id="colorlib-page">
	<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
	  <aside id="colorlib-aside" role="complementary" class="js-fullheight" style="max-width: 250px;">
		<nav id="colorlib-main-menu" role="navigation">
		  <ul>
			<li><a href="${cp}/profiles/info?num=${sessionScope.num}">마이페이지</a></li>
			<li><a href="${pageContext.request.contextPath}/story/list?num=${sessionScope.num}">코코아 스토리</a></li>
			<li><a href="${cp }/friends/list?num=${sessionScope.num}">친구들</a></li>			
			<li><a href="${pageContext.request.contextPath}/ChatList?num=${sessionScope.num}&clnum=-1">채팅</a></li>
			<li class="colorlib-active"><a href="${cp }/emoShop/main">코코아 이모티콘</a>
			  <ul style="padding: 5px 0px 0px 15px; display:flex; flex-flow:column wrap;"">
				<li style="margin:0px;"><a href="${cp }/emoShop/basket" style="font-size:15px;">내 바구니</a></li>
				<li style="margin:0px;"><a href="${cp }/emoShop/wishList" style="font-size:15px;">내 찜목록</a></li>
			  </ul>
			</li>
			<li><a href="javascript:void(0);" onclick="showCalendar();">달력</a></li>
			<li><a href="${cp}/nquire/list?num=${sessionSope.num}">문의하기</a></li>
			<li><a href="${cp }/logout">로그아웃</a>
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
	  	
		<article id="emoDetail" style="background-color: #ffffff">
		  <div class="emobox" style="display:flex; justify-content: flex-start; padding:100px 100px 0px 200px;">
		    <div class="emo" style="display:flex; padding: 40px 25px 10px 25px; margin-left: 75px; width:90%;" data-name="${vo.name }">
		  	  <img src="${cp }/resources/uploadImage/admin/emoticon/${vo.category }/${vo.name }/${vo.repreImg }" style="width:260px; height:260px; padding: 0px;">
		  	    <div style="display:flex; flex-flow:column nowrap; padding:0px 0px 0px 100px; width: 80%">
		  	      <span style="font-size:11px; color:#dc3545;">인기!</span>
		  	      <h1>${vo.name }</h1>
		  	      <span style="font-size:16px; color:dimgrey;">${vo.category }</span>
		  	      <div style="display:flex; font-size:20px; padding:30px 0px 30px 0px;">
		  	        <span><b>${vo.price }</b></span><span>&nbsp;원</span>
		  	      </div>
		  	      <div style="display:flex; align-items:center; justify-content:flex-start; padding:0px 0px 0px 0px; width: 100%;">
		  	        <button type="button" id="buyBtn" class="buyBtn" data-value="${vo.emognum }">&nbsp;&nbsp;&nbsp;&nbsp;구매하기&nbsp;&nbsp;&nbsp;&nbsp;</button>
		  	        <c:if test="${empty purchaseMap[vo.emognum]}">
		  	        <button type="button" title="해당 이모티콘을 바구니에 담습니다." data-value="${vo.emognum }" data-check="0" class="emoBasketBtn jsEmoBtn"><i class="icon-shopping-cart linkIcon" style="font-size:18px;" data-value="${vo.emognum }" data-check="0"></i></button>
		  	        <button type="button" title="해당 이모티콘을 찜 목록에 추가합니다." data-value="${vo.emognum }" data-check="0" class="emoWishBtn jsEmoBtn"><i class="icon-heart linkIcon" style="font-size:15px;" data-value="${vo.emognum }" data-check="0"></i></button>
		  	        </c:if>
		  	      </div>
		  	    </div>
		    </div>
		  </div>
		</article>
		<article title="emoticon" style="background-color:#ffffff;">
		  <div class="emobox" style="display:flex; flex-flow:row wrap; padding:65px 65px 100px 150px;">
		  	<c:forEach items="${list }" var="emo" varStatus="emoStatus">
		  	<div class="emo" style="display:inline-block;">
		  	  <div style="padding:10px;">
		  	      <img src="${cp }/resources/uploadImage/admin/emoticon/${vo.category }/${vo.name }/${emo.emosaveimg }" style="width:160px; height:160px;">
		  	  </div>
		  	</div>
		  	</c:forEach>
		  </div>
		</article>
		<div style="width:100%; margin:auto; padding:30px; background-color:#ffffff;">
		  <hr>
		</div>
		<article title="anotherEmoticon">
		  <h2 style="padding:150px 0px 0px 180px;">관련 이모티콘</h2>
		  <div class="emobox" style="display:flex; padding-top: 65px;">
		  	<a href="${cp }/emoShop/category?c=${vo.category}" class="categoryBox" style="border:1px solid rgb(254, 149, 68); width: 200px;">
		  		<span style="font-size: 18px; color: rgb(254, 149, 68);">#${vo.category }</span><br>
		  		<span style="font-size: 18px; color: rgb(254, 149, 68);">#비슷한</span><br><br><br><br>
				<span class="icon-arrow-right" style="color: rgb(254, 149, 68); font-size: 40px;"></span>
		  	</a>
		  	<c:forEach items="${category }" end="3" var="cate" varStatus="cateStatus">
		  	<div class="emo" style="display:inline-block;">
		  	  <a href="${cp }/emoShop/emoticon?emognum=${cate.emognum}" style="display: flex; flex-flow: column nowrap; padding: 30px 40px 30px 40px;">
		  	  	<div style="padding:0px 0px 10px 0px;">
		  	      <img src="${cp }/resources/uploadImage/admin/emoticon/${cate.category }/${cate.name }/${cate.repreImg }" style="width:160px; height:160px;">
		  	    </div>
		  	    <div>
		  	      <span style="font-size:9px; color:royalblue;">신규</span>
		  	      <h5>${cate.name }</h5>
		  	      <span style="font-size:11px; color:dimgrey;">${cate.category }</span>
		  	  	</div>
		  	  </a>
		  	</div>
		  	</c:forEach>
		  </div>
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

	function putBasket(e) {
		console.log(e.target);
		var xhr = new XMLHttpRequest();
		xhr.open('post', '${cp}/emoShop/putBasket');
		xhr.onreadystatechange = function() {
			if(xhr.status === 200 && xhr.readyState === 4) {
				var data = JSON.parse(xhr.responseText);
				if(e.target.dataset.check == 0) {
					e.target.dataset.check = 1;
					e.target.style.color = '#333333';
				}
				alert(data.text);
			}
		}
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		xhr.send('emognum=' + e.target.dataset.value + '&check=' + e.target.dataset.check);
	}

	function putWish(e) {
		console.log(e.target);
		var xhr = new XMLHttpRequest();
		xhr.open('post', '${cp}/emoShop/putWish');
		xhr.onreadystatechange = function() {
			if(xhr.status === 200 && xhr.readyState === 4) {
				var data = JSON.parse(xhr.responseText);
				if(e.target.dataset.check == 0) {
					e.target.dataset.check = 1;
					e.target.style.color = '#333333';
				}
				alert(data.text);
			}
		}
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
		xhr.send('emognum=' + e.target.dataset.value + '&check=' + e.target.dataset.check);
	}

	var basketBtnList = document.querySelectorAll('.emoBasketBtn');
	var wishBtnList = document.querySelectorAll('.emoWishBtn');

	basketBtnList.forEach((value, number, listObj) => {
		value.addEventListener('click', putBasket, true);
	});
	wishBtnList.forEach((value, number, listObj) => {
		value.addEventListener('click', putWish, true);
	});
	
	document.getElementById('buyBtn').addEventListener('click', e => {
        var xhr = new XMLHttpRequest();
        xhr.open('post', '${cp}/emoShop/purchaseOne');
        xhr.onreadystatechange = function() {
            if(xhr.status === 200 && xhr.readyState === 4) {
                alert(xhr.responseText);
            }
        }
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
        xhr.send('emognum=' + e.target.dataset.value);
	});

</script>
</body>
</html>