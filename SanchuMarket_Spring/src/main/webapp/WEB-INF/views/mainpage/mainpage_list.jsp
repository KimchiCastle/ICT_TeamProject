<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상추마켓</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
	height: 1000px;
	
	
}

.body{
	z-index: 999px;
}


</style>
</head>
<body>
<div class="body">
		<%@include file="header&sidebar.jsp"%>
</div>
<div style="padding-top: 140px; width: 1035px; margin: auto; ">
	<!-- 검색 안했을 때 -->
	<c:if test="${ empty param.searchtext and  empty param.c_idx }" var="param">	
		<h3 style="margin: 0px; padding-left: 15px;">최근 올라온 상품</h3>
	</c:if>
	<!-- 검색결과 -->
	<c:if test="${ not empty param.searchtext }" var="param">	
		<h3 style="margin: 0px; padding-left: 15px;">"${ param.searchtext }" 에 대한 검색결과</h3>
	</c:if>
	<!-- 카테고리 -->
	<c:if test="${ param.c_idx == 1 }" var="param">	
		<h3 style="margin: 0px; padding-left: 15px;">남성의류 카테고리</h3>
	</c:if>
	<c:if test="${ param.c_idx == 2 }" var="param">	
		<h3 style="margin: 0px; padding-left: 15px;">여성의류 카테고리</h3>
	</c:if>
	<c:if test="${ param.c_idx == 3 }" var="param">	
		<h3 style="margin: 0px; padding-left: 15px;">도서/문구 카테고리</h3>
	</c:if>
	<c:if test="${ param.c_idx == 4 }" var="param">	
		<h3 style="margin: 0px; padding-left: 15px;">음반/악기 카테고리</h3>
	</c:if>
	<c:if test="${ param.c_idx == 5 }" var="param">	
		<h3 style="margin: 0px; padding-left: 15px;">가전제품 카테고리</h3>
	</c:if>
	<c:if test="${ param.c_idx == 6 }" var="param">	
		<h3 style="margin: 0px; padding-left: 15px;">뷰티/미용 카테고리</h3>
	</c:if>
	
	
	
	
</div>

	<div style="margin-top: 0px;">
		<%@include file="content.jsp"%>
</div>
</body>
</html>