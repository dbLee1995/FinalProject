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
	${sessionScope.id }
	<input type="text" value="1" id="room" disabled>
	<c:forEach var="cl" items="${ChatList }">
		<p>${cl.name }</p>
	</c:forEach>
	<table style="height=:600px; width:900px;">
		<col width="200px">
		<col width="400px">
		<col width="300px">
		<tr height="600px">
			<td style="width:500px" colspan="2">
				<div style="width:100%; height:550px; overflow-y:scroll; overflow-x:inherit;"
					id="output">
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
</body>

<script type="text/javascript">
$(document).ready(function() {
	//document.write( ip() );
	//alert(ip());
	
	/*$(function(){
		$("#textID").focus();
		if(id=='test'){
			ws=new WebSocket("ws://localhost:9090/fproject/echo");
		}else{
			ws=new WebSocket("ws://192.168.0.30:9090/fproject/echo");
			//ws=new WebSocket("ws://localhost:9090/fproject/echo");
		}
		/*function entermsg(){
			var msg=$('input[name=chatInput]').val().trim("!%/");
			var room=$("#room").val().trim("!%/");
			ws.send(msg+"!%/"+room);
			$("#output").append(id+":"+msg+"<br>");
			$("#output").scrollTop(99999999);
			$("#textID").val("");
			$("#textID").focus();
		}
		ws.onopen=function(event){
			$("#output").append("<b>방에 참여했습니다.</b><br>");
			$("#buttonMessage").click(function(){
				entermsg();
			});
			$("#textID").keypress(function(event){
				if(event.which=="13"){
					event.preventDefault();
					entermsg();
				}
			});
		};
		ws.onmessage=function(message){
			var jsonData=JSON.parse(message.data);
			if(jsonData.message!=null){
				$("#output").append(jsonData.message+"<br>");
			}
		};*/
		
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
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	var id = '${sessionScope.id}';
	var ws = null;

	function sendMessage() {
		sock.send($("#textID").val());
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