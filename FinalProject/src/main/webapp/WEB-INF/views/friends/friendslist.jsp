<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>코코아톡:: 내 친구</title>
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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <style type="text/css">
  
    #friendsprofile {text-align: center;color:white;height:670px;width: 120%;margin-left: -30px; position:relative; }
    #friendsprofile a{color:white;}
    #friendsprofile .img{margin-left: 75px;margin-top:280px;height: 120px;width: 120px;}
	#friendsprofile .backimg{height:100%;width: 100%; position:absolute;background-repeat: no-repeat;background-size: cover; filter:brightness(50%);}
	#friendsprofile .text{position: relative;}
    .col-md-12 .blog-entry.ftco-animate.d-md-flex a{height: 70px;width: 70px;}
    #friendsprofile hr{height: 0.5px;background-color: white; position: relative;}
     .col-md-12 {height: 90px;}
    #friendsprofile .frimenus{height: 100%;width: 30%;display: inline-block; text-align: center;position: relative;    margin-top: 25px;}
    #friendsprofile .frimenus .icon-message{font-size: 30px;}
	#friendsprofile .frimenus .icon-phone{font-size: 30px;}
	#friendsprofile .frimenus .icon-comments{font-size: 30px;}
	#friendsprofile .icon-star-o{font-size: 20px; margin-left: 30px;margin-top: 30px;}
	#friendsprofile .icon-star{font-size: 20px;margin-left: 30px;margin-top: 30px;}
    #friendsprofile .meta-wrap{position:relative;}
    .col-xl-4.sidebar .icon-people{font-size: 40px;color:#666666;margin-left: 270px;}
    .col-xl-4.sidebar .icon-star{font-size: 40px;color:#666666;margin-left: 30px; position: absolute;}
    .col-xl-4.sidebar .icon-plus{color:#666666; margin-bottom: 30px; position: absolute;}
    .container h2{font-family: "Poppins", Arial, sans-serif;color: rgba(180, 177, 177, 0.8);}
    .container h3{font-family: "Poppins", Arial, sans-serif;}
    </style>

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
							<li><a href="${pageContext.request.contextPath}/story/list?num=${sessionScope.num}">코코아 스토리</a></li>
							<li class="colorlib-active"><a href="${cp }/friends/list?num=${sessionScope.num}">친구들</a></li>
							<li><a href="${pageContext.request.contextPath}/ChatList?num=${sessionScope.num}&clnum=-1">채팅</a></li>
							<li><a href="${cp }/emoShop/main">코코아 이모티콘</a></li>
							<li><a href="javascript:void(0);" onclick="showCalendar();">달력</a></li>
							<li><a href="${cp}/qna/list">문의하기</a></li>
							<li><a href="${cp }/logout">로그아웃</a></li>
						</c:otherwise>	 
					</c:choose>
				</ul>
			</nav>

		</aside> <!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
	    	<div class="container">	    	
	    		<div class="row d-flex">
	    			<div class="col-xl-8 py-5 px-md-5">
	    			<c:set var="newfriends" value="false" />
	    			<c:forEach var="newfri" items="${list }">
					    		<c:if test="${not newfriends }">
				        <c:if test="${newfri.APPROV==2 }">
				        <div class="row pt-md-4" id="newfri">
							<h2>새로운친구</h2>
				            <c:set var="newfriends" value="true" />
				        </c:if>
				    </c:if>
						</c:forEach>
								<!-- 친구 div  -->
								<c:forEach var="newfri" items="${list }">
								<c:if test="${newfri.APPROV==2 }">
									<div class="col-md-12" >
										<div class="blog-entry ftco-animate d-md-flex">
											<a href="javascript:void(0);" onclick="showprofile(${sessionScope.num },${newfri.FNUM})" class="img img-2"
												style="background-image:url(${cp}/resources/upload/${newfri.PROFILEIMG});"></a>
											<div class="text text-2 pl-md-4">
												<c:choose>
														<c:when test="${empty newfri.MSG}">
														<h3 class="mb-2" style="margin-top: 15px;">
															<a href="single.html"  >${newfri.NAME}</a>
														</h3>
														</c:when>
														<c:otherwise>
															<h3 class="mb-2">
															<a href="single.html" >${newfri.NAME}</a>
															</h3>
															<p>${newfri.MSG }</p>
														</c:otherwise>
													</c:choose>							
												
												
												<div class="meta-wrap">
													<p class="meta"></p>
												</div>

											</div>
										</div>
									</div>
									</c:if>	
								</c:forEach>
					<c:set var="newfriendss" value="false" />
	    			<c:forEach var="newfri" items="${list }">
					    		<c:if test="${not newfriendss }">
				       			 <c:if test="${newfri.APPROV==2 }">
						        </div>
						        <hr>
						            <c:set var="newfriendss" value="true" />
						        </c:if>
				   				 </c:if>
						</c:forEach>
								
								
	    					
							<div class="row pt-md-4" id="frilist">
							<h2 >친구</h2>
								<!-- 친구 div  -->
								<c:forEach var="friends" items="${list }">
									<div class="col-md-12" >
										<div class="blog-entry ftco-animate d-md-flex">
											<a href="javascript:void(0);" onclick="showprofile(${sessionScope.num },${friends.FNUM})" class="img img-2"
												style="background-image:url(${cp}/resources/upload/${friends.PROFILEIMG});"></a>
											<div class="text text-2 pl-md-4">
												<c:choose>
														<c:when test="${empty friends.MSG}">
														<h3 class="mb-2" style="margin-top: 15px;">
															<a href="single.html"  >${friends.NAME}</a>
														</h3>
														</c:when>
														<c:otherwise>
															<h3 class="mb-2">
															<a href="single.html" >${friends.NAME}</a>
															</h3>
															<p>${friends.MSG }</p>
														</c:otherwise>
													</c:choose>							
												
												
												<div class="meta-wrap">
													<p class="meta"></p>
												</div>

											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<!-- END-->
						</div>
	    			<div class="col-xl-4 sidebar ftco-animate bg-light pt-5" style="height: 850px;padding: 20px;">
	    			<a href='javascript:void(0);' onclick='showfavorfri(${sessionScope.num});' class="icon-star"></a>
	    			<a href='javascript:void(0);' onclick='showAddfriends();' class="icon-people" ></a>
	    			<a href='javascript:void(0);' onclick='showAddfriends();' class="icon-plus"></a>
	            <div class="sidebar-box pt-md-4">
	              <form action="javascript:void(0);" class="search-form">
	              
	                <div class="form-group">
	                  <span class="icon icon-search"></span>
	                  <input type="text" class="form-control" placeholder="이름 검색" onkeyup="searchFri(this,${sessionScope.num})">
	                </div>
	              </form>
	            </div>
	            <div class="sidebar-box ftco-animate" id="friprofile" >
	            	
	            </div>

	          </div><!-- END COL -->
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
    <script type="text/javascript">
    function searchFri(e,num){
    	if(e.value==""){
    		location.reload();
    	}
    	$.ajax({
            type: "post",
            url: "${cp}/friends/searchlist",
            data: {
            	friname:e.value,
            	num:num
            },
            success: function (response) {
           	$("#newfri").remove();
			$(".col-md-12").remove();
            	$(response).each(function(){
            		var str="<div class='col-md-12'><div class='blog-entry ftco-animate d-md-flex fadeInUp ftco-animated'>"
        				+"<a href='javascript:void(0);' onclick='showprofile(${sessionScope.num },"+this.fnum+")' class='img img-2' style='background-image:url(${cp}/resources/upload/"+this.profileimg+");'></a>"
        				+"<div class='text text-2 pl-md-4'>"
        					+"<h3 class='mb-2'>"
        						+"<a href='single.html'>"+this.name+"</a>"
        					+"</h3>";
            		if(this.msg!=null){
        				str=str+"<p>"+this.msg+"</p>";
        			}else{
        				str=str+"<p style='margin-top:15%'></p>";
        			}
        			str=str   +"<div class='meta-wrap'>"
        						+"<p class='meta'></p>"
        					+"</div>"
        				+"</div>"
        			+"</div>"
        		+"</div>";
            		$("#frilist").append(str);
            		
            	});
            }
        });
    }
    function showprofile(num,fnum){
    	$.ajax({
            type: "post",
            url: "${cp}/friends/friprofile",
            data: {
            	num:num,
            	fnum:fnum
            },
            success: function (response) {
            	$("#friprofile").empty();
            	$(response).each(function(){
            		var str="<div id='friendsprofile' class='friendsprofile' ><div class='backimg' style='background-image:url(${cp}/resources/upload/"+this.backimg+");'></div><div class='blog-entry ftco-animate d-md-flex fadeInUp ftco-animated'>";
            		if(this.favo==0){
            			str=str+"<a href='javascript:void(0);' onclick='favo(${sessionScope.num },"+this.fnum+")' class='icon-star-o'></a><br>";
            		}else{
            			str=str+"<a href='javascript:void(0);' onclick='unfavo(${sessionScope.num },"+this.fnum+")' class='icon-star'></a><br>";
            		}
        			str=str	+"<a href='/fproject/story/list?num="+this.fnum+"' class='img img-2' style='background-image:url(${cp}/resources/upload/"+this.profileimg+");'></a>"
        				+"</div>"
        				+"<div class='text text-2 pl-md-4'>"
        					+"<h3 class='mb-2'>"
        						+"<a href='single.html'>"+this.name+"</a>"
        					+"</h3>";
        			if(this.msg!=null){
        				str=str+"<p>"+this.msg+"</p>";
        			}else{
        				str=str+"<p style='margin-top:15%'></p>";
        			}
        			str=str+"</div>"
        					+"<hr>"
        					+"<div class='meta-wrap'>"
        					+"<div class='frimenus' >"
        					+"<a href='${pageContext.request.contextPath}/CreateChat?num=${sessionScope.num}&fvalue="+this.fnum+"' class='icon-message'></a><br>"
        					+"<a href='${pageContext.request.contextPath}/CreateChat?num=${sessionScope.num}&fvalue="+this.fnum+"'>1:1 대화</a>"
        					+"</div>"		
        					+"<div class='frimenus'>"
        					+"<a href='#' class='icon-phone'></a><br>"
        					+"<a href='${pageContext.request.contextPath}/story/list?num=${friends.FNUM}''>무료통화</a>"
        					+"</div>"	
        					+"<div class='frimenus'>"
        					+"<a href='${pageContext.request.contextPath}/story/list?num="+this.fnum+"' class='icon-comments'></a><br>"
        					+"<a href='${pageContext.request.contextPath}/story/list?num="+this.fnum+"'>코코아 스토리</a>"
        					+"</div>"	
        				+"</div>"
        		+"</div>";
            		$("#friprofile").append(str);
            		
            	});
            }
        });
    }    
    	function favo(num,fnum){
        	$.ajax({
                type: "post",
                url: "${cp}/friends/favo",
                data: {
                	num:num,
                	fnum:fnum
                },
                success: function (response) {
                	$("#friprofile").empty();
                	$(response).each(function(){
                		var str="<div id='friendsprofile' class='friendsprofile' ><div class='backimg' style='background-image:url(${cp}/resources/upload/"+this.backimg+");'></div><div class='blog-entry ftco-animate d-md-flex fadeInUp ftco-animated'>";
                		if(this.favo==0){
                			str=str+"<a href='javascript:void(0);' onclick='favo(${sessionScope.num },"+this.fnum+")' class='icon-star-o'></a><br>";
                		}else{
                			str=str+"<a href='javascript:void(0);' onclick='unfavo(${sessionScope.num },"+this.fnum+")' class='icon-star'></a><br>";
                		}
            			str=str	+"<a href='/fproject/story/list?num="+this.fnum+"' class='img img-2' style='background-image:url(${cp}/resources/upload/"+this.profileimg+");'></a>"
            				+"</div>"
            				+"<div class='text text-2 pl-md-4'>"
            					+"<h3 class='mb-2'>"
            						+"<a href='single.html'>"+this.name+"</a>"
            					+"</h3>"
            					if(this.msg!=null){
                    				str=str+"<p>"+this.msg+"</p>";
            					}else{
            						str=str+"<p style='margin-top:15%'></p>";
                    			}
                    			str=str+"</div>"
            					+"<hr>"
            					+"<div class='meta-wrap'>"
            					+"<div class='frimenus' >"
            					+"<a href='${pageContext.request.contextPath}/CreateChat?num=${sessionScope.num}&fvalue="+this.fnum+"' class='icon-message'></a><br>"
            					+"<a href='${pageContext.request.contextPath}/CreateChat?num=${sessionScope.num}&fvalue="+this.fnum+"'>1:1 대화</a>"
            					+"</div>"		
            					+"<div class='frimenus'>"
            					+"<a href='#' class='icon-phone'></a><br>"
            					+"<a href='${pageContext.request.contextPath}/story/list?num=${friends.FNUM}''>무료통화</a>"
            					+"</div>"	
            					+"<div class='frimenus'>"
            					+"<a href='${pageContext.request.contextPath}/story/list?num="+this.fnum+"' class='icon-comments'></a><br>"
            					+"<a href='${pageContext.request.contextPath}/story/list?num="+this.fnum+"'>코코아 스토리</a>"
            					+"</div>"	
            				+"</div>"
            		+"</div>";
                		$("#friprofile").append(str);
                		
                	});
                }
            });
    	}
        	function unfavo(num,fnum){
            	$.ajax({
                    type: "post",
                    url: "${cp}/friends/unfavo",
                    data: {
                    	num:num,
                    	fnum:fnum
                    },
                    success: function (response) {
                    	$("#friprofile").empty();
                    	$(response).each(function(){
                    		var str="<div id='friendsprofile' class='friendsprofile' ><div class='backimg' style='background-image:url(${cp}/resources/upload/"+this.backimg+");'></div><div class='blog-entry ftco-animate d-md-flex fadeInUp ftco-animated'>";
                    		if(this.favo==0){
                    			str=str+"<a href='javascript:void(0);' onclick='favo(${sessionScope.num },"+this.fnum+")' class='icon-star-o'></a><br>";
                    		}else{
                    			str=str+"<a href='javascript:void(0);' onclick='unfavo(${sessionScope.num },"+this.fnum+")' class='icon-star'></a><br>";
                    		}
                			str=str	+"<a href='/fproject/story/list?num="+this.fnum+"' class='img img-2' style='background-image:url(${cp}/resources/upload/"+this.profileimg+");'></a>"
                				+"</div>"
                				+"<div class='text text-2 pl-md-4'>"
                					+"<h3 class='mb-2'>"
                						+"<a href='single.html'>"+this.name+"</a>"
                					+"</h3>"
                					if(this.msg!=null){
                        				str=str+"<p>"+this.msg+"</p>";
                					}else{
                						str=str+"<p style='margin-top:15%'></p>";
                        			}
                        			str=str+"</div>"
                					+"<hr>"
                					+"<div class='meta-wrap'>"
                					+"<div class='frimenus' >"
                					+"<a href='${pageContext.request.contextPath}/CreateChat?num=${sessionScope.num}&fvalue="+this.fnum+"' class='icon-message'></a><br>"
                					+"<a href='${pageContext.request.contextPath}/CreateChat?num=${sessionScope.num}&fvalue="+this.fnum+"'>1:1 대화</a>"
                					+"</div>"		
                					+"<div class='frimenus'>"
                					+"<a href='#' class='icon-phone'></a><br>"
                					+"<a href='${pageContext.request.contextPath}/story/list?num=${friends.FNUM}''>무료통화</a>"
                					+"</div>"	
                					+"<div class='frimenus'>"
                					+"<a href='${pageContext.request.contextPath}/story/list?num="+this.fnum+"' class='icon-comments'></a><br>"
                					+"<a href='${pageContext.request.contextPath}/story/list?num="+this.fnum+"'>코코아 스토리</a>"
                					+"</div>"	
                				+"</div>"
                		+"</div>";
                    		$("#friprofile").append(str);
                    		
                    	});
                    }
                });
            
    }
        	function showfavorfri(num){
        		
            	$.ajax({
                    type: "post",
                    url: "${cp}/friends/favorfri",
                    data: {
                    	num:num
                    },
                    success: function (response) {
                    	$("#newfri").remove();
            			$(".col-md-12").remove();
                        	$(response).each(function(){
                        		var str="<div class='col-md-12'><div class='blog-entry ftco-animate d-md-flex fadeInUp ftco-animated'>"
                    				+"<a href='javascript:void(0);' onclick='showprofile(${sessionScope.num },"+this.fnum+")' class='img img-2' style='background-image:url(${cp}/resources/upload/"+this.profileimg+");'></a>"
                    				+"<div class='text text-2 pl-md-4'>"
                    					+"<h3 class='mb-2'>"
                    						+"<a href='single.html'>"+this.name+"</a>"
                    					+"</h3>";
                        		if(this.msg!=null){
                    				str=str+"<p>"+this.msg+"</p>";
                    			}else{
                    				str=str+"<p style='margin-top:15%'></p>";
                    			}
                    			str=str   +"<div class='meta-wrap'>"
                    						+"<p class='meta'></p>"
                    					+"</div>"
                    				+"</div>"
                    			+"</div>"
                    		+"</div>";
                        		$("#frilist").append(str);
                        		
                        	});
                    }
                });
            
    }
        
        	
        	
  	function showCalendar(){
  		window.open("${cp}/calendar", "[캘린더]", "width=900, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no" );    
  	};
  	function showAddfriends(){
  		window.open("${cp}/friends/addfriends", '[친구추가]', 'width=400, height=460, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no' );    
  	};
  </script>
  </body>
</html>

