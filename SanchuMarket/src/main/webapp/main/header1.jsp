<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

header {
	position: fixed;
	left: 50%;
	transform: translateX( -50% );
	margin: auto;
	padding-left: 30px;
	padding-right: 30px;
	border-bottom: 1px solid black;
	/* width: 1200px; */
	height: 150px;
}

.header{
	width: 1150px;
	margin: auto;
	margin-top: 20px;
	float: left;
}

.logo{
	width: 200px;
	float: left;
	margin-left: 70px;
}
.search{
	width: 500px;
	float: left;
	margin-left: 70px;
}
#search{
	margin-top : 7px;
	width: 400px;
	height: 35px;
}
.btn_place{
	margin-top : 9px;
	width: 260px;
	float: left;
	align-items: center;
}

.btn{  
	text-decoration: none;
	text-align: center;
}

.btn > img {
	margin-top: 5px;
}




.content{
	height: 2000px;
}
</style>
</head>
<body>
<div>

<header>
	<div class="header">
		<a class="logo" href=""><img src="../image/상추마켓.png" width="200" height="50"></a>
		<div class="search">
			<input id="search" type="text" >
		</div>
		<div class="btn_place">
			<a class="btn" href=""><img src="../image/sell.png" width="30px">판매하기</a>
			<a class="btn" href=""><img src="../image/mypage.png" width="30px">마이페이지</a>
		</div>
	</div>
</header>

</div>

</body>
</html>