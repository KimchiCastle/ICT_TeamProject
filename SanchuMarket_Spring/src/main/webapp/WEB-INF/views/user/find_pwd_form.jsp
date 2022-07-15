<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--jquery-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--boot strap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--google font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!--JavaScript-->
<script type="text/javascript" src="../resources/js/find_form.js"></script>
<!--CSS-->
<link rel="stylesheet" 
      href="${ pageContext.request.contextPath }/resources/css/pwd_form.css">
</head>

<body>
 <div id="box" class="text-center" id="form">
    <a href="../mainpage/list.do"><img class="mb-4" src="../resources/image/상추마켓.png" alt="" width="300" height="100"></a>
    <div id="login-form">
	</div>
	
	<div class="input-form">
      <input class="form-control" id="u_id" name="u_id" placeholder="이름">
    </div>
    
    <div class="input-form">  
      <input type="password" class="form-control" id="u_pwd" name="u_pwd" placeholder="아이디" autocomplete="false">
	</div>
	
    <div class="input-form">  
      <input type="password" class="form-control" id="u_pwd" name="u_pwd" placeholder="이메일" autocomplete="false">
	</div>

    <div id="button-wrap">
    <button class="w-50 btn btn-md" id="login_btn" onclick="send();">로그인</button>
    </div>
      
    <div>
      <span id="loginMsg"></span>
    </div>
    
    <p class="mt-5 mb-3 text-muted" align="center">한국 ICT 인재개발원</p>
  
  </div>


</body>
</html>