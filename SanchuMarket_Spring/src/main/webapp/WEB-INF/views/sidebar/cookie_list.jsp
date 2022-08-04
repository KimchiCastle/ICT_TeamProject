<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style type="text/css">
	
	#btn_left, #btn_right{
		background-color: white;
		width: 25px;
		height: 30px;
	}
	
	.recent_content{
		z-index: 10;
	}
	
</style>

<!-- 현재페이지/ 마지막페이지 버튼 활성화 비활성화 -->
<script type="text/javascript">

	if(${ curr_page }>1){
		
		$("#btn_left").attr("disabled",false);
	}
	
	if(${ last_page }>1){
		$("#btn_right").attr("disabled",false);
	}
	
	if(${ curr_page }==${ last_page }){
		$("#btn_right").attr("disabled",true);
	}
	

</script>



</head>
<body>
	<c:forEach var="cookielist" items="${ cookielist }">
		<c:forEach var="recentimg" items="${ cookielist.image_list }">
			<div class="recent_hober">
				<div class="recent_content">
					<!-- 최근본상품 화면 -->
					<div onclick="location.href='${pageContext.request.contextPath}/product/product_detail.do?p_idx=${ cookielist.p_idx }&p_name=${ cookielist.p_name }'">
						<div style="display: inline;">
						 <img class="recent_img"
						src="${ pageContext.request.contextPath }/resources/imgdata/${ recentimg.imagedata }">
						</div>
						<div class="recent_text">${ cookielist.p_name }</div>
						<div class="recent_price">가격 : <font color="red"><fmt:formatNumber pattern="#,###" value="${ cookielist.p_price }"/></font>원</div>
					</div>
					<!-- 쿠키삭제버튼 -->
					<div class="del_cookie"><button type="button" class="delbutton" onclick="del_cookie(${ cookielist.p_idx });">x</button></div>
				</div>
				
				
								
				<img class="recent_img"
					src="${ pageContext.request.contextPath }/resources/imgdata/${ recentimg.imagedata }">
						
			</div>
			
			
		</c:forEach>
	</c:forEach>
	
	<!-- 페이지 이동 버튼 -->
	<div>
		<input type="button" id="btn_left" onclick="slider(-1)" value="&lt;" disabled="disabled">
		<span id="now">${ curr_page }</span>/<c:if test="${ last_page eq 0 }">1
		</c:if><c:if test="${ last_page ne 0 }"><span id="total">${ last_page }</span>
		</c:if>		
		
		<input type="button" id="btn_right" onclick="slider(1)" value="&gt;" disabled="disabled">
	</div>

				
</body>
</html>