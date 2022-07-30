<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 상세정보</title>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/seller_page.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">


<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/seller_page.js"></script>

	

</head>
<body >




<div>
	<%@ include file="../mainpage/header&sidebar.jsp"%>
</div>
<div class="i">
	<div>
		<div id="seller-box" >
			
			<div id="seller-pictrue">
				이미지
			</div> 
			<div  id="seller-page1">
				
				<div id="seller-page2">
					<div id="seller-info1">
						<div id="nickname"><b>${ user_info.u_nickname }</b></div>
						<div id="mark">인증마크</div>
					</div>
					<div id="seller-info2">
						<div id="u_regdate">마켓오픈 ${ user_info.u_regdate }일전</div>
						<div id="u_listcount">평가 회원 수 : ${ user_info.u_likecount }</div>
						<div id="u_like">회원 평점 : ${ user_info.u_like }</div>
					</div>
					<div id="seller-info3">
						${ user_info.u_profile }
					</div>
					<div id="seller-info4">
							<div style="cursor: pointer; margin-top: 10px;"
								onclick="onReport();">
								<img
									src="${ pageContext.request.contextPath }/resources/image/report_icon.png"
									width="15px" height="15px"><span
									style="font-size: 15px; color: rgb(180, 180, 180)">신고하기</span>
								
							
							
							</div>
					</div>
				</div>
				
			</div>
		
		</div>

		<div>

			<hr>
			<h3 style="margin: 0px; padding-left: 15px;">판매자가 올린 상품</h3>

		</div>
		<%@ include file="../mainpage/content.jsp"%>
		
		<div align="center" style="min-height: 200px;">
			<c:if test="${ user.u_idx eq user_info.u_idx }">
			<button class="btn" onclick="myInfoModify(${user.u_idx});"
			style="background-color: #ccffcc; width: 150px; height: 50px; outline: none;">
				<span style="font-size: 22px; color: gray;">개인정보수정</span>
			</button>
			
			<button class="btn" onclick="show_pwdcheck();"
			style="background-color: #ffaaaa; width: 150px; height: 50px; outline: none;">
				<span style="font-size: 22px; color: white;">회원탈퇴</span>
			</button>
			</c:if>
			
			
		</div>
		
	</div>

</div>

<%@ include file="password_check.jsp" %>
<%@ include file="report_popup.jsp" %>

<div class="shadow"></div>


</body>
</html>