<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	p{font-size: larger;color: #383434;}
	span{color:#838181;}
	 .btns{background-color: #ececec; margin-top: 20px;  width: 150px; height: 60px; color: #3383bb;font-weight: bold;}
	 
</style>
</head>
<body>
<div style="text-align: center;">
<p>${title } 일정이 있습니다.</p>	
<span>일정을 확인해 주세요!</span><br>
<input type="button" value="확인" class="btns" onclick="closeself()"> 
</div>
</body>
<script type="text/javascript">
function closeself(fnum){
	window.close();
}
</script>
</html>