<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코코아톡 - 이모티콘 파일 업로드</title>
<style type="text/css">
	.imgPreview {
		display: inline-block;
	}
</style>
</head>
<body>
<section id="fileUploadContainer">
	<div>
		<h1>이모티콘 모음을 올려주세요</h1>
	</div>
	<div>
		<form method="post" action="${cp }/emoShop/uploadEmoFile" enctype="multipart/form-data">
			<label for="category">카테고리</label> <br>
				<input type="text" name="category" id="category" required> <br>
			<label for="name">이모티콘 이름</label> <br>
				<input type="text" name="name" id="name" required> <br>
			<label for="price">가격</label> <br>
				<input type="number" name="price" id="price" required> <br>
			<label for="emoticonFile">파일</label> <br>
				<input type="file" name="file" id="file" multiple="multiple" required> <br>
			<button type="submit">전송</button>
		</form>
    </div>
    <div id="previewBox">

    </div>
</section>




    <script type="text/javascript">
    
    	// 카테고리 목록 표시·추가 기능 추가할 것
    	// 이모티콘 그룹명 중복 방지·알림 기능 방법 정하고 추가할 것(ajax/alert?)
    	// 전단에서 유효성 검사하는 것으로 충분한지 검토해볼 것
    
    	var priviewBox = document.getElementById("previewBox");
		document.getElementById("file").addEventListener("change", e => {
			clearPreviewImgBox();
			for(var i=0; i<e.target.files.length; i++) {
				var file = e.target.files[i];
				
				console.log(file);
				if(!checkExt(file.name)) {
					alert("jpg, jpeg, gif, png, webp 파일만 업로드 가능합니다.");
					clearPreviewImgBox();
					e.target.value = "";
					return;
				}
				
	            var reader = new FileReader();
	            reader.onload = ((e, data) => { return e => {
                		var previewImg = "<div class='imgPreview'><img src='" + e.target.result + "' title='" + escape(e.target.name) + "'/></div>"; // ['<div><img src="', e.target.result, '" title="', escape(theFile.name), '"/></div>'].join(''); 으로 .join() 활용도 가능
                		previewBox.innerHTML+=previewImg;
            		};
            	})(file);
	            reader.readAsDataURL(file);
			}
        });

		function checkExt(fileName) {
			var ext = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length); 
			console.log(ext);
			if(ext === 'jpg' || ext === 'jpeg' || ext === 'png' || ext === 'gif' || ext === 'webp') { // ===aivf, ===heif
				return true;
			} else {
				return false;
			}
		}
		
		function clearPreviewImgBox() {
			while(priviewBox.hasChildNodes()) {
				priviewBox.removeChild(priviewBox.firstChild);
			}
		}
	</script>
	
</body>
</html>