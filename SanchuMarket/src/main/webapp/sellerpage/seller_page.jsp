<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

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
		background-color: white;
		display: inline-block; 
		height: 300px; 
		width: 100%;
		border: 1px solid rgb(230, 230, 230);
	}
	
	#seller-pictrue{
		
		float:left;
		display: inline-block;
		height: 300px;
		/* background-color: #ccccff; */
		width: 300px;
		
	}
	#seller-page1{
		
		clear:both;
		
		height: 300px;
		/* background-color: #ffcccc; */
		width: 750px;
		display: inline-block;
	}
	#seller-page2{
		margin-left:20px;
		height: 100%;
		/* background-color: #cccccc; */
		width: 95%;
		display: inline-block;
	}

	#seller-info1{
		
		justify-content: space-between;
		display: flex;
		align-items: center;
		width:100%;
		height: 25%;
		/* background-color: #ccffcc; */
	}
		
	#seller-info2{
		justify-content: space-between;
		display: flex;
    	align-items: center;
		width: 100%;
		height: 100px;
		border-top: 1px solid rgb(230, 230, 230);
		border-bottom: 1px solid rgb(230, 230, 230);
		
	
	}
	
	#seller-info3{
		
		/* float:left; */
		display: flex;
		width: 100%;
		height: 30%;
		/* background-color: #eeffee; */
	
	}
	#seller-info4{
		
		/* float:left; */
		display: flex;
		width: 100%;
		height: 20%;
		/* background-color: #ffeeee; */
	
	}
	
	#nickname{
		font-size: 25px;
		height: 100%;
	    display: flex;
	    align-items: center;
	    
	}
	#mark{
		height: 100%;
	    display: flex;
	    align-items: center;
	    font-size: 15px;
	}
	#u_regdate,#u_listcount,#u_like{
		height: 100%;
	    display: flex;
	    align-items: center;
	    margin-right: 30px;
	    
	}
	

	
	
	
</style>
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
					
					</div>
					<div id="seller-info4">
					
					</div>
				</div>
				
			</div>
		
		</div>

		<div>

			<hr>
			<h3 style="margin: 0px; padding-left: 15px;">판매자가 올린 상품</h3>

		</div>
		<%@ include file="../mainpage/content.jsp"%>

	</div>

</div>





</body>
</html>