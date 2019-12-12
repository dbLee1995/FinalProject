<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title her</title>
</head>
<body>
	<section title="buyList">
		<div>
    		<form method="post" action="">
			<table border="1" class="buyTable">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>대표 이미지</th>
					<th>카테고리</th>
					<th><button type="button" id="allSelectBtnTop">모두 선택</button></th>
					<th>삭제</th>
				</tr>
				<c:forEach items="${list }" var="vo">
				<tr>
					<td>${vo.num }</td>
					<td>${vo.name}</td>
					<td>???????????</td>
					<td>${vo.category }</td>
					<td><input type="checkbox" name="choose"/></td>
					<td><button type="button">삭제</button></td>
				</tr>
				</c:forEach>
			</table>
			<div>
				<button type="button">선택항목 삭제</button>
				<button type="button" id="buttomBuyBtn">선택항목 보관함으로 이동</button>
			</div>
			</form>
    	</div>
	</section>
	
	
	<script type="text/javascript">
	</script>
</body>
</html>