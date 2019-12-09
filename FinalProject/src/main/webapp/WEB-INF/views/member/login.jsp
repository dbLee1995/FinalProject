<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
</script>
<title>member/login.jsp</title>
</head>

<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
		<h1>회원 로그인</h1>
			</div>
		<div>
			<form method="post" action="${pageContext.request.contextPath }/member/login">
			<p>
				<label>아이디</label>
					<!-- 아이디<input type="text" name="id" value="${param.id}" required>  -->		
				<span class="w3-right w3-button w3-hover-white" title="아이디 찾기" id="find_id_btn">
					<i class="fa fa-exclamation-triangle w3-hover-text-red w3-large"></i>
				</span>
				<input class="w3-input" id="id" name="id" type="text" value="${param.id}" required>
			</p>
			<p>
				<label>비밀번호</label>
				 	<!-- 비밀번호<input type="password" name="pwd" value="${param.pwd}" required><br> -->
				<span class="w3-right w3-button w3-hover-white" title="비밀번호찾기" id="find_pw_btn">
					<i class="fa fa-exclamation-triangle w3-hover-text-red w3-large"></i>
				</span>
				<input class="w3-input" id="pwd" name="pwd" type="text" value="${param.pwd}" required>
			</p>
	<input type="submit" value="로그인">
	<input type="reset" value="취소">
		</form>	
		</div>
		</div>
	</div>
</body>
</html>