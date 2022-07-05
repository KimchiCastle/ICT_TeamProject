<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style type="text/css">
	body{
		font-family: 'Gowun Dodum', sans-serif;
	}
	
	.i{
		/* background-color:#ccffcc; */
		padding-top: 145px;
		width: 1050px;
		margin: auto;
	}
	
	#seller-box{
		display: inline-block; 
		height: 300px; 
		width: 100%;
	}
	
	#seller-pictrue{
		
		float:left;
		height: 300px;
		background-color: #ccccff;
		width: 300px;
		
		display: inline-block;
	}
	#seller-page1{
		
		clear:both;
		
		height: 300px;
		background-color: #ffcccc;
		width: 750px;
		display: inline-block;
	}
	#seller-page2{
		margin-left:20px;
		height: 100%;
		background-color: #cccccc;
		width: 95%;
		display: inline-block;
	}

	
	
</style>
</head>
<body style="background-color: #f7f7f7;">
<div>
	<%@ include file="../mainpage/header&sidebar.jsp"%>
</div>
<div class="i">
	<div>
		<div id="seller-box" >
			
			<div id="seller-pictrue">
				왜 안나와
			</div>
			<div  id="seller-page1">
				
				<div id="seller-page2">
					나오는데?
				</div>
				
			</div>
		
		</div>

		<div>

			<hr>
			<h3 style="margin: 0px; padding-left: 15px;">판매자가 올린 상품입니다.</h3>

		</div>
		<%@ include file="../mainpage/content.jsp"%>

	</div>

</div>





</body>
</html>