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
					<li><a href="${pageContext.request.contextPath}/./">Home</a></li>
					<li><a href="fashion.html">Fashion</a></li>
					<li class="colorlib-active"><a href="${pageContext.request.contextPath}/story/list?num=${sessionScope.num}">Story</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="contact.html">Contact</a></li>
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
	    				<div class="row pt-md-4"> 	    			
	    <!-- ////////////////// title ##################/////////////////////////////// -->			   					    				    				    			
		    			<div class="blog-entry-2 ftco-animate">	    						    			
	    						<div class="author mb-4 d-flex align-items-center">
	    							<a href="#" class="img" style="background-image: ${profileimg};"></a>
	    							<div class="mb-3" style="margin-top:20px;margin-left:20px;">${id}</div>	    								 
	    						</div>   	
	    						<h1>${vo.stitle}</h1>			
	    				</div>
            			
		       			<img src="${pageContext.request.contextPath}/resources/upload/${vo.saveimg}"class="img-fluid">
		            
	<!-- ////////////////// title End ##################/////////////////////////////// -->  
		          
		            <div class="tag-widget post-tag-container mb-5 mt-5">
		              <div class="tagcloud">
		              	<div class="icon-tag"/>
		                <a href="#" class="">#Life</a>
		                <a href="#" class="tag-cloud-link">#Sport</a>
		                <a href="#" class="tag-cloud-link">#Tech</a>
		                <a href="#" class="tag-cloud-link">#Travel</a>               
		              </div>
		            </div>
		            
		            <div class="about-author d-flex p-4 bg-light">
		              <div class="bio mr-5">
		                <img src="images/person_1.jpg" alt="Image placeholder" class="img-fluid mb-4">
		              </div>
		              <div class="desc">
		                <h3>George Washington</h3>
		                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
		              </div>
		            </div>

<!-- ///////////////////// 댓글리스트 //////////////////////////////////////// -->
		          <div class="pt-5 mt-5">  
		              <h3 class="mb-5 font-weight-bold">Comments</h3>	
		              	              
					<c:forEach var="voa" items="${cvoa}" var="vob" items="${cvob}" var Status="status">
		              <ul class="comment-list">			              	            		             
		                <li class="comment">		             
		                  <div class="vcard bio">
		                    <img src="${pageContext.request.contextPath}/resources/upload/${profileimg}">
		                  	${id}
		                  </div>
		                  <div class="comment-body">
		                    <div>${voa.commcontent}<br>
		                    	${voa.regdate}<br>
		                    	<a href="${pageContext.request.contextPath}/story/commentsDel" class="icon-trash"></a>
		                    	<a href="${pageContext.request.contextPath}/story/commentsUpdate?storynum=${voa.storynum}&num=${sessionScope.num}" class="icon-update"></a>
		                    </div>	
		                    	                    		                    
		            <!--///// reply 답글 /////--> 	             		         
		                    <input type="button" class="replyBtn ${status.index}" class="reply" value="Reply">
		                    <div class="vcard bio">
		                    	<img src="${pageContext.request.contextPath}/resources/upload/${profileimg}">
		                  		${id}
		                  	</div>
		                  	
		                    <div>${vob.commcontent}<br>
		                    	 ${vob.regdate}<br>
		                    	<a href="${pageContext.request.contextPath}/story/commentsDel" class="icon-trash"></a>
		                    	<a href="${pageContext.request.contextPath}/story/commentsUpdate?storynum=${vob.storynum}&num=${sessionScope.num}" class="icon-update"></a>
		                    </div>
		          
		                    <form class="replyForm ${status.index}" method="post" action="${pageContext.request.contextPath}/story/commentsReply?storynum=${voa.storynum}&num=${sessionScope.num}&commnum=${voa.commnum}" style="display:none">		                		               		                 		
		                 		<div class="img" name="profileimg" style="background-image: ${profileimg};">${sessionScope.id}</div>
		                 			<input type="hidden" name="storynum">
		                 			<input type="hidden" name="num">
									<input type="text" name="commcontent" style="width:600px;height:80px;">
									<input type="submit" value="저장" class="reply">
									<input type="reset" value="취소" class="reply">	                 				                 		      
		                 	</form>		                 	 		                 	      			                 					        			
		        	<!--///// reply 답글end /////--> 	
		        			
		                  </div>        
		          		 </li>		          		 
		              </ul>	
		       	   </c:forEach>                        
		         <!-- END comment-list -->
		             
		         <!-- Form Start /////////////////////////////////////////////////--> 
		              <div class="comment-form-wrap pt-5">
		                <h3 class="mb-5">Leave a comment</h3>
		                
		                <form method="post" action="${pageContext.request.contextPath}/story/comments?storynum=${vo.storynum}&num=${sessionScope.num}" class="p-3 p-md-5 bg-light">
		                  <div class="form-group">
		                  <div class="author mb-4 d-flex align-items-center">
		                  	<a href="#" class="img" style="background-image: url(${profileimg});"></a>
		                    <div class="ml-3 info">
		                   	 	<label for="num" >Name *</label><br>
		                    	<label for="id" style="font-size:1.2em;">${sessionScope.id}</label>
		                    	  	
		                  	</div>
		                  </div>
		                  </div>		                 
		                  <div class="form-group">
		                    <label for="message">Message</label>
		                    <textarea name="commcontent" id="message" cols="30" rows="10" class="form-control"></textarea>
		                  </div>
		                  <div class="form-group">
		                    <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
		                  </div>
		                </form>
		                
		              </div>
		            </div>
<!-- ///////////////////// 댓글리스트 END //////////////////////////////////////// -->
			    </div>
			 <!-- Form END /////////////////////////////////////////////////-->
			 
			    	</div>
	    			<div class="col-lg-4 sidebar ftco-animate bg-light pt-5">
	            <div class="sidebar-box pt-md-4">
	              <form action="#" class="search-form">
	                <div class="form-group">
	                  <span class="icon icon-search"></span>
	                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
	                </div>
	              </form>
	            </div>
	            <div class="sidebar-box ftco-animate">
	            	<h3 class="sidebar-heading">Categories</h3>
	              <ul class="categories">
	                <li><a href="#">Fashion <span>(6)</span></a></li>
	                <li><a href="#">Technology <span>(8)</span></a></li>
	                <li><a href="#">Travel <span>(2)</span></a></li>
	                <li><a href="#">Food <span>(2)</span></a></li>
	                <li><a href="#">Photography <span>(7)</span></a></li>
	              </ul>
	            </div>

	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Popular Articles</h3>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> June 28, 2019</a></div>
	                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
	                  </div>
	                </div>
	              </div>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> June 28, 2019</a></div>
	                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
	                  </div>
	                </div>
	              </div>
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control</a></h3>
	                  <div class="meta">
	                    <div><a href="#"><span class="icon-calendar"></span> June 28, 2019</a></div>
	                    <div><a href="#"><span class="icon-person"></span> Dave Lewis</a></div>
	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
	                  </div>
	                </div>
	              </div>
	            </div>

	            <div class="sidebar-box ftco-animate">
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

							<div class="sidebar-box subs-wrap img" style="background-image: url(images/bg_1.jpg);">
								<div class="overlay"></div>
								<h3 class="mb-4 sidebar-heading">Newsletter</h3>
								<p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia</p>
	              <form action="#" class="subscribe-form">
	                <div class="form-group">
	                  <input type="text" class="form-control" placeholder="Email Address">
	                  <input type="submit" value="Subscribe" class="mt-2 btn btn-white submit">
	                </div>
	              </form>
	            </div>

	            <div class="sidebar-box ftco-animate">
	            	<h3 class="sidebar-heading">Archives</h3>
	              <ul class="categories">
	              	<li><a href="#">December 2018 <span>(10)</span></a></li>
	                <li><a href="#">September 2018 <span>(6)</span></a></li>
	                <li><a href="#">August 2018 <span>(8)</span></a></li>
	                <li><a href="#">July 2018 <span>(2)</span></a></li>
	                <li><a href="#">June 2018 <span>(7)</span></a></li>
	                <li><a href="#">May 2018 <span>(5)</span></a></li>
	              </ul>
	            </div>


	            <div class="sidebar-box ftco-animate">
	              <h3 class="sidebar-heading">Paragraph</h3>
	              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut.</p>
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