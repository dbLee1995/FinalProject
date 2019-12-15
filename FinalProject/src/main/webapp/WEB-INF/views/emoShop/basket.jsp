<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section title="basketSection" id="basketSection">
		<div>
			<form method="post" action="">
				<table border="1">
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
							<td><input type="checkbox" name="choose" /></td>
							<td><button type="button">삭제</button></td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<button type="button">선택항목 보관함으로 옮기기</button>
					<button type="button">선택항목 삭제</button>
				</div>
			</form>
		</div>

		<div>
			<c:forEach var="i" begin="${map.startPage }" end="${map.endPage }">
				<c:choose>
					<c:when test="${i==map.thisPage }">
						<b>${i }</b>
					</c:when>
					<c:otherwise>
						<a href="${cp }/emoShop/wishList?thisPage=${i }"><span
							style="color: gray">${i }</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</section>



<script type="text/javascript">
	function selectAllItem(e) {
    	//var checkboxList = [];
    	console.log("여기까진 잘 실행 중");
		var checkboxNodeList = document.querySelectorAll("input[type='checkbox']");
    	checkboxList.forEach((value, index, listObj) => {
			console.log("확인: " + value);
			value.checked="true";
    	});
	}
	document.getElementById("allSelectBtnTop").addEventListener("click", selectAllItem);
</script>

</body>
</html>