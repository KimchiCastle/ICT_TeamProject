<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<a href="#">
				<span class="recent_content"><img class="recentimg"
					src="../imgdata/${ recentimg.sumimage }">
				<span id="recent_name">${ cookielist.p_name }</span></span></a>
				
				<img class="recentimg"
					src="../imgdata/${ recentimg.sumimage }">
			</div>
		</c:forEach>
	</c:forEach>
</body>
</html>