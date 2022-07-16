<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!--font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<!--JavaScript-->
<script type="text/javascript" src="../resources/js/login_form.js"></script>
<!--CSS-->
<link rel="stylesheet" 
      href="${ pageContext.request.contextPath }/resources/css/login_form.css">
      
<!-- <script>
$(document).ready(function(){
    $("modal").click(function(){
        $("#IDModal").modal();
    });
});
</script> -->

</head>

<body class="text-center" id="form">

 <div id="box">
    <a href="../mainpage/list.do"><img class="mb-4" src="../resources/image/상추마켓.png" alt="" width="300" height="100"></a>
    <div id="login-form">
    <h3>로그인</h3>
	</div>
	
	<div class="input-form">
      <input class="form-control" id="u_id" name="u_id" placeholder="아이디">
    </div>
    
    <div class="input-form">  
      <input type="password" class="form-control" id="u_pwd" name="u_pwd" placeholder="비밀번호" autocomplete="false">
	</div>
	
    <div class="checkbox mb-3" style="matgin-top:20px;">
      <label>
        <input type="checkbox" value="remember-me"> 로그인 상태 유지
      </label>
    </div>
    
   <!--아이디찾기--> 
  <a data-toggle="modal" data-target="#IDModal">아이디찾기</a>&nbsp;/

  <div class="modal fade" id="IDModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <form>
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title"><label>아이디 찾기</label></h4>
	        </div>
	        
	        <div class="modal-body">
	        	<div>
	        	  <label>이름</label>
	        	  <input type="text" name="name" id="name" class="form-control">
	        	</div>
	        	<div>
	        	  <label>휴대폰번호</label>
	        	  <input type="text" name="phone" id="phone" class="form-control">
	        	</div>
	        </div>
	        
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" onclick="phoneAuth();">전화번호인증</button>
	          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        </div>
        </form>
      </div>
      
    </div>
  </div>
  
   <!--비밀번호찾기--> 
  <a data-toggle="modal" data-target="#pwdModal">비밀번호 찾기</a>
  
   <div class="modal fade" id="pwdModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Fugiat, velit.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">Read more</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
<!-- 
  <div class="modal fade" id="pwdModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">비밀번호찾기</h4>
        </div>
        
         <div class="modal-body">
        	
	        </div>  
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" onclick="emailAuth();">이메일보내기</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
      
    </div>
  </div> -->
  
  <div id="enroll">
    <a href="enroll_form.do">회원가입</a>
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