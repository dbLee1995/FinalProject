<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>친구추가</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/JqueryUi/css/jquery-ui4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/icomoon.css">

<style type="text/css">
	body{background-color: #f8f9fa !important;}
	#tabs{border: none;}
	#ui-id-1{margin-left: 15px;}
	#ui-id-2{margin-left: 55px;}
	#tabs-2{text-align: center; }
	#tabs-1{text-align: center;}
	.searchs{border: 2px solid #3383bb;}
	.icon-search{display: inline; color:#3383bb;}
	
	#phone{background-color: #f8f9fa !important;height: 30px;border: 0px solid black; color:#95bad3;}
	#idSearch{background-color: #f8f9fa !important;height: 30px;border: 0px solid #f8f9fa !important; color:#95bad3;}
	 input[type=text]:focus {outline:none;color:#3383bb;}
	 input[type=button] {border:none;color:#3383bb;}
	 a:focus{outline:none;}
	 .content p{font-size: larger;color: #383434;}
	 #tabs-2 .content {margin-top:20px;}
	 #tabs-1 .content {margin-top:20px;}
	 .content span{color:#838181;}
	 .btns{background-color: #ececec; margin-top: 20px;  width: 150px; height: 60px; color: #3383bb;font-weight: bold;}
	 .img{border-radius: 50%;background-size: cover;background-repeat: no-repeat;background-position: center center;    width: 120px;    margin-left: 115px;  height: 120px;    position: relative;    display: block;}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/JqueryUi/jquery-ui.js"></script>
<script type="text/javascript">
  $( function() {

	  
    $( "#tabs" ).tabs();
    $("input[type=text]").focus(function(){
    	$(this).css("color","#2971a3");
    	
    	if(this.value=="이름을 입력하세요"){
    		this.value="";
    	}else if(this.value=="전화번호를 입력하세요(-포함)"){
    		this.value="";  			
		}
    });
    $("input[type=text]").blur(function(){
    	if(this.value==""){
    		if(this.id=="name"){	
    			this.value="이름을 입력하세요";
    			$(this).css("color","#95bad3");
    		}else if(this.id=="phone"){
				this.value="전화번호를 입력하세요(-포함)";   
				$(this).css("color","#95bad3");
    		}
    	}
    });
   $("#idSearch").on('keyup', function(e) {
		  if (e.which == 13) {
				searchId(this.value,'${sessionScope.num}');
		    return false;
		  }
		});
   $("#phone").on('keyup', function(e) {
		  if (e.which == 13) {
				searchPhone(this.value,'${sessionScope.num}');
		    return false;
		  }
		});
    function searchId(id,num){
    	$.ajax({
            type: "post",
            url: "${cp}/friends/searchId",
            data: {
            	id:id,
            	num:num
            },
            success: function (response) {
            	$("#tabs-2 .content").empty();
            	$(response).each(function(){
            	if(this.isme){
            		var str="<a href='/fproject/story/list?num="+this.num+"' class='img img-2' style='background-image:url(${cp}/resources/upload/"+this.profileimg+");'></a>"
					+"<p>"+this.name+"</p>"
					+"<input type='button' value='나와의 대화'  id='messageBtn' class='btns' onclick='gomymessage("+this.fnum+")'>";
		$("#tabs-2 .content").append(str);
            	}else if(this.isfri){
            		var str="<a href='/fproject/story/list?num="+this.fnum+"' class='img img-2' style='background-image:url(${cp}/resources/upload/"+this.profileimg+");'></a>"
            					+"<p>"+this.name+"</p>";
            					if(this.msg!=null){
            						str=str	+"<span>"+this.msg+"</span><br>";
            					}
            					str=str+"<input type='button' value='1:1대화'  id='messageBtn' class='btns' onclick='gomessage("+this.fnum+")'>";
            		$("#tabs-2 .content").append(str);
            	}else if(this.nomem){
            		var str="<p>'"+id+"'를 찾을수 없습니다 </p>"
            			+"<span>입력하신 아이디로 등록한 회원이 없습니다</span><br>"
            			+"<span>아이디를 확인해 주세요</span>";
					$("#tabs-2 .content").append(str);
            	}else if(this.ismem){
            		var str="<a href='/fproject/story/list?num="+this.fnum+"' class='img img-2' style='background-image:url(${cp}/resources/upload/"+this.profileimg+");'></a>"
					+"<p>"+this.name+"</p>";
            		if(this.msg!=null){
						str=str	+"<span>"+this.msg+"</span><br>";
					}
					str=str+"<input type='button' value='친구추가'  id='IdaddFriBtn' class='btns' onclick='addfri(${sessionScope.num},"+this.num+")'>";
					$("#tabs-2 .content").append(str);
            	}
            	});
            }
        
   	 });
    }
    function searchPhone(phone,num){
    	$.ajax({
            type: "post",
            url: "${cp}/friends/searchPhone",
            data: {
            	phone:phone,
            	num:num
            },
            success: function (response) {
            	$("#tabs-1 .content").empty();
            	$(response).each(function(){
            	if(this.isme){
            		var str="<a href='/fproject/story/list?num="+this.num+"' class='img img-2' style='background-image:url(${cp}/resources/upload/"+this.profileimg+");'></a>"
					+"<p>"+this.name+"</p>"
					+"<input type='button' value='나와의 대화'  id='messageBtn' class='btns' onclick='gomymessage("+this.fnum+")'>";
		$("#tabs-1 .content").append(str);
            	}else if(this.isfri){
            		var str="<a href='/fproject/story/list?num="+this.fnum+"' class='img img-2' style='background-image:url(${cp}/resources/upload/"+this.profileimg+");'></a>"
            					+"<p>"+this.name+"</p>";
            					if(this.msg!=null){
            						str=str	+"<span>"+this.msg+"</span><br>";
            					}
            					str=str+"<input type='button' value='1:1대화'  id='messageBtn' class='btns' onclick='gomessage("+this.fnum+")'>";
            		$("#tabs-1 .content").append(str);
            	}else if(this.nomem){
            		var str="<p>'"+phone+"'를 찾을수 없습니다 </p>"
            			+"<span>입력하신 전화번호로 등록한 회원이 없습니다</span><br>"
            			+"<span>전화번호를 확인해 주세요</span>";
					$("#tabs-1 .content").append(str);
            	}else if(this.ismem){
            		var str="<a href='/fproject/story/list?num="+this.fnum+"' class='img img-2' style='background-image:url(${cp}/resources/upload/"+this.profileimg+");'></a>"
					+"<p>"+this.name+"</p>";
            		if(this.msg!=null){
						str=str	+"<span>"+this.msg+"</span><br>";
					}
					str=str+"<input type='button' value='친구추가'  id='IdaddFriBtn' class='btns' onclick='addfri(${sessionScope.num},"+this.num+")'>";
					$("#tabs-1 .content").append(str);
            	}
            	});
            }
        
   	 });
    }
   
  });
  </script>  
</head>
<body>
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">연락처로 친구 추가</a></li>
    <li><a href="#tabs-2">ID 검색</a></li>
    
  </ul>
  <div id="tabs-1">
    <div class="searchs">
    	<input type="text" id="phone" size="35" value="전화번호를 입력하세요(-포함)">    	
    </div>
    <div class="content">
    	<p>연락처로 친구를 추가할수 있습니다</p>
    	<span>추가하고 싶은 친구의 이름과</span><br>
    	<span>휴대전화 번호를 입력해 주세요</span>
    </div>
    
  </div>
  <div id="tabs-2">
  	<div class="searchs">
    	<div class='icon-search'></div><input type="text" id="idSearch" size="35" >
    </div>
    <div class="content">
    	<p>아이디로 친구를 추가하세요</p>
    	<span>상대가 코코아 아이디를 등록한경우</span><br>
    	<span>아이디로 친구찾기가 가능합니다.</span>
    </div>
  </div>
  
</div>
<script type="text/javascript">

function addfri(num,fnum){
	$.ajax({
        type: "get",
        url: "${cp}/friends/addfri",
        data: {
        	num:num,
        	fnum:fnum
        },
        success: function (response) {
        	window.opener.location.reload(); 
        	window.close();
    }
});
}

function gomessage(fnum){
	window.opener.location.href="../CreateChat?num=${sessionScope.num}&fvalue="+fnum;
	window.close();
}
function gomymessage(){
	window.opener.location.href="../CreateChat?num=${sessionScope.num}&fvalue=${sessionScope.num}";
	window.close();
}
</script>
</body>
</html>