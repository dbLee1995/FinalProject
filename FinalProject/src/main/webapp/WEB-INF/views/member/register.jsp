<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코코아톡:: 회원가입</title>
<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- Main Style Css -->
<link rel="stylesheet" href="${cp }/resources/css/colorlib/style.css"/>
<style type="text/css">
#moveLoginBtn:hover {
	cursor: pointer;
	background-color: 66ccff;
}
</style>
</head>
<body class="form-v5">
	<div class="page-content">
		<div class="form-v5-content">
			<form method="post" action="${cp }/member/registering/certification" id="regForm" class="form-detail">
				<h2>회원가입</h2>
				<div class="form-row">
					<label for="email">이메일</label>
					<div style="display:flex; align-items: center; justify-content: flex-end">
					<input type="email" value="${email }" name="email" id="eamil" placeholder="이메일을 입력해주세요." required>
					<img src="${cp }/resources/css/colorlib/email.png" style="position:absolute; width: 25px; margin-right:10px;">
					</div>
				</div>
				<br>
				<div class="form-row">
					<label for="id">아이디</label>
					<div style="display:flex; align-items: center; justify-content: flex-end">
					<input type="text" name="id" value="${id }" id="id" placeholder="아이디를 입력해주세요." required>
					<img src="${cp }/resources/css/colorlib/id.png" style="position:absolute; width: 25px; margin-right:10px;">
					</div>
				</div>
				<span id="idNotice"></span>
				<br>
				<br>
				<div class="form-row">
					<label for="pwd">비밀번호</label>
					<div style="display:flex; align-items: center; justify-content: flex-end">
					<input type="password" value="${pwd }" name="pwd" id="pwd" placeholder="비밀번호를 입력해주세요." required>
					<img src="${cp }/resources/css/colorlib/password.png" style="position:absolute; width: 25px; margin-right:10px;">
					</div>
				</div>
				<span id="pwdNotice"></span>
				<br>
				<br>
				<div class="form-row">
					<label for="rePwd">비밀번호 확인</label>
					<div style="display:flex; align-items: center; justify-content: flex-end">
					<input type="password" value="${pwd }" name="rePwd" id="rePwd" placeholder="입력한 비밀번호와 일치해야 합니다." required>
					<img src="${cp }/resources/css/colorlib/password.png" style="position:absolute; width: 25px; margin-right:10px;">
					</div>
				</div>
				<span id="rePwdNotice"></span>
				<br>
				<br>
				<div class="form-row">
					<label for="name">이름</label>
					<input type="text" name="name" value="${name }" id="name" placeholder="이름을 입력해주세요." required>
				</div>
				<br>
				<div class="form-row">
					<label for="phone">전화번호</label>
					<input type="text" name="phone" value="${phone }" id="phone" placeholder="숫자로만 입력해주세요." required>
				</div>
				<span id="phoneNotice"></span>
				<br>
				<div class="form-row">
					<label for="birth">생년월일</label>
					<input type="date" name="birthDate" value="${birth }" id="birthDate" min="1900-01-01" max="2019-12-20" required>
				</div>
				<br>
				<div class="form-row-last">
					<button type="button" id="okBtn" class="register">확인</button>
				</div>
			</form>
			<br>
			<c:if test="${infoCheck}">
				<jsp:include page="/WEB-INF/views/member/certification.jsp"/>
			</c:if>
			<div>
			</div>
			<div style="display:flex; align-items: center; justify-content: flex-end; padding: 15px;">
				<button type="button" id="moveLoginBtn" class="register" style="text-align: center; background-color: #333333; font-size: 14px; color: white; border-radius:5px; width:120px; box-shadow: 0px 5px 15px 0px rgba(0, 0, 0, 0.2); border: none; height: 30px;">로그인 창으로</button>
			</div>
		</div>
	</div>



	
	<script type="text/javascript">
		// 전역변수 미사용으로 고치기
		var regForm = document.getElementById("regForm");
		var okBtn = document.getElementById("okBtn");
		var moveLoginBtn = document.getElementById("moveLoginBtn");
		var idVal = document.getElementById("id");
		var pwdVal = document.getElementById("pwd");
		var rePwdVal = document.getElementById("rePwd");
		var phoneVal = document.getElementById("phone");
		var idNotice = document.getElementById("idNotice");
		var pwdNotice = document.getElementById("pwdNotice");
		var rePwdNotice = document.getElementById("rePwdNotice");
		var phoneNotice = document.getElementById("phoneNotice");
		var idCheckR = false;
		var idDBCheckR = false;
		var pwdCheckR = false;
		var rePwdCheckR = false;
		var phoneCheckR = false;
		var idxhr = null;

		moveLoginBtn.addEventListener("click", () => {
			location.href="login";
		});
		
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
		
		
	   /// 전화번호 검사
		phoneVal.addEventListener("change", () => {
			phoneCheck();
		});
		
		function phoneCheck() {
			if(phoneVal.value.length != 11) {
				phoneCheckR = false;
				phoneNotice.innerText="잘못된 전화번호입니다."
			} else {
				for(var i=0; i<phoneVal.value.length; i++) {
					var ch = phoneVal.value.charAt(i);
					if(!(ch>='0' && ch<='9')) {
						phoneCheckR = false;
						phoneNotice.innerText = "전화번호는 숫자로만 입력해주세요(붙임표 제외).";
					} else {
						phoneCheckR = true;
						phoneNotice.innerText = "";
					}
				}
			}
		}
		
		
	   /// 최종 검사 후 이메일 전송 컨트롤러로 submit
		okBtn.addEventListener("click", (e) => {
			if(idCheckR && idDBCheckR && pwdCheckR && rePwdCheckR && phoneCheckR) {
				regForm.submit();
			} else {
				console.log(idCheckR);
				console.log(idDBCheckR);
				console.log(pwdCheckR);
				console.log(rePwdCheckR);
				console.log(phoneCheckR);
				alert("시키는대로 쓰세요.");
			}
		});

	</script>
</body>
</html>