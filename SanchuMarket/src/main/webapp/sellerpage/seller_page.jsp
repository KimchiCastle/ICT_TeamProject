<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style type="text/css">
	body{
		font-family: 'Gowun Dodum', sans-serif;
	}
	.i{
		background-color:#ccffcc;
		padding-top: 140px;
		width: 1050px;
		margin: auto;
	}
</style>
</head>
<body style="background-color: #f7f7f7;">
<div>
	<%@ include file="../mainpage/header&sidebar.jsp"%>
</div>
<div class="i">
	<div>
		<div style="background-color: #ffcccc; display: inline-block; height: 150px; width: 150px;">
		</div>

		<div>

			<hr>
			<h3 style="margin: 0px; padding-left: 15px;">판매자가 올린 상품입니다.</h3>

		</div>
		<%@ include file="../mainpage/content.jsp"%>

	</div>

</div>





</body>
</html>