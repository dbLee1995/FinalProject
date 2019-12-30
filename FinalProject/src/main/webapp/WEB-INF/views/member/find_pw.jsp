<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="shortcut icon" href="${cp }/resources/images/icons/favicon.ico">
	<link rel="icon" href="${cp }/resources/images/icons/favicon.ico">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->	
		<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/images/icons/favicon.ico"/>
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/animate/animate.css">
	<!--===============================================================================================-->	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/select2/select2.min.css">
	<!--===============================================================================================-->	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/util.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css">
	<!--===============================================================================================-->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#find_id_btn").click(function(){
			location.href='${cp}/member/find_id';	// 참고= ..은 상위경로
		});
		$("#find_pw_btn").click(function(){
			location.href='${cp}/member/find_pw';	//히스토리를 기록해서 지정한 새로운페이지로 이동한다. 
		});
	});
	function gologin(){
		location.href='${cp}/';
	}
	function checkPwd(){
		$.ajax({
            type: "post",
            url: "${cp}/member/find_pw",
            data: {
            	id:$("#id").val(),
            	email:$("#email").val()
            },
            success: function (response) {
            	$("#checkpwd").empty();
            	$(response).each(function(){
           			if(this.mem){
           				$("#checkpwd").append("<span>귀하의 메일 "+$("#email").val()+" 로 임시비밀번호를 발송 했습니다.</span>");
           			}else {
           				$("#checkpwd").append("<span>입력하신 아이디 또는 이메일이 정확하지 않습니다.</span>");		
           			}
            	});
            }
        });
	}
</script>
<title>member/login.jsp</title>
</head>

<body>
		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
					<div class="login100-form validate-form flex-sb flex-w"	>
						<span class="login100-form-title p-b-32">
							비밀번호 찾기
						</span>
	
						<span class="txt1 p-b-11">
							아이디
						</span>
						<div class="wrap-input100 validate-input m-b-36" >
							<input class="input100"
								id="id"  type="text" >
							<span class="focus-input100"></span>
						</div>
						
						<span class="txt1 p-b-11">
								이메일
						</span>
						<div class="wrap-input100 validate-input m-b-12" >
							<span class="btn-show-pass">
								
							</span>
							<input class="input100"
								id="email"  type="text" >
							<span class="focus-input100"></span>
						</div>
						
						<div class="flex-sb-m w-full p-b-48">
							<div class="contact100-form-checkbox" id="checkpwd">
								
							
							</div>
							
							<div>
							
							</div>
					
							
						</div>
	
						<div class="container-login100-form-btn">
							<button class="login100-form-btn" onclick="checkPwd()">
								찾기
							</button>
							<button class="login100-form-btn" onclick="gologin()" style="margin-left: 90px;">
								로그인
							</button>
						</div>
	
					</div>
				</div>
			</div>
		</div>

	<div id="dropDownSelect1"></div>
	<!--===============================================================================================-->
		<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
		<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
		<script src="vendor/bootstrap/js/popper.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
		<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
		<script src="vendor/daterangepicker/moment.min.js"></script>
		<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
		<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
		<script src="js/main.js"></script>
</body>
</html>