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
				<div class="recent_content"><img class="recentimg"
					src="${ pageContext.request.contextPath }/resources/imgdata/${ recentimg.imagedata }"> </div>
				
				<img class="recentimg"
					src="${ pageContext.request.contextPath }/resources/imgdata/${ recentimg.imagedata }">
			</div>
		</c:forEach>
	</c:forEach>
</body>
</html>