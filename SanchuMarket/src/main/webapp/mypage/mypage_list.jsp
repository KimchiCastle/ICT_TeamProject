<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="mypage_main.jsp" />
	<form>
		<div id="box" align="center">
			<table id="table" class="table table-hover" align="center" >
				<br>
				<tr>
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
						<td colspan="6" align="center">
						<font color="red">등록된 상품이 없습니다</font></td>
					</tr>
				</c:if>
				<!-- data 있는 경우-->
				<c:forEach var="vo" items="${list }">
					<tr>
						<td><img src="../images/${vo.img}" ></td>
						<td>${vo.p_name }</td>
						<td>${vo.price }</td>
						<td>${vo.p_status }</td>
						<td>${vo.p_date }</td>
						<td align="center">
							<input id="button" type="button" value="상세정보보기"onclick=""><br> 
							<input id="button" type="button" value="삭제하기" onclick="">
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
</body>
</html>











