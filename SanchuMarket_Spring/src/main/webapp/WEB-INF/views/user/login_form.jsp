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
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/login_form.js"></script>
<!--CSS-->
<link rel="stylesheet" 
      href="${ pageContext.request.contextPath }/resources/css/login_form.css">
  
<script>
  //모달창 input data 초기화 
  $(function(){
	  
	  $('[data-dismiss=modal]').on('click', function () {
		  
	    var $t = $(this),
	        target = $t[0].href || $t.data("target") || $t.parents('.modal') || [];

		  $(target)
		    .find("input,textarea,select")
		       .val('')
		       .end();
		  });

		});
  
</script>  
    
</head>

<body class="text-center">

 <div id="box">
   <div id="form">
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
 </div> 
<!--아이디찾기-->    
<a href="#idModal" data-toggle="modal">아이디찾기</a>&nbsp;/
<div class="modal fade" id="idModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
       <form onsubmit="return false">
       	  <!--header-->
	      <div class="modal-header text-center">
	        <h4 class="modal-title w-100 font-weight-bold">휴대폰 인증</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <!--body-->
	      <div class="modal-body mx-1">
	        <div class="md-form mb-5">
	          <label style="width:20%;">이름</label>
	          <input name="name" class="modalInput">
	        </div>
	
	        <div class="md-form mb-4">
	          <label style="width:20%;">휴대폰번호</label>
	          <input name="phoneNo" class="modalInput">
	        </div>
	      </div>
	      
	      <span id="idErrMsg" style=" margin-left:45px; color:red; display:none;"></span>
	      
	      <!--footer-->
	      <div class="modal-footer d-flex justify-content-center">
	        <button class="btn btn-indigo" onclick="">아이디조회</button>
	        <button class="btn btn-indigo" data-dismiss="modal">닫기</button>
	      </div>
		      
       </form>
    </div>
  </div>
</div>

<!--비밀번호찾기-->
<a class="nav-link" href="#pwdModal" data-toggle="modal" >비밀번호찾기</a>
<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form id="pwdFind_form" method="post" onsubmit="return mailSubmit();">
      	  <!--header-->	
	      <div class="modal-header text-center">
	        <h4 class="modal-title w-100 font-weight-bold">임시비밀번호 발급</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <!--body-->
	      <div class="modal-body mx-3">
	        <div class="md-form mb-5">
	          <label style="width:20%;">아이디</label>
	          <input id="id" name="id">
	        </div>
	
	        <div class="md-form mb-4">
	          <label style="width:20%;">이메일</label>
	          <input id="email" name="email">
	        </div>
	      </div>
	      
	      <span id="pwdErrMsg" style="margin-left:45px; color:red; display:none;"></span>
	      
	      <!--footer-->
	      <div class="modal-footer d-flex justify-content-center">
	        <input type="button" class="btn btn-indigo" onclick="mailSubmit();" value="인증메일발송">
	        <input type="button" class="modalBtns btn btn-indigo" data-dismiss="modal" value="닫기">
	      </div>
     
      </form>
    </div>
  </div>
</div>


  
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
  
  </div><!--end box-->


</body>
</html>