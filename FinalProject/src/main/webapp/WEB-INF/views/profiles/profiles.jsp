<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Andrea - Free Bootstrap 4 Template by Colorlib</title>
	<style>
		.img.prof{
			width:40px;
			height:250px;
			border-radius:50%;
		}
		.tb, tr, th{
			text-align:right;
			padding-left: 50px;
			color:white;
			padding-bottom:20px;
			font-weight:bold;
		}
		td{
    		text-align: left;
    		padding-left: 15px;
    		padding-bottom:20px;
		}
		#profcamera.icon-camera{
			font-size:40px;
    		color:#343a40;
		}
		#idclick.icon-pencil{
			font-size:20px;
			color:white;
			padding-left:10px;
		}
    </style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${cp}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${cp}/resources/css/animate.css">   
    <link rel="stylesheet" href="${cp}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${cp}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${cp}/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${cp}/resources/css/aos.css">
    <link rel="stylesheet" href="${cp}/resources/css/ionicons.min.css">
    <link rel="stylesheet" href="${cp}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${cp}/resources/css/jquery.timepicker.css">    
    <link rel="stylesheet" href="${cp}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${cp}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${cp}/resources/css/style.css">
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
					<li><a href="${cp }/emoShop/main">이모티콘(원래 위치는 about.html)</a></li>
					<li><a href="javascript:void(0);" onclick="showCalendar();">Calendar</a></li>
					
				</ul>
			</nav>

			<div class="colorlib-footer">
				<h1 id="colorlib-logo" class="mb-5"><a href="index.html" style="background-image: url(images/bg_1.jpg);">Andrea <span>Moore</span></a></h1>
				<p class="pfooter"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
			</div>
		</aside> <!-- END COLORLIB-ASIDE -->
		<div id="colorlib-main">
			<section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="about-section">
	    	<div class="container-fluid px-0">
	    		<div class="row d-flex">
	    		<c:choose>	
	    			<c:when test="${sessionScope.num eq pvo.num}">
	    			<div class="col-md-6 d-flex">
	    				<div style="width:100%;height:100%;margin-left:50px;">		    				
	    					<div style="width:95%;height:830px;margin:auto;background-color:aliceblue;color:black;">  			    				
 <!-- background이미지 --><div class="img d-flex align-items-center full-img" style="background-image:url(${cp}/resources/upload/${pvo.backimg});">					    						    					
	    					<div style="width:90%;height:830px;margin:auto;padding-top:250px;padding-bottom:30px;">	    						
	    	  <!-- 이미지 -->		<div id="setId" style="width:270px;height:290px;margin-top:-65PX;margin-left: 160px;">
	    	  						<img src="${cp}/resources/upload/${pvo.profileimg}"  id="imgprof" class="img prof" style="position:relative;">
	    	  						<input type="file" name="changeprofimg" id="changeprofimg" onChange="changeprofimg(this)" style="display:none;"/>
	    	   						<a href="javascript:void(0);" id="uploadProfImg" onClick="uploadProfImg();" style="margin-left:250px;margin-top:-30px;position:absolute;top:428px;left:218px;">
	    	  							<b id="profcamera" class="icon-camera"></b>
	    	  						</a>
	    	     	   	    	</div> 								    						
	    					<div style="text-align:center;width:100%;height:50%;padding-bottom:400px;font-size:large;margin-top:-20px;">
	    			<!-- 이름 --><label id="updateId" style="color:white;font-size:30px;margin-left:45px;">${pvo.name}</label><a href="javascript:void(0);" id="idclick" class="icon-pencil"></a>
	    						<hr style="border: 1px solid white;width:95%;margin-top:-3px;margin-bottom:20px;">
	    	<!-- 전화번호/이메일 --><table class="tb" style="width:400px;margin:auto;">
	    								<tr><th>Birth : </th><td><b id="birth">${pvo.birth}</b></td></tr>
	    								<tr><th>Phone : </th><td><b id="phone">${pvo.phone}</b></td></tr>
	    								<tr><th>Email : </th><td><b id="email">${pvo.email}</b></td></tr>   								
	    						</table>	
	    						<hr style="width:95%;border:1px solid white;">		
	    						<table class="tb" style="width:530px;margin-top:10px;margin-left:20px;">
	    							<tr>
	    								<th style="width:130px;text-align:center;padding-left:initial;">
	    									<form method="post" id="setform" enctype="multipart/form-data">
	    									<input type="file" name="changeFile1" id="changeFile1" onChange="changeFile(this);" style="display:none;"/>
	    									<a href="javascript:void(0);" class="file1" name="file1" id="file1" onClick="uploadFile();" style="color:white;font-size:20px;"><b class="icon-magic"></b><br>배경편집</a>
	    									</form>
	    								</th>
	    							<th id="save" style="width:300px;margin:auto;margin-right:60px;font-weight:bold; display:none;"><a href="javascript:void(0);" name="save"  onClick="save(this);" style="color:white;font-size:25px;">수정</a>
	    							<a href="javascript:void(0);" id="re" onclick="reset();"style="color:white;font-size:25px;padding-left:30px;">취소</a></th>
	    							<th style="width:130px;text-align:center;padding-left:initial;"><a href="#" id="profUpdate" style="padding-left:5px;color:white;font-size:20px;"><b class="icon-pencil"></b><br>정보수정</a></th>	
	    							<th style="width:130px;text-align:center;padding-left:initial;"><a href="${pageContext.request.contextPath}/story/list?num=${pvo.num}" id="story" style="color:white;font-size:20px;"><b class="icon-comments"></b><br>MyStory</a></th>
	    							<th style="width:130px;text-align:center;padding-left:initial;"><a href="${pageContext.request.contextPath}/friends/list?num=${pvo.num}" id="friends" style="color:white;"><b class="icon-person"></b><br>Friends</a></th></tr>    							
	    						</table>	    						
	    					</div>	    						
	    					</div>
	    				</div>
	    					</div>  
	    				</div>
	    			</div>
	    			</c:when>
	    				<c:otherwise>
	    					<div class="col-md-6 d-flex">
	    				<div style="width:100%;height:100%;margin-left:50px;">	    				
 <!-- background이미지 --><div class="img d-flex align-self-stretch align-items-center js-fullheight" style="margin:auto;padding-top:250px;padding-bottom:30px;">					    					
	    					<img src="${pvo.backImg}">
	    					<div style="background-image:url(${pvo.backImg})">	    						
					<!-- 이미지 --><div style="width:280px;height:300px;margin:auto;">
	    	   						<img src="${cp}/resources/upload/image_4.jpg" class="img prof">				
								 </div> 								    						
	    					<div style="text-align:center;width:100%;height:50%;padding-bottom:500px;font-size:large;"><!-- 전화번호/이메일 -->
	    			<!-- 이름 --><label id="setId">${pvo.name}</label><a href="#" id="updateId" onClick="updateId(this);" class="icon-pencil"></a>
	    						<hr style="border: 1px solid white;width:95%;margin-top: -3px;">
	    						<form method="post" id="profform" style="display:inline-flex;">
	    						<table class="tb" style="width:400px;margin:auto;">
	    							<tr><th>Birth : </th><td>${pvo.birth}</td></tr>
	    							<tr><th>Phone : </th><td>${pvo.phone}</td></tr>
	    							<tr><th>Email : </th><td>${pvo.email}</td></tr>
	    						</table>			
	    						</form>
	    						<table class="tb" style="margin-top:10px;margin-left:210px;">
	    							<tr><th><hr style="color:white;border:1px"></th></tr>
	    							<tr>    							
	    							<th><a href="${pageContext.request.contextPath}/story/list?num=${pvo.num}">CocoaStory</a></th> 							
	    						</table>	    						
	    					</div>	    						
	    					</div>
	    				</div>
	    				</div>
	    			</div>
	    				</c:otherwise>
	    			</c:choose>
	    	<!-- 친구목록 //////////////////// -->
	    			<div class="col-md-6 d-flex align-items-center">
	    				<div class="text px-4 pt-5 pt-md-0 px-md-4 pr-md-5 ftco-animate">
	    					<!-- 친구 div  -->
								<c:forEach var="newfri" items="${list }">
								<c:if test="${newfri.APPROV==4 }">
									<div class="col-md-12" >
										<div class="blog-entry ftco-animate d-md-flex" style="margin-top:30px;">
											<a href="javascript:void(0);" onclick="showprofile(${sessionScope.num },${newfri.FNUM})" class="img img-2"
												style="background-image:url(${cp}/resources/upload/${newfri.PROFILEIMG});"></a>
											<div class="text text-2 pl-md-4">
												<c:choose>
														<c:when test="${empty newfri.MSG}">
														<h3 class="mb-2" style="margin-top:15px;">
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
								
				<div class="col-xl-4 sidebar ftco-animate bg-light pt-5" style="height: 850px;padding: 20px;">    			
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
	        </div>
	    	</div>
	    </section>
		</div><!-- END COLORLIB-MAIN -->
	</div><!-- END COLORLIB-PAGE -->

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
	
  <script src="${cp}/resources/js/jquery.min.js"></script>
  <script src="${cp}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${cp}/resources/js/popper.min.js"></script>
  <script src="${cp}/resources/js/bootstrap.min.js"></script>
  <script src="${cp}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${cp}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${cp}/resources/js/jquery.stellar.min.js"></script>
  <script src="${cp}/resources/js/owl.carousel.min.js"></script>
  <script src="${cp}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${cp}/resources/js/aos.js"></script>
  <script src="${cp}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${cp}/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${cp}/resources/js/google-map.js"></script>
  <script src="${cp}/resources/js/main.js"></script>   
  <script type="text/javascript">
  	// profile background이미지
		function uploadFile(){		// a태그	onClick=함수
			$("#changeFile1").click(); // input type="file" id입력 click메소드			
		}
		function changeFile(e){		// input type="file" onchange함수		 
			setFile(e);
		}
		function setFile(e){		
			var formData=new FormData();							
  			formData.append("file1",$("#changeFile1")[0].files[0]);
  							// display:none으로 만든 input창 id입력
			$.ajax({
				url:"${cp}/profile/updateBackImg?num=${pvo.num}",
				type:"POST",
				processData:false,
				contentType:false,
				data:formData,
				success:function(){					
					alert("업로드완료!!!");
					location.reload();
				}
			});
		}
		
	// profile이미지
		function uploadProfImg(){
			$("#changeprofimg").click();
		}
		function changeprofimg(e){
			setProfImg(e);
		}
		function setProfImg(e){
			var formData=new FormData();							
  			formData.append("uploadProfImg",$("#changeprofimg")[0].files[0]);
  							// display:none으로 만든 input창 id입력
			$.ajax({
				url:"${cp}/profile/updateProfImg?num=${pvo.num}",
				type:"POST",
				processData:false,
				contentType:false,
				data:formData,
				success:function(){					
					alert("업로드완료!!!");
					location.reload();
				}
			});
		}
		
		$(function(){
			$("#profUpdate").click(function(){
				$(this).hide();
				$("#file1").hide();
				$("#story").hide();
				$("#friends").hide();
				$("#birth").html("<input type='text' name='birthcheck' id='birthcheck' value='${pvo.birth}' style='width:230px;height:35px;text-align:center;'>");
				$("#phone").html("<input type='text' name='phonecheck' id='phonecheck' value='${pvo.phone}' style='width:230px;height:35px;text-align:center;'>");
				$("#email").html("<input type='text' name='emailcheck' id='emailcheck' value='${pvo.email}' style='width:230px;height:35px;text-align:center;'>");
				$("#save").css("display","block");
				$("#birthcheck").focus();
			});
		});
								
		function save(e){			
			var birth=document.getElementById("birthcheck").value;
			var phone=document.getElementById("phonecheck").value;
			var email=document.getElementById("emailcheck").value;
			var formData=new FormData();
			formData.append("birth",$("#birthcheck").val());
			formData.append("phone",$("#phonecheck").val());
			formData.append("email",$("#emailcheck").val());
			$.ajax({
				url:"${cp}/profiles/update?num=${pvo.num}",
				type:"POST",
				processData:false,
				contentType:false,
				data:formData,
				success:function(){					
					alert("업로드완료!!!");
					location.reload();
				}
			});
		}
		
		$(function(){
			$("#idclick").click(function(){
				$(this).hide();
				$("#updateId").html("<input type='text' name='namecheck' id='namecheck' value='${pvo.name}' style='width:190px;height:35px;text-align:center;margin-left:10px;'>" +
									"<a href='javascript:void(0);' name='savename' id='savename' onClick='saveName(this);' style='color:white;font-size:20px;margin-left:10px;'>수정</a>" +
									"<a href='javascript:void(0);' id='re' onclick='reset();' style='color:white;font-size:20px;padding-left:10px;'>취소</a>");
				$("#updateId").focus();
			});
		});
		
		function saveName(e){			
			var name=document.getElementById("namecheck").value;
			var formData=new FormData();
			formData.append("name",$("#namecheck").val());
			$.ajax({
				url:"${cp}/profiles/updateName?num=${pvo.num}",
				type:"POST",
				processData:false,
				contentType:false,
				data:formData,
				success:function(){					
					alert("업로드완료!!!");
					location.reload();
				}
			});
		}

/*		function birthCheck(){
			 var number = obj.value.replace(/[^0-9]/g, "");
			 var birthcheck = "";
			    if(number.length < 4) {
			        return number;
			    } else if(number.length < 7) {
			    	birthcheck += number.substr(0, 4);
			    	birthcheck += "-";
			    	birthcheck += number.substr(4);
			    } else if(number.length < 11) {
			    	birthcheck += number.substr(0, 2);
			    	birthcheck += "-";
			    	birthcheck += number.substr(4, 2);
			    	birthcheck += "-";
			    	birthcheck += number.substr(2);
			    } else {
			    	birthcheck += number.substr(0, 2);
			    	birthcheck += "-";
			    	birthcheck += number.substr(4, 2);
			    	birthcheck += "-";
			    	birthcheck += number.substr(2);
			    }
			    obj.value = birthcheck;
			}
		}
*/
	function reset(){
		location.reload();
	}
	</script>
  </body>
</html>