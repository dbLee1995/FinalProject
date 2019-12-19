<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>member/find_pwd.jsp</title>
	<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#findBtn").click(function(e){
			e.preventDefault();
			var id=$("#id").val();
			var email=$("#email").val();				
					$.ajax({
						url:"${cp}/member/find_pwd?id=" + id +"&email=" + email,
						dataType:"xml",
						success:function(data){
							// alert("success" + data);
							var find=$(data).find("find").text();
							console.log(data);
							if(find=='true'){
								//$("#mem").append("일치하는 정보 입니다.");
								alert("임시비밀번호 발송 하였습니다.");
							}else{
								//$("#mem").html("존재하지 않는 정보 입니다.");
								alert("입력하신 정보를 다시 확인해 주세요.");
							}
						}
					});		
			});
		});
		

</script>

</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
		<!--  <form action="${cp}/member/find_pwd" method="post">  -->	
				<form>
				<div class="w3-center w3-large w3-margin-top">
					<h3>비밀번호 찾기</h3>
				</div>
				<div>
					<p>
						<label>Id</label>
						<input class="w3-input" type="text" id="id"
							name="id" >
					</p>
					<p>
						<label>Email</label> <input class="w3-input" type="text"
							id="email" name="email" >
					</p>

					<p class="w3-center">
						<button type="submit" id="findBtn"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
						<button type="button" onclick="history.go(-1);"
							class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</div>
				</form>
	<!-- </form>  -->	
	<!-- <div id="mem">상태표시</div> -->
		</div>
	</div>
</body>
</html>