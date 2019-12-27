<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>코코아톡:: 이모티콘 바구니</title>
    
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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">

<link rel="stylesheet" href="${cp }/resources/css/page_cart.css"/>
<link rel="stylesheet" href="${cp }/resources/css/page_base.css"/>
<link rel="stylesheet" href="${cp }/resources/css/page_btn.css"/>
</head>
<body>
  <div id="colorlib-page">
	<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
	  <aside id="colorlib-aside" role="complementary" class="js-fullheight" style="max-width: 250px; display:block;">
		<nav id="colorlib-main-menu" role="navigation">
		  <ul>
			<c:choose>
			  <c:when test="${empty sessionScope.id}">					
			    <li><a href="${pageContext.request.contextPath}/member/login">Login</a></li>		
			  </c:when>	
			  <c:otherwise>
			    <li><a href="${cp}/profiles/info?num=${sessionScope.num}">마이페이지</a></li>
				<li><a href="${pageContext.request.contextPath}/story/list?num=${sessionScope.num}">코코아 스토리</a></li>
				<li><a href="${cp }/friends/list?num=${sessionScope.num}">친구들</a></li>			
				<li><a href="${pageContext.request.contextPath}/ChatList?num=${sessionScope.num}&clnum=-1">채팅</a></li>
				<li class="colorlib-active"><a href="${cp }/emoShop/main">코코아 이모티콘</a>
				  <ul style="padding: 5px 0px 0px 15px;">
				    <li style="margin:0px;"><a href="${cp }/emoShop/basket" style="font-size:15px;">내 바구니</a></li>
				    <li style="margin:0px;"><a href="${cp }/emoShop/wishList" style="font-size:15px;">내 찜목록</a></li>
				    <li style="margin:0px;"><a href="${cp }/emoShop/uploadEmoFile" style="font-size:15px;">이모티콘 올리기</a>
				  </ul>
				</li>
				<li><a href="javascript:void(0);" onclick="showCalendar();">달력</a></li>
				<li><a href="${cp}/nquire/list?num=${sessionSope.num}">문의하기</a></li>
			  </c:otherwise>	 
			</c:choose>
		  </ul>
		</nav>
		<div class="colorlib-footer">
	<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
		  <p class="pfooter">
	  	    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
	  	  </p>
	  	</div>
	  </aside> <!-- END COLORLIB-ASIDE -->
	</div>
	
  <section id="page_cart">
	<h2 class="article_title">바구니</h2>
	  <div class="cart_wrapper js_cart_wrapper">
		<form action="${cp }/emoShop/purchase" method="post" id="form" class="checkout_form js_checkout_form">
		  <article class="cart_summary_wrapper">
			<div class="summary_box_wrapper js_summary_box_wrapper">
			  <div class="summary_box">
                <p class="total_price_wrapper">
                  <span class="table_wrapper">
                    <span class="total_text">합계</span>
                    <span class="total_price">
                      <span class="js_price_wrapper"><span class="price_num"></span>원</span>
                    </span>
                  </span>
                </p>
              </div>
              <div class="buy_button_wrapper">
                <button type="button" class="blue_button buy_button">선택 구매하기</button>
              </div>
              <div id="purchase"></div>
            </div>
          </article>
          <article class="cart_list_wrapper js_cart_list_wrapper">
            <div class="cart_list_box">
			  <div class="module_list_handler js_list_handler_wrapper" style="border-top: 1px solid #d1d5d9; padding: 25px 15px 30px 15px;">
                <div class="total_checkbox">
                  <input type="checkbox" id="checkbox_all_top" class="rui_checkbox_input js_checkbox_all" title="카트에 있는 책 전체 선택">
                  <label for="checkbox_all_top" class="rui_checkbox_label">${vo.name }전체 선택</label>
                </div>
                <div class="buttons_wrapper">
                  <ul class="rui_button_group_5" style="display: inline-table; white-space: nowrap; list-style: none; margin: 0; padding: 0;">
                    <li class="rui_button_item">
                      <button type="button" class="handling_button rui_button_white_30 js_btn_selected_move_to_wishlist" data-name="moveSelectItemBtn">선택 찜 목록으로 이동</button>
                    </li>
                    <li><span>&nbsp;&nbsp;</span></li>
                    <li class="rui_button_item">
                      <button type="button" class="handling_button rui_button_white_30 js_btn_selected_del_cart" data-name="delSelectItemBtn">선택 삭제</button>
                    </li>
                  </ul>
                </div>
              </div>
              <div id="cart_wrap">
              
<!-- -->       <c:forEach items="${list }" var="vo" varStatus="s">     <!-- ///////////////////////////////////////////////////////////////// -->

				<div class="bookmacro_wrapper" id="book${vo.emognum}" data-book-index="${s.index}">
				  <div id="book_${vo.emognum }" class="book_macro_60 book_macro_landscape book_macro_metadata_portrait js_cart_book" style="display: flex; flex-flow: row nowrap;">
					<div class="book_thumbnail_wrapper has_checkbox" style="display:inline-block; padding: 20px 20px 15px 18px;">
					  <div class="book_thumbnail" style="display:inline-block;">
						<div class="thumbnail_checkbox">
						  <input type="checkbox" id="${vo.emognum}" class="rui_checkbox_input" title="${vo.name } 선택" name="emognum" value="${vo.emognum }" data-book-index="${s.index}" data-book-price="${vo.price }">
						</div>
					    <div class="thumbnail_image">
						  <img class="thumbnail ls-is-cached lazyloaded border" src="${cp }/resources/uploadImage/admin/emoticon/${vo.category }/${vo.name }/${vo.repreImg }" alt="${vo.name }">
					    </div>
					    <a class="thumbnail_btn" href="${cp }/emoShop/emoticon?emognum=${vo.emognum}" style="display:inline-block;">
						  <span style="display:none;">상세페이지 바로가기</span>
					    </a>
 					  </div>
					</div>
					<div class="table_cell_wrapper" style="display:flex; flex-flow:row nowrap; justify-content:center; align-items:center;">
					  <div class="table_wrapper" style="padding:13px 0px 0px 35px">
						<div class="book_metadata_wrapper">
						  <h3 class="book_metadata meta_title">
						    <a class="title_link " href="${cp }/emoShop/emoticon?emognum=${vo.emognum}" data-track-params="" data-track-type="">
						      <span class="title_text js_highlight_helper" style="display:inline-block;">${vo.name }</span>
						    </a>
						  </h3>
					    </div>
					    <ul class="cart_wish_buttons_wrapper rui_button_group_5">
                          <li class="rui_button_item">
							<button type="button" class="rui_button_white_30 rui_button_eink_black_line_30 book_button btn_move_to_wishlist js_btn_move_to_wishlist" data-book-index="${s.index }">찜 목록으로 이동</button>
                          </li>
                          <li><span>&nbsp;&nbsp;</span></li>
                          <li class="rui_button_item">
                            <button type="button" class="rui_button_white_30 rui_button_eink_black_line_30 book_button btn_delete js_btn_delete" data-book-index="${s.index}">삭제</button>
                          </li>
                        </ul>
                        <div style="width:370px"></div>
						<div class="book_price_wrapper">
						  <ul class="show_coupon_price">
						    <li class="ebook_price">
						      <strong><span class="museo_sans">${vo.price }</span>원</strong>
						    </li>
						  </ul>
						</div>
                      </div>
                        
                    </div>
					<input type="hidden" name="prices" class="r_price" value="${vo.price }" readonly>
                  </div>
                  <hr>
				</div>
				  
<!-- -->        </c:forEach>     <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->

				</div>
				  <div class="module_list_handler js_list_handler_wrapper" style="padding-left: 17px;">
				  <div class="total_checkbox">
				  <input type="checkbox" id="checkbox_all_bottom" class="rui_checkbox_input js_checkbox_all" title="카트에 있는 책 전체 선택">
                  <label for="checkbox_all_bottom" class="rui_checkbox_label">전체 선택</label>
                </div>
                <div class="buttons_wrapper" style="display:flex; flex-flow: row-reverse nowrap;">
                  <ul class="rui_button_group_5">
                    <li class="rui_button_item">
                      <button type="button" class="handling_button rui_button_white_30 js_btn_selected_move_to_wishlist" data-name="moveSelectItemBtn">선택 찜 목록으로 이동</button>
                    </li>
                    <li>
                    <li><span>&nbsp;&nbsp;</span></li>
                    <li class="rui_button_item">
                      <button type="button" class="handling_button rui_button_white_30 js_btn_selected_del_cart" data-name="delSelectItemBtn">선택 삭제</button>
                    </li>
                  </ul>
                </div>
              </div>
          </div>
        </article>
      </form>
    </div>
  </section>

<script type="text/javascript">
	var selectBtnSwitch = false; // 전체선택버튼 이벤트용 변수
	var checkboxNodeList = document.querySelectorAll("input[type='checkbox']");
	(() => {
		checkboxNodeList.forEach((value, index, listObj) => {
			value.addEventListener("click", () => {
				document.querySelector('.js_price_wrapper .price_num').innerText = totalPrice();
			});
		});
		var selectAllBtn = document.getElementsByClassName('js_checkbox_all');
		for(var i=0; i<selectAllBtn.length; i++) {
			selectAllBtn[i].addEventListener("click", selectAllItem);
		}
		var moveSelectItemBtn = document.getElementsByClassName('js_btn_selected_move_to_wishlist');
		for(var i=0; i<moveSelectItemBtn.length; i++) {
			moveSelectItemBtn[i].addEventListener("click", ajax);
		}
		var delSelectItemBtn = document.getElementsByClassName('js_btn_selected_del_cart');
		for(var i=0; i<delSelectItemBtn.length; i++) {
			delSelectItemBtn[i].addEventListener("click", ajax);
		}
		var toWishListBtn = document.getElementsByClassName('js_btn_move_to_wishlist');
		for(var i=0; i<toWishListBtn.length; i++) {
			toWishListBtn[i].addEventListener("click", moveThisItem);
		}
		var delItemBtn = document.querySelectorAll(".bookmacro_wrapper .js_btn_delete");
		delItemBtn.forEach((value, index, listObj) => {
			value.addEventListener("click", delThisItem);
		});
		document.querySelector(".blue_button").addEventListener("click", e => {
			alert("선택한 이모티콘을 구매하였습니다.");
			ajax(e);
			document.getElementById("form").submit();
		});
	})();
  
	function selectAllItem() {
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
		document.querySelector('.js_price_wrapper .price_num').innerText = totalPrice();
	}
	
	selectAllItem();
	
	function delThisItem(e) {
		var xhr = new XMLHttpRequest();
		var itemIndexList = [];
		itemIndexList.push(e.target.dataset.bookIndex);
		var json = JSON.stringify(itemIndexList);
		var selectedItemTotalPrice = 0;
		xhr.open('post', '${cp}/emoShop/delBasketItem');
		xhr.onreadystatechange = function() {
			if(xhr.status === 200 && xhr.readyState === 4) {
				var list = document.getElementsByClassName('bookmacro_wrapper');
				list[e.target.dataset.bookIndex].remove();
				var delItemBtnList = document.querySelectorAll('.bookmacro_wrapper .js_btn_delete');
				delItemBtnList.forEach((value, index, listObj) => {
					value.dataset.bookIndex = index;
				});
				var moveItemBtnList = document.querySelectorAll('.bookmacro_wrapper .js_btn_move_to_wishlist');
				moveItemBtnList.forEach((value, index, listObj) => {
					value.dataset.bookIndex = index;
				});
				var itemList = document.querySelectorAll(".bookmacro_wrapper input[type='checkbox']");
				itemList.forEach((value, index, listObj) => {
					value.dataset.bookIndex = index;
				});
				var itemDivList = document.querySelectorAll('.bookmacro_wrapper');
				itemDivList.forEach((value, index, listObj) => {
					value.dataset.bookIndex = index;
				});
				document.querySelector('.js_price_wrapper .price_num').innerText = totalPrice();
			}
		};
		xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		xhr.send(json);
	}
	
	function moveThisItem(e) {
		var xhr = new XMLHttpRequest();
		var itemIndexList = [];
		itemIndexList.push(e.target.dataset.bookIndex);
		var json = JSON.stringify(itemIndexList);
		xhr.open('post', '${cp}/emoShop/moveBaskettoWish');
		xhr.onreadystatechange = function() {
			if(xhr.status === 200 && xhr.readyState === 4) {
				var delItemBtnList = document.querySelectorAll('.bookmacro_wrapper .js_btn_delete');
				delItemBtnList.forEach((value, index, listObj) => {
					value.dataset.bookIndex = index;
				});
				var moveItemBtnList = document.querySelectorAll('.bookmacro_wrapper .js_btn_move_to_wishlist');
				moveItemBtnList.forEach((value, index, listObj) => {
					value.dataset.bookIndex = index;
				});
				var itemList = document.querySelectorAll(".bookmacro_wrapper input[type='checkbox']");
				itemList.forEach((value, index, listObj) => {
					value.dataset.bookIndex = index;
				});
				var itemDivList = document.querySelectorAll('div[class=bookmacro_wrapper]');
				itemDivList.forEach((value, index, listObj) => {
					value.dataset.bookIndex = index;
				});
				itemDivList[e.target.dataset.bookIndex].remove();
				document.querySelector('.js_price_wrapper .price_num').innerText = totalPrice();
			}
		};
		xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		xhr.send(json);
	}

	
	function ajax(e) {
		var xhr = null;

		function itemCheckedList() {
			var checkedItemList = [];
			var checkboxNodeList = document.querySelectorAll(".bookmacro_wrapper input[type='checkbox']");
			checkboxNodeList.forEach((value, index, listObj) => {
				switch (value.checked) {
					case true:
						checkedItemList.push(value.dataset.bookIndex);
				}
			});
			if (checkedItemList == null) return alert("선택한 항목이 없습니다.");
			var json = JSON.stringify(checkedItemList);
			return json;
		}
		
		function call(e) {
			xhr = new XMLHttpRequest();
			console.log(e.target);
			console.log(e.target.dataset.name);
			switch(e.target.dataset.name) {
				case 'moveSelectItemBtn':
					xhr.open('post', '${cp}/emoShop/moveBaskettoWish'); break;
				case 'delSelectItemBtn':
					xhr.open('post', '${cp}/emoShop/delBasketItem'); break;
				default:
					xhr.open('post', '${cp}/emoShop/delBasketItem');
			}
			xhr.onreadystatechange = function() {
				if(xhr.status === 200 && xhr.readyState === 4) {
					var checkboxNodeList = document.querySelectorAll(".bookmacro_wrapper input[type='checkbox']");
					checkboxNodeList.forEach((value, index, listObj) => {
						switch(value.checked) {
							case true:
								var delItemBtnList = document.querySelectorAll('.bookmacro_wrapper .js_btn_delete');
								delItemBtnList.forEach((value, index, listObj) => {
									value.dataset.bookIndex = index;
								});
								var moveItemBtnList = document.querySelectorAll('.bookmacro_wrapper .js_btn_move_to_wishlist');
								moveItemBtnList.forEach((value, index, listObj) => {
									value.dataset.bookIndex = index;
								});
								var itemList = document.querySelectorAll(".bookmacro_wrapper input[type='checkbox']");
								itemList.forEach((value, index, listObj) => {
									value.dataset.bookIndex = index;
								});
								var itemDivList = document.querySelectorAll('.bookmacro_wrapper');
								itemDivList.forEach((value, index, listObj) => {
									value.dataset.bookIndex = index;
								});
								var list = document.getElementsByClassName('bookmacro_wrapper');
								list[value.dataset.bookIndex].remove();
								document.querySelector('.js_price_wrapper .price_num').innerText = totalPrice();
						}
					});
					alert(xhr.responseText);
				}
			};
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr.send(itemCheckedList());
		}
		return call(e);
	}
	
	function totalPrice() {
		var checkboxList = document.querySelectorAll(".bookmacro_wrapper input[type='checkbox']");
		var price = 0;
		checkboxList.forEach((value, index, listObj) => {
			if(value.checked) price += Number.parseInt(value.dataset.bookPrice);
		});
		return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>

</body>
</html>