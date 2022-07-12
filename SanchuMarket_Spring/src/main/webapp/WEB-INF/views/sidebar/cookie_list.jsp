<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="cookielist" items="${ cookielist }">
		<c:forEach var="recentimg" items="${ cookielist.image_list }">
			<div class="recent_hober">
				
				<div class="recent_content" >
				<div style="display: inline;">
				 <img class="recentimg"
				src="${ pageContext.request.contextPath }/resources/imgdata/${ recentimg.imagedata }">
				</div>
				<div class="recent_text">${ cookielist.p_name }</div>
				<div class="recent_text1">가격 : <span style="color: red"><fmt:formatNumber pattern="#,###" value="${ cookielist.p_price }"/></span>원</div>
				
				
				</div>
				
				
								
				<img class="recentimg"
					src="${ pageContext.request.contextPath }/resources/imgdata/${ recentimg.imagedata }">
				
			</div>
		</c:forEach>
	</c:forEach>
	
	
			<%-- 	${last_page } --%>
				
</body>
</html>