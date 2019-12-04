<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>
</head>
<body>
<h1>회원로그인</h1>
<form method="post" action="${pageContext.request.contextPath }/member/login">
	아이디<input type="text" name="id" value="${param.id}"><br>
	비밀번호<input type="password" name="pwd" value="${param.pwd}"><br>
	<input type="submit" value="로그인">
	<input type="reset" value="취소">
</form>	
</body>
</html>