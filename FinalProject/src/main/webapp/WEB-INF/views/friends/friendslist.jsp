<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Andrea - Free Bootstrap 4 Template by Colorlib</title>
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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <style type="text/css">
  
    #friendsprofile {text-align: center;color:white;height:670px;width: 120%;margin-left: -30px; position:relative; }
    #friendsprofile a{color:white;}
    #friendsprofile .img{margin-left: 80px;margin-top:280px;height: 120px;width: 120px;}
	#friendsprofile .backimg{height:100%;width: 100%; position:absolute;background-repeat: no-repeat;background-size: cover; filter:brightness(50%);}
	#friendsprofile .text{position: relative;}
    .col-md-12 .blog-entry.ftco-animate.d-md-flex a{height: 70px;width: 70px;}
    #friendsprofile hr{height: 0.5px;background-color: white; position: relative;}
    #friendsprofile .frimenus{height: 100%;width: 30%;display: inline-block; text-align: center;position: relative;    margin-top: 25px;}
    #friendsprofile .frimenus .icon-message{font-size: 30px;}
	#friendsprofile .frimenus .icon-phone{font-size: 30px;}
	#friendsprofile .frimenus .icon-comments{font-size: 30px;}
	#friendsprofile .icon-star-o{font-size: 20px; margin-left: 30px;margin-top: 30px;}
	#friendsprofile .icon-star{font-size: 20px;margin-left: 30px;margin-top: 30px;}
    #friendsprofile .meta-wrap{position:relative;}
    </style>
  </head>
  <body>

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight">
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li class="colorlib-active"><a href="${cp}/./">Home</a></li>
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
					<li><a href="${cp }/emoShop">이모티콘(원래 위치는 about.html)</a></li>
					<li><a href="javascript:void(0);" onclick="showCalendar();">Calendar</a></li>
					
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
	  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
			</div>
		</aside> <!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<section class="ftco-section ftco-no-pt ftco-no-pb">
	    	<div class="container">
	    		
	    	<h2 >친구</h2>
	    		<div class="row d-flex">
	    			<div class="col-xl-8 py-5 px-md-5">
							<div class="row pt-md-4" id="frilist">
							
								<!-- 친구 div  -->
								<c:forEach var="friends" items="${list }">
									<div class="col-md-12" >
										<div class="blog-entry ftco-animate d-md-flex">
											<a href="javascript:void(0);" onclick="showprofile(${sessionScope.num },${friends.FNUM})" class="img img-2"
												style="background-image:url(${cp}/resources/profile/person_1.jpg)"></a>
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
	    			<div class="col-xl-4 sidebar ftco-animate bg-light pt-5">
	            <div class="sidebar-box pt-md-4">
	              <form action="#" class="search-form">
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
    <script type="text/javascript">
    function searchFri(e,num){
    	$.ajax({
            type: "post",
            url: "${cp}/friends/searchlist",
            data: {
            	friname:e.value,
            	num:num
            },
            success: function (response) {
            	
			$(".col-md-12").remove();
            	$(response).each(function(){
            		var str="<div class='col-md-12'><div class='blog-entry ftco-animate d-md-flex fadeInUp ftco-animated'>"
        				+"<a href='javascript:void(0);' onclick='showprofile(${sessionScope.num },"+this.fnum+")' class='img img-2' style='background-image:url(/fproject/resources/profile/person_1.jpg)'></a>"
        				+"<div class='text text-2 pl-md-4'>"
        					+"<h3 class='mb-2'>"
        						+"<a href='single.html'>"+this.name+"</a>"
        					+"</h3>"
        					+"<div class='meta-wrap'>"
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
            		var str="<div id='friendsprofile' class='friendsprofile' ><div class='backimg' style='background-image:url(${cp}/resources/images/image_1.jpg)';></div><div class='blog-entry ftco-animate d-md-flex fadeInUp ftco-animated'>";
            		if(this.favo==0){
            			str=str+"<a href='javascript:void(0);' onclick='favo(${sessionScope.num },"+this.fnum+")' class='icon-star-o'></a><br>";
            		}else{
            			str=str+"<a href='javascript:void(0);' onclick='unfavo(${sessionScope.num },"+this.fnum+")' class='icon-star'></a><br>";
            		}
        			str=str	+"<a href='/fproject/story/list?num="+this.fnum+"' class='img img-2' style='background-image:url(/fproject/resources/profile/person_1.jpg)'></a>"
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
        					+"<a href='#' class='icon-message'></a><br>"
        					+"<a href='${pageContext.request.contextPath}/story/list?num=${friends.FNUM}''>1:1 대화</a>"
        					+"</div>"		
        					+"<div class='frimenus'>"
        					+"<a href='#' class='icon-phone'></a><br>"
        					+"<a href='${pageContext.request.contextPath}/story/list?num=${friends.FNUM}''>무료통화</a>"
        					+"</div>"	
        					+"<div class='frimenus'>"
        					+"<a href='#' class='icon-comments'></a><br>"
        					+"<a href='${pageContext.request.contextPath}/story/list?num=${friends.FNUM}''>코코아 스토리</a>"
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
                		var str="<div id='friendsprofile' class='friendsprofile' ><div class='backimg' style='background-image:url(${cp}/resources/images/image_1.jpg)';></div><div class='blog-entry ftco-animate d-md-flex fadeInUp ftco-animated'>";
                		if(this.favo==0){
                			str=str+"<a href='javascript:void(0);' onclick='favo(${sessionScope.num },"+this.fnum+")' class='icon-star-o'></a><br>";
                		}else{
                			str=str+"<a href='javascript:void(0);' onclick='unfavo(${sessionScope.num },"+this.fnum+")' class='icon-star'></a><br>";
                		}
            			str=str	+"<a href='/fproject/story/list?num="+this.fnum+"' class='img img-2' style='background-image:url(/fproject/resources/profile/person_1.jpg)'></a>"
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
            					+"<a href='#' class='icon-message'></a><br>"
            					+"<a href='${pageContext.request.contextPath}/story/list?num=${friends.FNUM}''>1:1 대화</a>"
            					+"</div>"		
            					+"<div class='frimenus'>"
            					+"<a href='#' class='icon-phone'></a><br>"
            					+"<a href='${pageContext.request.contextPath}/story/list?num=${friends.FNUM}''>무료통화</a>"
            					+"</div>"	
            					+"<div class='frimenus'>"
            					+"<a href='#' class='icon-comments'></a><br>"
            					+"<a href='${pageContext.request.contextPath}/story/list?num=${friends.FNUM}''>코코아 스토리</a>"
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
                    		var str="<div id='friendsprofile' class='friendsprofile' ><div class='backimg' style='background-image:url(${cp}/resources/images/image_1.jpg)';></div><div class='blog-entry ftco-animate d-md-flex fadeInUp ftco-animated'>";
                    		if(this.favo==0){
                    			str=str+"<a href='javascript:void(0);' onclick='favo(${sessionScope.num },"+this.fnum+")' class='icon-star-o'></a><br>";
                    		}else{
                    			str=str+"<a href='javascript:void(0);' onclick='unfavo(${sessionScope.num },"+this.fnum+")' class='icon-star'></a><br>";
                    		}
                			str=str	+"<a href='/fproject/story/list?num="+this.fnum+"' class='img img-2' style='background-image:url(/fproject/resources/profile/person_1.jpg)'></a>"
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
                					+"<a href='#' class='icon-message'></a><br>"
                					+"<a href='${pageContext.request.contextPath}/story/list?num=${friends.FNUM}''>1:1 대화</a>"
                					+"</div>"		
                					+"<div class='frimenus'>"
                					+"<a href='#' class='icon-phone'></a><br>"
                					+"<a href='${pageContext.request.contextPath}/story/list?num=${friends.FNUM}''>무료통화</a>"
                					+"</div>"	
                					+"<div class='frimenus'>"
                					+"<a href='#' class='icon-comments'></a><br>"
                					+"<a href='${pageContext.request.contextPath}/story/list?num=${friends.FNUM}''>코코아 스토리</a>"
                					+"</div>"	
                				+"</div>"
                		+"</div>";
                    		$("#friprofile").append(str);
                    		
                    	});
                    }
                });
            
    }
  	function showCalendar(){
  		window.open("calendar", "[캘린더]", "width=900, height=800, toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no" );    
  	};
  </script>
  </body>
</html>

