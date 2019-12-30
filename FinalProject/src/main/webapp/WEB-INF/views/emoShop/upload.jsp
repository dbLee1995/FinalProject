<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>코코아톡:: 이모티콘 업로드</title>
    
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

<link rel="stylesheet" href="${cp }/resources/css/page_cart.css"/>
<link rel="stylesheet" href="${cp }/resources/css/page_base.css"/>
<link rel="stylesheet" href="${cp }/resources/css/page_btn.css"/>

<style type="text/css">
	body {
		display: flex;
	}
</style>
<script src="${pageContext.request.contextPath }/resources/js/alarm1.js"></script>
<body>

  <div id="colorlib-page" style="width:15%; display:block;">
	<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
	  <aside id="colorlib-aside" role="complementary" class="js-fullheight" style="max-width: 250px; display:block;">
		<nav id="colorlib-main-menu" role="navigation">
		  <ul style="display:flex; flex-flow:column nowrap;">
			<c:choose>
			  <c:when test="${empty sessionScope.id}">					
			    <li><a href="${pageContext.request.contextPath}/member/login">Login</a></li>		
			  </c:when>	
			  <c:otherwise>	
			    <li><a href="${cp}/profiles/info?num=${sessionScope.num}">마이페이지</a></li>
				<li><a href="${pageContext.request.contextPath}/story/list?num=${sessionScope.num}">코코아 스토리</a></li>
				<li><a href="${cp }/friends/list?num=${sessionScope.num}">친구들</a></li>				
				<li><a href="${pageContext.request.contextPath}/ChatList?num=${sessionScope.num}&clnum=-1">채팅</a></li>
				<li class="colorlib-active"><a href="${cp }/emoShop/main">코코아 이모티콘</a>
				  <ul style="padding: 5px 0px 0px 15px;">
				    <li style="margin:0px;"><a href="${cp }/emoShop/basket" style="font-size:15px;">내 바구니</a></li><br>
				    <li style="margin:0px;"><a href="${cp }/emoShop/wishList" style="font-size:15px;">내 찜목록</a></li>
				    <li style="margin:0px;"><a href="${cp }/emoShop/uploadEmoFile" style="font-size:15px;">이모티콘 올리기</a>
				  </ul>
				</li>
				<li><a href="javascript:void(0);" onclick="showCalendar();">달력</a></li><br>
				<li><a href="${cp}/nquire/list?num=${sessionSope.num}">문의하기</a></li>
			  </c:otherwise>	 
			</c:choose>
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

<section id="fileUploadContainer">
	<div>
		<h1>이모티콘 모음을 올려주세요</h1>
	</div>
	<div>
		<form method="post" action="${cp }/emoShop/uploadEmoFile" enctype="multipart/form-data">
			<label for="category">카테고리</label> <br>
				<input type="text" name="category" id="category" required> <br>
			<label for="name">이모티콘 이름</label> <br>
				<input type="text" name="name" id="name" required> <br>
			<label for="price">가격</label> <br>
				<input type="number" name="price" id="price" required> <br>
			<label for="emoticonFile">파일</label> <br>
				<input type="file" name="file" id="file" multiple="multiple" required> <br>
			<button type="submit">전송</button>
		</form>
    </div>
    <div id="previewBox">

    </div>
</section>




    <script type="text/javascript">
    
    	// 카테고리 목록 표시·추가 기능 추가할 것
    	// 이모티콘 그룹명 중복 방지·알림 기능 방법 정하고 추가할 것(ajax/alert?)
    	// 전단에서 유효성 검사하는 것으로 충분한지 검토해볼 것
    
    	var priviewBox = document.getElementById("previewBox");
		document.getElementById("file").addEventListener("change", e => {
			clearPreviewImgBox();
			for(var i=0; i<e.target.files.length; i++) {
				var file = e.target.files[i];
				
				console.log(file);
				if(!checkExt(file.name)) {
					alert("jpg, jpeg, gif, png, webp 파일만 업로드 가능합니다.");
					clearPreviewImgBox();
					e.target.value = "";
					return;
				}
				
	            var reader = new FileReader();
	            reader.onload = ((e, data) => { return e => {
                		var previewImg = "<div class='imgPreview'><img src='" + e.target.result + "' title='" + escape(e.target.name) + "'/></div>"; // ['<div><img src="', e.target.result, '" title="', escape(theFile.name), '"/></div>'].join(''); 으로 .join() 활용도 가능
                		previewBox.innerHTML+=previewImg;
            		};
            	})(file);
	            reader.readAsDataURL(file);
			}
        });

		function checkExt(fileName) {
			var ext = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length); 
			console.log(ext);
			if(ext === 'jpg' || ext === 'jpeg' || ext === 'png' || ext === 'gif' || ext === 'webp' || ext === 'PNG') { // ===aivf, ===heif
				return true;
			} else {
				return false;
			}
		}
		
		function clearPreviewImgBox() {
			while(priviewBox.hasChildNodes()) {
				priviewBox.removeChild(priviewBox.firstChild);
			}
		}
	</script>
	
</body>
</html>