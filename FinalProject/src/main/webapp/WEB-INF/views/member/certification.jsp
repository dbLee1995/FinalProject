<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="certification_container">
	<h4>입력하신 이메일로 인증문자를 전송했습니다.</h4>
	<form method="post" action="${cp }/member/registering" style="width: 60%; justify-content: center; text-align: center;">
		<div>
			<input style="display: none;" type="password" value="${email }" name="email" readonly>
			<input style="display: none;" type="password" value="${id }" name="id" readonly>
			<input style="display: none;" type="password" value="${pwd }" name="pwd" readonly>
			<input style="display: none;" type="password" value="${name }" name="name" readonly>
			<input style="display: none;" type="password" value="${phone }" name="phone" readonly>
			<input style="display: none;" type="password" value="${birth }" name="birthDate" readonly>
			<br>
			<label for="checkString" style="display: none; font-size: 14px;">인증문자 입력</label>
			<input type="text" name="checkString" placeholder="인증문자를 입력해주세요." id="checkString" style="paddaing: 10.5px 15px; outline: none; border: 1px solid #e5e5e5; border-radius: 4px; border-color: black; padding: 8px 13px; font-size: 12px;">
		</div>
		<br>
		<div>
			<span style="font-size: 14px">${certificationWrongMsg }</span>
		</div>
		<br>
		<div style="display:flex; justify-content: center;">
			<center>
			  <button type="submit" id="regBtn" style="text-align: center; background-color: #333333; font-size: 14px; color: white; border-radius:5px; width:60px; box-shadow: 0px 5px 15px 0px rgba(0, 0, 0, 0.2); border: none; height: 30px;">확인</button>
			  <button type="button" id="resend" style="text-align: center; background-color: #333333; font-size: 14px; color: white; border-radius:5px; width:120px; box-shadow: 0px 5px 15px 0px rgba(0, 0, 0, 0.2); border: none; height: 30px;">인증문자 재전송</button>
			</center>
		</div>
		<div>
<!-- 			<span>제한시간</span> -->
		</div>
	</form>
	<br>
</section>

