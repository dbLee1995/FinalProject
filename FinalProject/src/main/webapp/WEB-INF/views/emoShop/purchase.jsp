<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코코아톡:: 이모티콘 구매</title>
<link rel="shortcut icon" href="${cp }/resources/images/icons/favicon.ico">
<link rel="icon" href="${cp }/resources/images/icons/favicon.ico">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/alarm2.js"></script>
</head>
<body>
	<section id="page_cart">
	<h2 class="article_title">주문 목록</h2>
	  <div class="cart_wrapper js_cart_wrapper">
		<form action="/emoShop/purchase" method="post" id="form" class="checkout_form js_checkout_form">
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
                  <label for="checkbox_all_top" class="rui_checkbox_label">전체 선택</label>
                </div>
                <div class="buttons_wrapper">
                  <ul class="rui_button_group_5" style="display: inline-table; white-space: nowrap; list-style: none; margin: 0; padding: 0;">
                    <li class="rui_button_item">
                      <button type="button" class="handling_button rui_button_white_30 js_btn_selected_move_to_wishlist">선택 보관함으로 이동</button>
                    </li>
                    <li><span>&nbsp;&nbsp;</span></li>
                    <li class="rui_button_item">
                      <button type="button" class="handling_button rui_button_white_30 js_btn_selected_del_cart">선택 삭제</button>
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
						  <input type="checkbox" id="${vo.emognum}" class="rui_checkbox_input" title="${vo.name } 선택" name="emognum[]" value="${vo.price }" data-book-index="${s.index}">
						</div>
					    <div class="thumbnail_image">
						  <img class="thumbnail ls-is-cached lazyloaded border" src="이모티콘 경로" alt="${vo.name }">
					    </div>
					    <a class="thumbnail_btn" href="여기이모티콘들어가야함ㅅㅂ" style="display:inline-block;">
						  <span style="display:none;">상세페이지 바로가기</span>
					    </a>
 					  </div>
					</div>
					<div class="table_cell_wrapper" style="display:flex; flex-flow: row nowrap; justify-content:center; align-items:center;">
					  <div class="table_wrapper">
						<div class="book_metadata_wrapper">
						  <h3 class="book_metadata meta_title">
						    <a class="title_link " href="해당 이모티콘 판매 페이지로" data-track-params="" data-track-type="">
						      <span class="title_text js_highlight_helper" style="display:inline-block;">${vo.name }</span>
						    </a>
						  </h3>
					    </div>
					    <ul class="cart_wish_buttons_wrapper rui_button_group_5">
                          <li class="rui_button_item">
							<button type="button" class="rui_button_white_30 rui_button_eink_black_line_30 book_button btn_move_to_wishlist js_btn_move_to_wishlist" data-book-index="${s.index }">보관함으로 이동</button>
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
					<input type="hidden" name="prices[]" value="${vo.price }" readonly>
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
                      <button type="button" class="handling_button rui_button_white_30 js_btn_selected_move_to_wishlist">선택 보관함으로 이동</button>
                    </li>
                    <li>
                    <li><span>&nbsp;&nbsp;</span></li>
                    <li class="rui_button_item">
                      <button type="button" class="handling_button rui_button_white_30 js_btn_selected_del_cart">선택 삭제</button>
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
	</script>
</body>
</html>