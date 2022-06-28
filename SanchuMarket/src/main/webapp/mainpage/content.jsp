<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.main{
	display:block;
	margin-left: auto;
	margin-right: auto;
	width: 1020px;
	border: 1px solid white;
}

.main_content{
margin-top: 131px;
width: 1020px;
height: 1150px;
border: 1px solid black; 
padding-top: 10px;
padding-left: 15px;

}

.product_list{
	width: 187px;
	height: 260px; 
	border: 1px solid #20de07;
	margin-right: 14px;
	margin-bottom: 15px;
	float: left;
}

#p_photo{
	width: 185px;
	height: 185px;
	border: 1px solid #d3d3d3;
}
.price_tag{
	width: 173px;
	height: 51px;
	padding: 10px 6px 10px 6px;
	border: 1px solid #d3d3d3;
}

#p_name{
	margin-bottom: 10px;
}

#p_price{
	float: left;
	font-size: 15px;
	margin-top: 2px;
	font-weight: bold;
}

#p_date{
 float: right;
 font-size: 12px;
 font-weight: bold;
 text-align: right;
 margin-top: 4px;
 color: #878793;
}

</style>

<script type="text/javascript">

	function list_click() {
		alert('클릭했다');
		return;
	}

</script>

</head>
<body>
<%@include file="header&sidebar.jsp" %> 
<div class="main">
	<!-- 메인콘텐츠 -->
	<div class="main_content">
	<h3 style="margin: 0px;">최근 올라온 상품</h3><br>
	
	<!-- 데이터 없는 경우 -->
	<c:if test="${ empty list }">
		<div id="empty_msg">등록 된 상품이 없습니다.</div>
	</c:if>
	
	
	
	<!-- 상품리스트 -->
	<!-- 데이터 있는 경우 -->
	<c:forEach  var="vo" items="${ list }">
		<div class="product_list" onclick="list_click()">
		<c:forEach var="image" items="${ vo.image_list }">
			<div id="p_photo">${ image.sumimage }</div>
		</c:forEach>
			
			<div class="price_tag">
				<div id="p_name">${ vo.p_name }</div>
				<div id="p_price">${ vo.p_price }</div>
				<div id="p_date">${ vo.p_date }</div> 
			</div>
		</div>
	</c:forEach>
	
	</div>
</div>
</body>
</html>