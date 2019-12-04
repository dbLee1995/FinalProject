<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath }/member/registering/certification" id="regForm">
		<label for="email">이메일</label> <input type="email" value="${email }" name="email" id="eamil"> <br>
		<label for="id">아이디</label> <input type="text" name="id" value="${id }" id="id"> <br> <span id="idNotice"></span> <br>
		<label for="pwd">비밀번호</label> <input type="password" value="${pwd }" name="pwd" id="pwd"> <br> <span id="pwdNotice"></span> <br>
		<label for="rePwd">비밀번호 확인</label> <input type="password" value="${pwd }" name="rePwd" id="rePwd"> <br> <span id="rePwdNotice"> </span> <br>
		<button type="button" id="okBtn">확인</button>
	</form>
		<br>
		<c:if test="${infoCheck}">
			<jsp:include page="/WEB-INF/views/member/certification.jsp"/>
		</c:if>
		<br>
		<br>
		<br>
		<button type="button" id="loginBtn">로그인 창으로</button>
	
		


	
	<script type="text/javascript">
		var regForm = document.getElementById("regForm");
		var okBtn = document.getElementById("okBtn");
		var idVal = document.getElementById("id");
		var pwdVal = document.getElementById("pwd");
		var rePwdVal = document.getElementById("rePwd");
		var idNotice = document.getElementById("idNotice");
		var pwdNotice = document.getElementById("pwdNotice");
		var rePwdNotice = document.getElementById("rePwdNotice");
		var idCheckR = false;
		var idDBCheckR = false;
		var pwdCheckR = false;
		var rePwdCheckR = false;
		var idxhr = null;

	   /// 아이디 검사(DB확인을 위해 컨트롤러 ajax로 호출)
	   	window.addEventListener("load", () => {
	   		idCheck();
	   		pwdCheck();
	   		rePwdCheck();
	   	});
		idVal.addEventListener("change", idCheck);

		function idCheck() {
			if(idVal.value.length > 3) {
				idCheckR = true;
				idxhr = new XMLHttpRequest();
				idxhr.onreadystatechange = idCallback;
				idxhr.open('get', '${pageContext.request.contextPath}/member/registering/dbCheck?id=' + idVal.value, true);
				idxhr.send();
			} else {
				idCheckR = false;
				if(idVal.value==="") {
					idNotice.innerText="";
				} else {
					idNotice.innerText="아이디는 4자 이상이어야 합니다.";
				}
			}
		}
		function idCallback() {
			if(idxhr.readyState===4 && idxhr.status===200) {
				var data = idxhr.responseText;
				var result = JSON.parse(data);
				if(result.result) {
					idDBCheckR = true;
					idNotice.innerText="사용 가능한 아이디입니다.";
				} else {
					idDBCheckR = false;
					idNotice.innerText="사용 중인 아이디입니다.";
				}
			}
		}
		
	   /// 비밀번호 검사
		pwdVal.addEventListener("change", () => {
			pwdCheck();
			rePwdCheck();
		});
		rePwdVal.addEventListener("change", () => {
			rePwdCheck();
	    });
	    
	   function pwdCheck() {
		   if(pwdVal.value.length < 4) {
				pwdCheckR = false;
				pwdNotice.innerText="비밀번호는 4자 이상이어야 합니다.";
			} else {
				for(var i=0; i<pwdVal.value.length; i++){
					var ch=pwdVal.value.charAt(i);
					if(!(ch>='a' && ch<='z') && !(ch>='0' && ch<='9') && !(ch>='A' && ch<='Z')) {
						pwdCheckR = false;
						pwdNotice.innerText="비밀번호는 영문과 숫자만 사용 가능합니다.";
					} else {
						pwdCheckR = true;
						pwdNotice.innerText="";
					}
				}
			}
		};
		
		function rePwdCheck() {
			if(rePwdVal.value !== pwdVal.value) {
				rePwdCheckR = false;
				rePwdNotice.innerText="비밀번호가 일치하지 않습니다.";
			} else {
				rePwdCheckR = true;
				rePwdNotice.innerText="";
			}
		}
		
		
	   /// 최종 검사 후 이메일 전송 컨트롤러로 submit
		okBtn.addEventListener("click", (e) => {
			if(idCheckR && idDBCheckR && pwdCheckR && rePwdCheckR) {
				regForm.submit();
			} else {
				console.log(idCheckR);
				console.log(idDBCheckR);
				console.log(pwdCheckR);
				console.log(rePwdCheckR);
				alert("아이디와 비밀번호 문법검사 확인이벤트 오류");
			}
		});
	   
	   /// 이메일 재전송
		document.getElementById("resend").addEventListener("click", () => {
			regForm.submit();
		});
	   
	</script>
</body>
</html>