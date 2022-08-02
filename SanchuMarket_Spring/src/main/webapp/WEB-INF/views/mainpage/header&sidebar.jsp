<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style type="text/css">

body{
	margin-top: 0px;
	font-family: 'Gowun Dodum', sans-serif;
	
	min-width: 800px;
}


header{
	position: fixed;
	margin: auto;
	padding-left: 30px;
	padding-right: 30px;
	border-bottom: 1px solid #d3d3d3;
	width: 100%;
	height: 130px;
	background-color: white;
	z-index: 888;
	left: 50%;
	transform: translateX(-50%);

	
	
}

.header{
	position: fixed;
	left: 50%;
	transform: translateX( -50% );
	width: 1080px;
	margin: auto;
	margin-top: 20px;
	height: 54px;
	float: left;
	z-index: 889;
	min-width: 1150px;
}

.logo{
	width: 200px;
	float: left;
	margin-left: 70px;
	cursor: pointer;
}
.searchtext{
	width: 450px;
	height: 39px;
	float: left;
	margin-left: 70px;
	margin-right: 30px;
	margin-top: 6px;
	border: 2px solid #20de07;
}
#searchtext{
	float: left;
	width: 400px;
	padding-left: 10px;
	height: 35px;
	border: none;
	outline: none;
	
}
#searchicon{
	width: 25px; 
	height: 25px; 
	margin-top: 6px; 
	margin-left: 14px;
	cursor: pointer;

}

#search:focus{
	outline: none;
}

.btn_place{
	margin-top : 4px;
	width: 280px;
	float: left;
	align-items: center;
	cursor: pointer;
}

.btn{  
	text-decoration: none;
	text-align: center;
}

.btn > img {
	vertical-align: middle;
}


.side{
	padding-top: 130px;
	position: fixed;
	top: 70px;
	right: calc(50% - 650px);
}

li, ul{
	list-style: none;
}

.navi_bar{
	display: inline-block;
	height: 54px;
	clear: both;
	float: left;
	width: 30px;
	margin: auto;
	margin-left: 80px;
	margin-top: 15px; 
}




.menu_content{
	list-style:none;	
	width: 150px;
	float: left;
	display : none;
	position : absolute;
	z-index : 1; /*다른 요소들보다 앞에 배치*/
	margin-top : 12px;
	border: 1px solid green;
	background-color : white; 
}


.menu_content a{
	display: block;
	padding: 5px;
	text-decoration: none;
	border: 1px solid green;
}

.navi_bar:hover .menu_content {
  display: block;
}

.main_menu{
  cursor: pointer;
}

.price_area{
	display: inline-block;
	height: 35px;
	
	float: left;
	width: 500px;
	margin: auto;
	margin-left: 80px;
	
	margin-top: 15px; 
	
}

.price_area > input {
	
	text-align: right;
	width: 130px;
	height: 30px;
	border: none;
	outline: 2px solid #20de07;
	font-size: 10px;
}

#p_searchicon {
	margin-left: 10px; 
	width: 25px; 
	height: 25px; 
	cursor: pointer;
}



</style>




<!-- 숫자 입력시 콤마 처리 해주는 펑션. -->
<!-- <script type="text/javascript">
	var regular_han = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z]/;

	$(function() {

		$("#min_p").on("propertychange change keyup paste input", function() {

			var min_p = $(this).val();

			min_p = comma(uncomma(min_p));

			/* console.log(p_price); */

			$("#min_p").val(min_p);

		});

	})

	$(function() {

		$("#max_p").on("propertychange change keyup paste input", function() {

			var max_p = $(this).val();

			max_p = comma(uncomma(max_p));

			/* console.log(p_price); */

			$("#max_p").val(max_p);

		});

	})

	/* 실제 입력값을 변경해주는 함수 */
	function comma(str) {
		str = String(str);

		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	function uncomma(str) {
		str = String(str);

		if (regular_han.test(str)) {
			alert('숫자만 입력하세요');
		}

		return str.replace(/[^\d]+/g, '');
	}
</script>
<script type="text/javascript">
	function numberMaxLength(e) {
		if (e.value.length > e.maxLength) {
			e.value = e.value.slice(0, e.maxLength);
		}
	}
</script> -->










</head>
<body>
<div>

<header>
	<!-- 고정헤더 -->
	<div class="header">
		<!-- 상추마켓로고 -->
		<a class="logo"><img src="${ pageContext.request.contextPath }/resources/image/상추마켓.png" width="200" height="50" onclick="location.href='../mainpage/list.do'"></a>
		
		<!-- 검색창 -->
		<div class="searchtext" >
			<%-- <input type="hidden" id="c_idx" value="${ param.c_idx }"> --%>
			<input id="searchtext" name="searchtext" type="text" value="${ param.searchtext }" placeholder="상품명을 입력하세요.">
			<img id="searchicon" src="${ pageContext.request.contextPath }/resources/image/saerch-icon.png" onclick="send1();">

		</div>
		
		<!-- 로그인 정보가 없을 때 로그인, 회원가입 버튼  -->
		<c:if test="${ empty sessionScope.user }">
			<div class="btn_place">
				<a class="btn" onclick="location.href='../user/login_form.do'"><img src="${ pageContext.request.contextPath }/resources/image/mypage.png" width="30px">&nbsp;로그인</a>
				&nbsp;&nbsp;|&nbsp;
				<a class="btn" onclick="location.href='../user/enroll_form.do'"><img src="${ pageContext.request.contextPath }/resources/image/mypage.png" width="30px">&nbsp;회원가입</a>
			</div>
		</c:if>
	
	
		<!-- 로그인 정보가 있을 때 판매,마이페이지 버튼 -->
		<c:if test="${ not empty sessionScope.user }">
			<div class="btn_place">
				<a class="btn" onclick="location.href='../product/insert_form.do'"><img src="${ pageContext.request.contextPath }/resources/image/sell.png" width="30px">&nbsp;판매하기</a>
				 &nbsp;&nbsp;|&nbsp;
				<a class="btn" onclick="location.href='../sellerpage/list.do?u_idx=${user.u_idx}'"><img src="${ pageContext.request.contextPath }/resources/image/mypage.png" width="30px">&nbsp;마이페이지</a>
			</div>
		</c:if>
	
	
		<!-- 카테고리 -->
		<div class="navi_bar">
			<span class="main_menu"><img src="${ pageContext.request.contextPath }/resources/image/category.png" width="30px"></span>
			<div class="menu_content">
				<a href="../mainpage/list.do?c_idx=1">남성의류</a>
				<a href="../mainpage/list.do?c_idx=2">여성의류</a>
				<a href="../mainpage/list.do?c_idx=3">도서/문구</a>
				<a href="../mainpage/list.do?c_idx=4">음반/악기</a>
				<a href="../mainpage/list.do?c_idx=5">가전제품</a>
				<a href="../mainpage/list.do?c_idx=6">뷰티/미용</a>
			</div>
		</div>
		
		<!-- 가격 필터링 검색 -->
		<div class="price_area">
			<input id="min_p" type="text" oninput="numberMaxLength(this);" value="${ param.min_p }" placeholder="최소가격" style="font-size: 15px; "> ~ 
			<input id="max_p" type="text" oninput="numberMaxLength(this);" value="${ param.max_p }" placeholder="최대가격" style="font-size: 15px;">
			<img id="p_searchicon" src="${ pageContext.request.contextPath }/resources/image/saerch-icon.png" onclick="price_search();">
		</div>
		
		<c:if test="${ not empty sessionScope.user }">
			<div style="float: right; margin-right: 62px;">
				
				<a class="btn" onclick="location.href='../mypage/myjjim.do?u_idx=${ user.u_idx }'"><img src="${ pageContext.request.contextPath }/resources/image/cart.png" width="30px">&nbsp;장바구니</a>
			</div>
		</c:if>
		<c:if test="${ not empty sessionScope.user }">
			<div style="float: right; margin-right: 52px;">
				<a class="btn" onclick="location.href='../mainpage/logout.do'"><img src="${ pageContext.request.contextPath }/resources/image/mypage.png" width="30px">&nbsp;로그아웃</a>
			</div>
		</c:if>
		
	</div>
	<!-- 고정형 사이드바 -->
	<div class="side">
		<%@include file="../sidebar/sideBar.jsp" %>
	</div>
</header>
	
	



</div>

</body>
</html>