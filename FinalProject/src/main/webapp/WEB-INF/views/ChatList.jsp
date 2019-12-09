<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/sockjs.js"></script>
<script type="text/javascript" src="http://jsgetip.appspot.com"></script>
<body>
	${sessionScope.id }<br>
	<c:forEach var="al" items="${AcList }">
		<a href="${pageContext.request.contextPath }/moveChatRoom?clnum=${al.clnum}&num=${sessionScope.num}">
			<c:forEach var="cl" items="${ChatList }">
				<c:if test="${cl.clnum == al.clnum }">${cl.name }</c:if>
			</c:forEach>
		</a><br>
	</c:forEach>
	<c:if test="${clnum > 0 }">
		<h3>${clvo.name }</h3>
		<table style="height=:600px; width:900px;">
			<col width="200px">
			<col width="400px">
			<col width="300px">
			<tr height="600px">
				<td style="width:500px" colspan="2">
					<div style="width:100%; height:550px; overflow-y:scroll; overflow-x:inherit;"
						id="output">
						<c:forEach var="cvo" items="${chat }">
							${cvo.num }:${cvo.content }(${cvo.regdate })<br>
						</c:forEach>
					</div>
				</td>
			</tr>
			<tr height="100px">
				<td>
					<input type="text" id="textID" size="50" value="" 
						style="width:100%; height:100%; font-weight:bold;"
						name="chatInput" placeholder="내용 입력">
				</td>
				<td>
					<input type="button" value="전송"
						id="buttonMessage" style="width:100px; height:100%">
				</td>
			</tr>
		</table>
	</c:if>
</body>

<script type="text/javascript">
$(document).ready(function() {
	//document.write( ip() );
	//alert(ip());
		
	$("#buttonMessage").click(function() {
		sendMessage();
		$('#textID').val('')
	});
	$("#textID").keydown(function(key) {
		if (key.keyCode == 13) {// 엔터
			sendMessage();
			$('#textID').val('')
		}
	});
});
	var sock = new SockJS("<c:url value="/echo"/>");
	sock.onopen = onOpen;
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	var num = '${sessionScope.num}';
	var id = '${sessionScope.id}';
	var clnum = '${clnum}';
	var ws = null;

	function onOpen(){
		
	}
	function sendMessage() {
		sock.send(num+"!%/"+clnum+"!%/"+$("#textID").val());
	}
	function onMessage(msg) {
		var data = msg.data;
		$("#output").append(data + "<br/>");
	}
	// JSON.parse() -- String 객체를 json 객체로 변환
	// JSON.stringify -- json 객체를 String 객체로 변환
	function onClose(evt) {
		$("#output").append("연결 끊김");
	}
</script>
</html>