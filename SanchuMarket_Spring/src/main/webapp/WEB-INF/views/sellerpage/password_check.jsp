<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

		#password_check{
		
		font-family: 맑은굴림;
		
		display: none;
		
		width: 500px;
		height: 310px;
		
		position:absolute;
		
		z-index:890;
		
		padding: 10px;
		
		border-radius: 10px;
		
		left: 600px; 
		top: 600px;
		
		 background-color : white;
		
	}


	#password_x{
		background: white;
		color: black;
		font-size: 25px;
		
		
		vertical-align : top;
		
		border: none;
	}
	
	#result{
		margin-top: 15px;
		min-height: 30px;
	}

</style>

<script type="text/javascript">
	

</script>


</head>
<body >

<div id="password_check">
	<input type="hidden" value="${ param.p_idx }">
	<div align="right" style="margin: auto;  ">
		<button type="button" id="password_x" onclick="hide_password_popup();">x</button>
	</div>
	<div align="center" style=" vertical-align: top;">
	<span style="font-size: 30px;  ">회원탈퇴</span></div>
	<div style="margin-top:10px; border-bottom: 1px solid rgb(220,220,220);"></div>	
	<div align="center" style=" margin-top:20px; margin-left:50px; font-size:20px; display: inline-block;">
		<div align="left"  style="display:  inline-block; min-width: 120px; text-align: center; ">비밀번호</div>
	<input type="password" id="u_pwd">
	</div>
	<div align="center" style="margin-top:10px;  margin-left:50px;  font-size:20px; display: inline-block;">
		<div align="left"  style="display:  inline-block; min-width: 120px; text-align: center; ">비밀번호확인</div>
		<input type="password" id="u_pwdcheck">
	</div>
	<div align="center" id="result"><span id="result_text"></span></div>
	<div style="margin-top:10px; margin-bottom:10px; border-bottom: 1px solid rgb(220,220,220);"></div>	
	<div align="center">
		<button type="button" class="btn" style="outline: none; min-width: 70px" onclick="withdrawl();">탈퇴하기</button>
		<button type="button" class="btn" style="outline: none; min-width: 70px" onclick="hide_password_popup();">취소</button>
	</div>
</div>


</body>
</html>