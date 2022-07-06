<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상추마켓</title>
<link href="../image/상추.png" rel="shortcut icon" type="image/x-icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style type="text/css">

	.body1{
		padding-top: 131px;
	
	}
</style>
<script type="text/javascript">

function del(c_idx){
	
	if(confirm("정말 삭제하시겠습니까?")==false)return;
	
	location.href = "product_delete.do?p_idx=" + p_idx ; //CartDeleteAction
}


//jQuery 초기화
$(document).ready(function(){
	
	$("#check_all").click(function(){
		
		var checked = $(this).is(":checked");
		//console.log(checked);
		$("input[name='p_idx']").prop("checked",checked);
		
	});
	
	//각각의 체크박스가 클릭되면 
	$("input[name='p_idx']").click(function(){
		
		//체크박스의 총 갯수 : length
		//체크박스중 체크된 박스 갯수 : length 
		var total_count = $("input[name='p_idx']").length;
		var checked_count = $("input[name='p_idx']:checked").length;
		
		if(total_count==checked_count)
			$("#check_all").prop("checked",true);
		else if (total_count!=checked_count)
			$("#check_all").prop("checked",false);
	});
	
});
</script>
</head>
<body>
<div>
		<%@include file="../mainpage/header&sidebar.jsp"%>
</div>
<div class="body1">
	<jsp:include page="mypage_main.jsp" />
	<form>
		<div id="box" align="center">
			<table id="table" class="table table-hover" align="center" width="600" border="1"
			 style="border-collapse:collapse;" cellpadding="4" cellspacing="0">
				<br>
				<tr>
					<th>선택</th>
					<th>사진</th>
					<th>상품명</th>
					<th>가격</th>
					<th>판매상태</th>
					<th>올린날짜</th>
					<th>기능</th>
				</tr>
				<br>

				<!-- data없는 경우 -->
				<c:if test="${empty list}">
					<tr>
						<td colspan="7" align="center">
						<font color="red">등록된 상품이 없습니다</font></td>
					</tr>
				</c:if>
				<!-- data 있는 경우-->
				<c:forEach var="vo" items="${list }">
					<tr>
						<td><input type="checkbox" name="p_idx" value="${vo.p_idx}"></td>
						<td><img src="../images/${vo.sumimage}" ></td>
						<td>${vo.p_name }</td>
						<td>${vo.price }</td>
						<td>${vo.p_status }</td>
						<td>${vo.p_date }</td>
						<td align="center">
							<input id="button" type="button" value="상세정보보기"onclick="location.href='/product/detail.do';"><br> 
							<input id="button" type="button" value="삭제하기" onclick="del('${vo.p_idx}');">
						</td>
					</tr>
				</c:forEach>
			</table>
			<div>
			<!-- 회원인 경우 노출되는 메뉴 -->
			  <c:if test="${not empty sessionScope.user }">
			  	<div>
			  		<input type="button" value="상품등록"
			  				onclick="location.href='/product/insert.do';">
			  	</div>
			  </c:if>
			</div>
		</div>
	</form>
</div>
	
</body>
</html>











