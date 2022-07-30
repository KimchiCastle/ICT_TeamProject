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



</style>

<script type="text/javascript">




function send1() {
	
	var search1 = document.getElementById('searchtext').value;
	
	//검색어가 있을때 검색.
	if( search1 !="" ){		
		location.href = "list.do?searchtext=" + encodeURIComponent(search1);
		return;
	}
	//검색어가 비었을 때 전체검색
	if( search1 == "" ){
		location.href = "list.do";
		return;
	}
	
}

$(function() {

	$(".searchtext").on("keyup", function(key) {
		if (key.keyCode == 13) {
			send1();
			
		}
	});
	
});
	

</script>

<script type="text/javascript">

var regular_price = /^[0-9]*$/

<!-- 가격 필터링 검색 -->	
function price_search() {
		
		
	
	var min_p = $("#min_p").val().trim();
	var max_p = $("#max_p").val().trim();
	var searchtext = $("#searchtext").val().trim();
	
	if(!regular_price.test(min_p)){
		alert('숫자만 입력 가능합니다.');
		$("#min_p").val('');
		$("#min_p").focus();
		return;
	}
	
	if(!regular_price.test(max_p)){
		alert('숫자만 입력 가능합니다.');
		$("#max_p").val('');
		$("#max_p").focus();
		return;
	}
	
	if(min_p == ""){
		alert('최소가격을 입력해주세요');
		$("#min_p").val('');
		$("#min_p").focus();
		return;
	}
	
	if(max_p == ""){
		alert('최대가격을 입력해주세요');
		return;
	}
	
	if(min_p != "" && max_p != "" && searchtext != ""){		
		location.href = "list.do?min_p="+ min_p + "&max_p=" + max_p + "&searchtext=" + searchtext;
		return;
	}
	if(min_p != "" && max_p != ""){		
		location.href = "list.do?min_p="+ min_p + "&max_p=" + max_p;
		return;
	}
	
	
	
}

//	최소가격에 커서 올렸을 때 엔터처리
$(function() {

	$("#min_p").on("keyup", function(key) {
		if (key.keyCode == 13) {
			price_search();
		}
	});

});

//	최대 가격에 커서 올렸을 때 엔터처리
$(function() {

	$("#max_p").on("keyup", function(key) {
		if (key.keyCode == 13) {
			price_search();
		}
	});

});

</script>
</head>
<body>
<div class="body">
		<%@include file="header&sidebar.jsp"%>
</div>
<div style="padding-top: 140px; width: 1035px; margin: auto; ">
	<!-- 검색 안했을 때 -->
	<c:if test="${ empty param.searchtext and empty param.c_idx and empty param.min_p and empty param.max_p}" var="param">	
		<h3 style="margin: 0px; padding-left: 15px;">최근 올라온 상품</h3>
	</c:if>
	
	<!-- 가격, 상품명 검색 -->
	<c:if test="${ not empty param.searchtext and empty param.c_idx and not empty param.min_p and not empty param.max_p}" var="param">	
		<h3 style="margin: 0px; padding-left: 15px;">${ param.min_p }원 ~ ${ param.max_p }원의 "${ param.searchtext }" 에 대한 검색결과</h3>
	</c:if>
	
	<!-- 가격 검색 -->
	<c:if test="${ empty param.searchtext and empty param.c_idx and not empty param.min_p and not empty param.max_p}" var="param">	
		<h3 style="margin: 0px; padding-left: 15px;">${ param.min_p }원 ~ ${ param.max_p }원의 상품</h3>
	</c:if>

	<!-- 상품 검색 -->
	<c:if test="${not empty param.searchtext and empty param.c_idx and empty param.min_p and empty param.max_p }" var="param">	
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
	
	
	
	
		<%@include file="content.jsp"%>
</div>

</body>
</html>