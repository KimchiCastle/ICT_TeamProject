<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근본상품</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<style type="text/css">

	body{
	 	font-family: 'Gowun Dodum', sans-serif;
		font-size: 18px;
	}

	#floater{
		text-align: center;
		width: 100px;
		height: 300px;
		padding: 3px;
		
	}
	
	#recentBanner{
		border: 1px solid black;
		text-align: center;
		width: 100%;
		height:250px;
		background-color: white;
	}
	
	#text_p{
		padding-top: 	5px;
		padding-bottom: 5px;
	}
	
	#top_move{
		margin-top: 10px;
		width: 100%;
		
	}
	#top_button{
		background: white;
		border: 1px solid black;
		width: 100%;
		height: 40px;
		cursor: pointer;
	}
	.recentimg{
		width: 60px;
		height: 60px;
	}
	
</style>

</head>
<body>

<div id="floater">
	<div>
		<div id="recentBanner">
			<div  id="text_p">
				<span>최근 본 상품</span>
			</div>
			<div class="recentView" id="recentView">
			<c:forEach var="cookielist" items="${ cookielist }">
				<c:forEach var="recentimg" items="${ cookielist.image_list }">
					<div>
						<a href="#"><img class="recentimg" src="../imgdata/${ recentimg.sumimage }"></a>
					</div>
				</c:forEach>
			</c:forEach>
				<div>
					<button onclick="slider(-1)">&lt;</button>
					<span id="now">1</span>/<span id="total">1</span>
					<button onclick="slider(1)">&gt;</button>
				</div>
			</div>
		</div>

	</div>
		<div id="top_move">
		<button id="top_button" onclick="window.scrollTo(0,0);">TOP</button>
	</div>
</div>


</body>
</html>