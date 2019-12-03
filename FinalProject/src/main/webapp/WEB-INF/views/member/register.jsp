<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath }/member/registering">
		<label for="email">이메일</label> <input type="email" name="email" id="eamil"><br>
		<label for="id">아이디</label> <input type="text" name="id" id="id"><br>
		<label for="pwd">비밀번호</label> <input type="password" name="pwd" id="pwd"><br>
		<button type="submit">가입</button>
	</form>
		<br>
		<br>
		<button type="button">로그인 창으로</button>
	
	
		
	<script type="text/javascript">
	
	</script>
</body>
</html>