<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    		padding:15px;
    	}
    	.emoHeadline {
    		display:flex;
    		flex-flow:row nowrap;
    		justify-content:space-between;
    		padding:100px 200px 10px 200px;
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
			<li class="colorlib-active"><a href="${cp }/emoShop/main">이모티콘(원래 위치는 about.html)</a></li>
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
	  	<div id="event" style="display:flex; flex-flow:row nowrap; text-align:center; justify-content:center;">
	  		<img src="${cp }/resources/images/emoShop/blue.png">
	  	</div>
		<article>
		  <div id="newEmo" class="emoHeadline">
			<h3>신규 이모티콘</h3>
			<a href="">전체보기<span class="ion-ios-arrow-forward"></span></a>
		  </div>
		  <div class="emobox">
		  	<c:forEach items="${newList }" var="vo">
		  	<div style="display:inline-block;">
		  	  <a href="" style="display: block;">
		  	    <img src="${cp }/resources/uploadImage/admin/emoticon/${vo.category }/${vo.name }/${vo.repreImg }">
		  	    <span style="font-size:9px; color:royalblue;">new</span>
		  	    <h5>${vo.name }</h5>
		  	    <span style="font-size:10px; color:gray;">${vo.category }</span>
		  	  </a>
		  	</div>
		  	</c:forEach>
		  </div>
		</article>
		<article>
		  <div id="populEmo" class="emoHeadline">
			<h3>인기 이모티콘</h3>
			<a href="">전체보기<span class="ion-ios-arrow-forward"></span></a>
		  </div>
		  인기 이모티콘
		</article>
		<article>
		<article id="cotegory" class="emoHeadline">
			<h3>스타일</h3>
			<a href="">전체보기<span class="ion-ios-arrow-forward"></span></a>
		</article>
		  카테고리
		</article>
	  </section>
	  
	<!--
		<div id="colorlib-main" style="width:100%;">
		  <section class="ftco-section ftco-no-pt ftco-no-pb">
	    	<div class="container" style="max-width:1400px; margin-right:0px;">
	    	  <div class="row d-flex">
	    		 <div class="col-xl-8 py-5 px-md-5" id="emoListContainer">
	<!--  /////////////     START     /////////////  -->
	<!--
	    		    <div class="row pt-md-4">
			          <div class="col-md-12">
				        <div class="blog-entry d-md-flex">
				          <a href="single.html" class="img img-2" style="background-image: url(images/image_1.jpg);"></a>
							<div class="text text-2 pl-md-4">
				              <h3 class="mb-2"><a href="single.html">A Loving Heart is the Truest Wisdom</a></h3>
				              <p class="mb-4">1. 파일명을 클래스명.java로 저장하기
				              <p class="mb-4">2. 컴파일하기 - C:\java>javac Test01.java</p>
				              <p class="mb-4">3. 실행하기 - C:\java>java Test01</p>
				              <p class="mb-4">반갑습니다.</p>
				              <p class="mb-4"> 6개월동안 열심히 해요!</p>
				              <p><a href="${pageContext.request.contextPath }/member/register" class="btn-custom">회원가입<span class="ion-ios-arrow-forward"></span></a></p>
				              <section title="navigationBar">
								<a href="${cp}/emoShop/wishList">좋아요</a>
								<a href="${cp}/emoShop/basket">바구니</a>
							  </section>
							</div>
				  		  </div>
					    </div>
			  		  </div>
			  		</div>
			  		</div>
			  		  </div>
			  		  </section>
			  		  </div>
	-->
					
	<!--  /////////////     END     /////////////  -->
	<!-- 
			  </div>
			  <div class="col-xl-4 sidebar bg-light pt-5">
			  	<div class="sidebar-box">
			  	  <div class="emoShopNavIcon">
			  		<a href="" title="찜 목록으로 이동"><i class="icon-shopping-cart" style="font-size:50px;"></i></a>
			  		<a href="" title="바구니로 이동"><i class="icon-heart" style="font-size:50px;"></i></a>
			  	  </div>
			  	</div>
	            <div class="sidebar-box pt-md-4">
	              <form action="#" class="search-form">
	                <div class="form-group">
	                  <span class="icon icon-search"></span>
	                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
	                </div>
	              </form>
	            </div>
	            <a href=""><img src=""></a>
	            <div class="sidebar-box">
	            	<h3 class="sidebar-heading">Categories</h3>
	              <ul class="categories">
	                <li><a href="#">Fashion <span>(6)</span></a></li>
	                <li><a href="#">Technology <span>(8)</span></a></li>
	                <li><a href="#">Travel <span>(2)</span></a></li>
	                <li><a href="#">Food <span>(2)</span></a></li>
	                <li><a href="#">Photography <span>(7)</span></a></li>
	              </ul>
	            </div>

	            <div class="sidebar-box">
	              <h3 class="sidebar-heading">Tag Cloud</h3>
	              <ul class="tagcloud">
	                <a href="#" class="tag-cloud-link">animals</a>
	                <a href="#" class="tag-cloud-link">human</a>
	                <a href="#" class="tag-cloud-link">people</a>
	                <a href="#" class="tag-cloud-link">cat</a>
	                <a href="#" class="tag-cloud-link">dog</a>
	                <a href="#" class="tag-cloud-link">nature</a>
	                <a href="#" class="tag-cloud-link">leaves</a>
	                <a href="#" class="tag-cloud-link">food</a>
	              </ul>
	            </div>
	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Paragraph</h3>
	              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut.</p>
	            </div>
	          </div>
	          <!-- END COL -->
	          <!-- 
	        </div>
	      </div>
	    </section>
	  </div>
	  -->
	  <!-- END COLORLIB-MAIN -->
	 <!-- 
	</div>
	<!-- END COLORLIB-PAGE -->
	
	
    <!--
	<footer>
		<ul class="article-list__pagination article-list__pagination--inactive" id="article-list-pagination"></ul>
	</footer>
	-->



<script type="text/javascript">


/**
 * 
 *
 * Implement infinite scrolling
 * - Inspired by: http://ravikiranj.net/drupal/201106/code/javascript/how-implement-infinite-scrolling-using-native-javascript-and-yui3
 */
 
 
 
 var count = 1;
 var ele0 = document.getElementById('emoListContainer');
 var options = {
		  distance: 50,
		  callback: function(done) {
			var xhr = new XMLHttpRequest();
			xhr.open('post', '${cp}/emoShop/main');
			xhr.onreadystatechange = function() {
				if(xhr.status === 200 && xhr.readyState === 4) {
					var dataList = JSON.parse(xhr.responseText);
					console.log(dataList);
					count += 5;
					for(var i=0; i<dataList.length; i++) {
						console.log(dataList[i].emogName);
						var ele8 = document.createElement('p');
						ele8.className = 'mb-4';
						ele8.innerHTML = '<i class="icon-shopping-cart linkIcon"></i><span>&nbsp;&nbsp;&nbsp;</span><i class="icon-heart linkIcon"></i>';
						var ele7 = document.createElement('p');
						ele7.className = 'mb-4';
						ele7.innerHTML = dataList[i].emogPrice;
						var ele6 = document.createElement('h3');
						ele6.className = 'mb-2';
						ele6.innerHTML = dataList[i].emogName;
						var ele5 = document.createElement('div');
						ele5.className = 'text text-2 pl-md-4';
						var ele4 = document.createElement('a');
						ele4.className = 'img img-2';
						ele4.style.backgroundImage = 'url(${cp}/resources/uploadImage/admin/emoticon/' + dataList[i].emogCategory + '/' + dataList[i].emogName + '/' + dataList[i].emogRepreImg + ')';
						var ele3 = document.createElement('div');
						ele3.className = 'blog-entry d-md-flex';
						var ele2 = document.createElement('div');
						ele2.className = 'cal-md-12';
						var ele1 = document.createElement('div');
						ele1.className = 'row pt-md-4';
						
						ele5.append(ele6);
						ele5.append(ele7);
						ele5.append(ele8);
						
						ele3.append(ele4);
						ele3.append(ele5);
						
						ele2.append(ele3);
						ele1.append(ele2);
						ele0.append(ele1)
					}
				}
			}
			xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhr.send('count=' + count);
		    done();
		  }
		};
 
 

</script>

</body>
</html>