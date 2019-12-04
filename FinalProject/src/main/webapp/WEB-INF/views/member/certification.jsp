<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="certification_container">
	<p>인증번호를 입력해주세요</p>
	<form method="post" action="${pageContext.request.contextPath }/member/registering">
		<div>
			<input style="display: none;" type="password" value="${email }" name="email" readonly> <br>
			<input style="display: none;" type="password" value="${id }" name="id" readonly> <br>
			<input style="display: none;" type="password" value="${pwd }" name="pwd" readonly> <br>
			<input type="text" name="checkString" id="checkString"> <label for="checkString">인증문자 입력</label>
		</div>
		<div>
			<p>${certificationWrongMsg }</p>
		</div>
		<div>
			<button type="submit" id="regBtn">확인</button>
			<button type="button" id="resend">인증문자 재전송</button>
		</div>
		<div>
			<span>제한시간</span>
		</div>
	</form>
</section>

