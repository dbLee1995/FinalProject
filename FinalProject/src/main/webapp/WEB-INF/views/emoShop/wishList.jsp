<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
</head>

<body>

	<section title="wishListSection" id="wishListSection">
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
							<td><input type="checkbox" value="${vo.emogNum }" /></td>
							<td><button type="button" name="delItemBtn">삭제</button></td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<button type="button" id="selectMoveBasketBtn">선택항목 바구니에 넣기</button>
					<button type="button" id="delSelectItemBtn">선택항목 삭제</button>
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
						<a href="${cp }/emoShop/wishList?thisPage=${i }"><span style="color: gray">${i }</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</section>





	<script type="text/javascript">
		/*
		var checkboxNodeList = document.querySelectorAll("input[type='checkbox']");
		function selectAllItem(e) {
			checkboxNodeList.forEach((value, index, listObj) => {
				console.log("전: " + value.checked);
				switch(value.checked) {
					case true:
						value.checked="false";
						break;
					case false:
						value.checked="true";
						break;
				};
				console.log("후: " + value.checked);
			});
		}
		document.getElementById("allSelectBtnTop").addEventListener("click", selectAllItem);
		*/
		var checkboxNodeList = document.querySelectorAll("input[type='checkbox']");
		var delItemBtnList = document.querySelectorAll("button[name='delItemBtn']");

		(() => {
			delItemBtnList.forEach((value, index, listObj) => {
				value.addEventListener("click", e => {
					value.parentElement.parentElement.remove();
				});
			});
		})();

		document.getElementById("allSelectBtnTop").addEventListener("click", selectAllItem);
		document.getElementById("delSelectItemBtn").addEventListener("click", deleteItem);
		document.getElementById("selectMoveBasketBtn").addEventListener("click", toBasket);



		function selectAllItem(e) {
			checkboxNodeList.forEach((value, index, listObj) => {
				switch (value.checked) {
					case true:
						value.checked = false;
						break;
					case false:
						value.checked = true;
						break;
				};
			});
		}

		function deleteItem(e) {
			checkboxNodeList.forEach((value, index, listObj) => {
				switch (value.checked) {
					case true:
						// ajax 삽입
						value.parentElement.parentElement.remove();
						break;
				};
			});
		}

		function toBasket() {
			//var xhr = null;
			console.log("각각");

			function itemCheckedList() {
				var checkedItemList = [];
				checkboxNodeList.forEach((value, index, listObj) => {
					switch (value.checked) {
						case true:
							checkedItemList.push(value.value);
					}
				});
				if (checkedItemList == null) return alert("선택한 항목이 없습니다.");
				return checkedItemList;
			}
			
			/*
			function moveBasket() {
				$.ajax({
					url:"${cp}/emoShop/moveBasket",
					type: "post",
					dataType:"text",
					data: {
						moveList : itemCheckedList()
					},
					success: function(data) {
						alret("꺅꺅꺅");
					}
				});
			}
			*/
			
			
			function moveBasket() {
				var xhr = new XMLHttpRequest();
				xhr.open('post', '${cp}/emoShop/moveBasket');
				xhr.onreadystatechange = function() {
					if(xhr.status === 200 && xhr.readyState === 4) {
						console.log("??");
						moveBasketCb();
					} else {
						alert("오류: 바구니로 옮길 수 없습니다.");
						return;
					}
				};
				
				xhr.send('moveList=' + itemCheckedList());
			}
			

			function moveBasketCb() {
				console.log("꺅꺅꺅");
				alert(xhr.responseText);
			}

			return moveBasket();
		}

	</script>

</body>

</html>