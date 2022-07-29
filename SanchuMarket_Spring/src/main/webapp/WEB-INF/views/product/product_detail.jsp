<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상추마켓</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/product_detail.css">

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/product_detail.js"></script>	




</head>
<body>

<div id="root">
	<%@ include file="../mainpage/header&sidebar.jsp"%>
	<input type="hidden" id="p_idx" value="${ vo.p_idx }">
	<input type="hidden" id="seller_u_idx" value="${ vo.u_idx }">
	<input type="hidden" id="buyer_u_idx" value="${ user.u_idx }">
	<div id="box" align="left">
		<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					
					<c:forEach items="${ vo.image_list }" varStatus="i" begin="1" end="${ fn:length(vo.image_list) }">
					
						<li data-target="#myCarousel" data-slide-to="i"></li>
					</c:forEach>
					
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" >
					<div class="item active">
						<img class="Pro_image" src="${pageContext.request.contextPath}/resources/imgdata/${ vo.image_list[0].imagedata }" style="width: 100%; height: 500px;">
					</div>
					
					<c:forEach var="list" items="${ vo.image_list }" varStatus="i" begin="1" end="${ fn:length(vo.image_list) }">
							<div class="item">
								<img class="Pro_image" src="${pageContext.request.contextPath}/resources/imgdata/${ list.imagedata }" style="width: 100%; height: 500px;">
							</div>
					</c:forEach>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" 
					href="#myCarousel" data-slide="prev" style=" opacity: .2;"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control"
					href="#myCarousel" data-slide="next" style=" opacity: .2;"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div><!-- 캐러셀 끝 -->

		<div id="user_info">
			<div id="user_img">
				<img src="${ pageContext.request.contextPath }/resources/image/image_upload.png" width="100px" height="100px" style="margin-top:5px; border-radius: 50px;">
			</div>
			<div id="u_nickname"><a href="../sellerpage/list.do?u_idx=${vo.u_idx}" style="text-decoration: none; color: black;">${ vo2.u_nickname }</a></div>
			<br>
			<div style="margin-left:30px; display: inline-block;">${ vo.p_location }</div>
			<br>
			<!-- 찜등록 -->
			<div style="margin-left:30px; margin-top:20px; display: inline-block;">
				
				<button type="button" id="jjim_on" class="btn" onclick="jjimOn();" style=" background-color: rgb(200,200,200); width: 75px; display: none;">
					<span style="color: white; font-size: 20px;">찜 ♥</span>
				</button>
				<button type="button" id="jjim_off" class="btn" onclick="jjimOff();" style=" background-color: rgb(156,247,117); width: 75px; display: none;">
					<span style="color: white; font-size: 20px;">찜 ♥</span>
				</button>
			</div>
			
			<!-- 상품이 거래가 가능하다면 -->
			<c:if test="${ vo.p_status eq '거래가능'}">
			<div style="display: inline-block;">
				<!-- 거래하기 버튼 클릭시,  -->
				<button type="button" class="btn" onclick="trade(${ vo.p_idx });" style=" background-color: rgb(240,240,240); width: 100px;">
					<span style="color: black; font-size: 20px;">거래하기</span>
				</button>
			</div>
			</c:if>
			
			
			<div style="display: inline-block;">
			<!-- 상품이 거래중이면 -->
			<c:if test="${ vo.p_status eq '거래중'}">
				<!-- 판매자는 판매하기 버튼이 보이게 -->
				<c:if test="${ vo.u_idx eq user.u_idx}">
					<button type="button" class="btn" onclick="sell(${ vo.p_idx });" style=" background-color: red; width: 100px;">
						<span style="color: black; font-size: 20px;">판매하기</span>
					</button>
				</c:if>
				
				<!-- 다른사람들에겐 얼럿띄우기 -->
				<c:if test="${ vo.u_idx ne user.u_idx }">
					<button type="button" class="btn" onclick="alert('거래중인 상품입니다.')" id="trade_on"
					style=" background-color: rgb(240,240,240); width: 100px; display: none;">
						<span style="color: black; font-size: 20px;">거래중</span>
					</button>
				</c:if>
				<button type="button" class="btn" onclick="alert('거래중취소합니다.')" id="cancel_trade"
				style=" background-color: rgb(240,240,240); width: 100px; display: none;">
					<span style="color: black; font-size: 20px;">취소하기</span>
				</button>
			</c:if>
			</div>
			
			<c:if test="${ vo.p_status eq '판매완료'}">
			<div style="display: inline-block;">
				<button type="button" class="btn" style=" background-color: rgb(240,240,240); width: 100px;">
					<span style="color: black; font-size: 20px;">판매완료</span>
				</button>
			</div>
			</c:if>
				
		</div><!-- 회원정보 끝 -->
		
		<div style=" margin:auto; clear: both; width: 800px;">
		
			<div style="width: 800px;"><span id="p_name">${ vo.p_name }</span></div>
			<div style="display: inline-block; min-width: 100px;"><span>
			<c:if test="${ vo.c_idx eq 1}">
				남성의류
			</c:if> <c:if test="${ vo.c_idx eq 2}">
				여성의류
			</c:if> <c:if test="${ vo.c_idx eq 3}">
				도서/문구
			</c:if> <c:if test="${ vo.c_idx eq 4}">
				음반/악기
			</c:if> <c:if test="${ vo.c_idx eq 5}">
				가전
			</c:if> <c:if test="${ vo.c_idx eq 6}">
				뷰티/미용
			</c:if>
					</span></div>
			<div style="display: inline-block;"><span>${ vo.p_time }</span></div>
			<div><span id="p_price"><fmt:formatNumber pattern="#,###" value="${vo.p_price}"></fmt:formatNumber></span>&nbsp;원</div>
			<div style="margin-top: 50px;">${ vo.p_exp }</div>
		
		</div> <!-- 상품정보 끝 -->
	<c:if test="${ user.u_idx eq vo.u_idx }">
		<div align="right">
			<input type="button" class="btn btn-warning" value="상품수정" style=""
			id="modifyButton" onclick="location.href='modify_form.do?p_idx=${ vo.p_idx }'">
		</div>	
	</c:if>	
	
	<div style="min-height: 200px;"></div>
		
	</div>
	
	
</div>



</body>
</html>