<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드</title>
</head>
<body>
<section id="fileUploadContainer">
	<div>
		<h1>이모티콘 모음을 올려주세요</h1>
	</div>
	<div>
		<form method="post" action="${cp }/emoticonShop/uploadEmoFile" enctype="multipart/form-data">
			<label for="category">카테고리</label> <br>
				<input type="text" name="category" id="category" required> <br>
			<label for="name">이모티콘 이름</label> <br>
				<input type="text" name="name" id="name" required> <br>
			<label for="price">가격</label> <br>
				<input type="number" name="price" id="price" required> <br>
			<label for="emoticonFile">파일</label> <br>
				<input type="file" name="file" multiple="multiple" required> <br>
			<button type="submit">전송</button>
		</form>
	</div>
	
</section>


	<script type="text/javascript">

	</script>
</body>
</html>