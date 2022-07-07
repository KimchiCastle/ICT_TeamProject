<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상추마켓</title>
<link href="../image/상추.png" rel="shortcut icon" type="image/x-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<style type="text/css">
body{
	margin: 0px;
	background-color: white;
	font-family: 'Gowun Dodum', sans-serif;
	font-size: 18px;
}

</style>
</head>
<body>
<div class="body">
		<%@include file="header&sidebar.jsp"%>
</div>
<div style="padding-top: 140px; width: 1035px; margin: auto; ">
	<h3 style="margin: 0px; padding-left: 15px;">최근 올라온 상품</h3>
</div>

	<div style="margin-top: 0px;">
		<%@include file="content.jsp"%>
</div>
</body>
</html>