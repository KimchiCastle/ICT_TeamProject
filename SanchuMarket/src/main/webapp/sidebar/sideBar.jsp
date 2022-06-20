<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근본상품</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style type="text/css">
	#floater{
		
		text-align: center;
		width: 100px;
		border: 1px solid black;
		padding: 3px;
	}
	
	#recentBanner{
		text-align: center;
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
	
	
</style>

</head>
<body>

<div>
	<div id="floater">
		<span>최근 본 상품</span>
		<div id="recentBanner">
			<div class="recentView" id="recentView">
				<div>
					<a href="#"><img src="http://via.placeholder.com/50x50"></a>
				</div>
				<div>
					<a href="#"><img src="http://via.placeholder.com/50x50"></a>
				</div>
				<div>
					<a href="#"><img src="http://via.placeholder.com/50x50"></a>
				</div>
			</div>
		</div>
		<button onclick="slider(-1)">&lt;</button>
		<span id="now">1</span>/<span id="total">1</span>
		<button onclick="slider(1)">&gt;</button>

	</div>
	<div id="top_move">
		<button id="top_button" onclick="window.scrollTo(0,0);">TOP</button>
		
	</div>
</div>


</body>
</html>