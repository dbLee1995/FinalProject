<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
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
					<button type="button" id="selectMoveBasketBtn">선택항목 바구니로 옮기기</button>
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
	
		var checkboxNodeList = document.querySelectorAll("input[type='checkbox']");
		var delItemBtnList = document.querySelectorAll("button[name='delItemBtn']");
		var selectBtnSwitch = false;
		
		(() => {
			delItemBtnList.forEach((value, index, listObj) => {
				value.addEventListener("click", delThisItem);
			});
		})()
		document.getElementById("allSelectBtnTop").addEventListener("click", selectAllItem);
		document.getElementById("delSelectItemBtn").addEventListener("click", ajax);
		document.getElementById("selectMoveBasketBtn").addEventListener("click", ajax);



		function selectAllItem(e) {
			checkboxNodeList.forEach((value, index, listObj) => {
				switch (selectBtnSwitch) {
					case true:
						value.checked = false;
						break;
					case false:
						value.checked = true;
						break;
				};
			});
			selectBtnSwitch = !selectBtnSwitch;
		}
		
		function delThisItem(e) {
			var xhr = new XMLHttpRequest();
			var checkedItemList = [];
			checkedItemList.push(e.target.parentElement.previousElementSibling.firstElementChild.value);
			xhr.open('post', '${cp}/emoShop/delWishItem');
			xhr.onreadystatechange = function() {
				if(xhr.status === 200 && xhr.readyState === 4) {
					e.target.parentElement.parentElement.remove();
				}
			};
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr.send(JSON.stringify(checkedItemList));
		}

		function ajax(e) {
			var xhr = null;

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
			
			function call(e) {
				xhr = new XMLHttpRequest();
				var json = JSON.stringify(itemCheckedList());
				switch(e.target.id) {
					case 'selectMoveBasketBtn':
						xhr.open('post', '${cp}/emoShop/moveWishtoBasket'); break;
					case 'delSelectItemBtn':
						xhr.open('post', '${cp}/emoShop/delWishItem'); break;
				}
				xhr.onreadystatechange = function() {
					if(xhr.status === 200 && xhr.readyState === 4) {
						checkboxNodeList.forEach((value, index, listObj) => {
							switch(value.checked) {
								case true:
									value.parentElement.parentElement.remove(); break;
							}
						});
						alert(xhr.responseText);
					}
				};
				xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
				xhr.send(json);
			}
			return call(e);
		}

	</script>
</body>
</html>