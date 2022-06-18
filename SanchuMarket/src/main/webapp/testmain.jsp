<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#main{
		
		width: 800px;
		height: 1500px;
		background: #ccccff;
		float: left;
	}
	
	#recent{
		margin-left: 100px;
		float: left;
		position: sticky;
		top: 100px;
	}
	
</style>




</head>
<body>

	<div id="main">
	<% for(int i=0; i<100; i++) {%>
	메인늘리기용<%= i %><br>
	<%} %>
	</div>
	<div id="recent">
		<%@ include file="/sidebar/sideBar.jsp"%>
	</div>
	<div style="clear: both;"></div>


</body>
</html>