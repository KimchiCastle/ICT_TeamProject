<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<!--CSS-->
<link rel="stylesheet" 
      href="${ pageContext.request.contextPath }/resources/css/login_form.css">
  
 <script>
  //모달창 input data 초기화 
  $(function(){
	  
		setTimeout(showMessage(),1000);
	  
	  $('[data-dismiss=modal]').on('click', function () {
		  
	    var $t = $(this),
	        target = $t[0].href || $t.data("target") || $t.parents('.modal');

		  $(target)
		    .find("#myName,#myPhone,#myId,#myEmail,#idErrMsg,#pwdErrMsg").val('').end();
		  
		  $(target).find('#idErrMsg').html('').end();
		  $(target).find('#pwdErrMsg').html('').end();
		  
		  });//end modal init
	  
	});//end document ready
	
	
</script>

<script type="text/javascript">

		//아이디 찾기시 유효성 판단 전역 변수
		let nameFlag = false;
		let phoneFlag = false;
		//비밀번호 찾기시 유효성 판단 전역 변수
		let emailFlag = false;
		let idFlag = false;
		
		$(function(){
		
			$('#form').on('keyup',function(e){
				if(e.keyCode==13){
					send();
				}
			});
			
			$('#myName').on('blur',function(){
				nameFlag = false;
				nameCheck();
			});
			$('#myPhone').on('blur',function(){
				phoneFlag = false;
				phoneCheck();
			});
			$('#myEmail').on('blur',function(){
				emailFlag = false;
				emailCheck();
			});
			
			$('#myId').on('blur',function(){
				idFlag = false;
				idCheck();
			}); 
			
		
			
		});//end document.ready	
		
		function showMessage(){
			 
			  if('${ user }' != null){
				  
				  var u_id = '${user.u_id}';
				  var u_pwd = '${user.u_pwd}';
				  
				  $("#u_id").val(u_id);
				  $("#u_pwd").val(u_pwd);
				  return;
			  }
			  
			  if("${ param.reason eq 'onlyadmin'}"=="true"){
				  alert('접근 제한 페이지입니다.');
			  }
			  
			  if("${ param.reason eq 'session_timeout'}"=="true"){
				  console.log('세션만료');
				  alert('세션이 만료됐습니다.');
			  }
		}

		//로그인
		function send(){
		
			var u_id = $( '#u_id' ).val();
			var u_pwd = $( '#u_pwd' ).val();
			//아이디 비밀번호 유효성 체크 > 비동기통신 
		  $.ajax({
			  type:'POST',
			  url:'login.do', 
			  data:{'u_id':u_id, 'u_pwd':u_pwd},
			  dataType:'json',
			  success:function(res){ //res = bResult
		
				  if(!res.bResult){//bResult=false
					  $('#loginMsg').html('아이디나 비밀번호가 일치하지 않습니다.');
				  	  return;
				  }else{
					 console.log("로그인실패");
					 location.href = '../mainpage/list.do';
				  }
			  },
			  //jqXHR:자바스크립트 에러 처리 객체
			  error:function(jqXHR, exception){
		
			   	  var msg = '';
		
				  if (jqXHR.status == 0) {
					msg = 'Not connect.\n Verify Network.';
			      }else if (jqXHR.status == 404) {
			    	msg = 'Requested page not found. [404]';            
			      }else if (jqXHR.status == 500) {
			        msg = 'Internal Server Error [500].';            
			      }else if (exception == 'parsererror') {                
			    	msg = 'Requested JSON parse failed.';            
			      }else if (exception == 'timeout') {                
			    	msg = 'Time out error.';            
			      }else if (exception == 'abort') {                
			    	msg = 'Ajax request aborted.';            
			      }else {                
			        msg = 'Uncaught Error.\n' + jqXHR.responseText;            
			      }
			      alert(msg);
		 	 }
		  });//end ajax
		}//end send
		
		function nameCheck(){
			
			var name = $('#myName').val();
			
			if(name==''){
				
				$('#idErrMsg').html('필수 입력값입니다.').show();
				return;
			}
			nameFlag = true;			
			$('#idErrMsg').hide();
		}
		
		function phoneCheck(){
			
			var phoneNo = $('#myPhone').val();
			var regular_phoneNo =  /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
			
			if(phoneNo==''){
				
				$('#idErrMsg').html('필수 입력값입니다.').show();
				return;
			}
			
			if(regular_phoneNo.test(phoneNo) == false){
				
				$('#idErrMsg').html('형식에 맞지 않는 전화번호입니다.').show();
				$('#myPhone').val('');
				return;
			}
			
			phoneFlag = true;
			$('#idErrMsg').hide();
		}
	
		
		//아이디찾기
		function findId(){
			
			var name = $('#myName').val();
			var phone = $('#myPhone').val();
			var id = '';
			
			if(!nameFlag || !phoneFlag){
				return;
			}
			
			$.ajax({
				url : 'findId.do',
				data : {'name':name,'phone':phone},
				dataType : 'json',
				success : function(res){
					//res = {"id":["dkwls****","dkwls*****"]}
					//          res.id[0]        res.id[1]
					
					if(res.id=='noExist'){
						
						$('#idErrMsg').html('아이디를 찾을 수 없습니다.').show();
						return false;
					}
					else{
						
					 	$("#findIdBtn").hide();
						$("#idModal").find('input, label').hide();
						
						const div = document.createElement('div');
						
						for (var i = 0; i < res.id.length; i++) {
							$("#idBodyForm").append(div,res.id[i]);
						}
							$("#idBodyForm").show();
						 
						pageInit();
					}
				},
				 error:function(jqXHR,status,exception){
					 
				   	  var msg = '';
				  
					  if (jqXHR.status == 0) {
						msg = 'Not connect.\n Verify Network.';
				      }else if (jqXHR.status == 400) {
			        	msg = 'Server understood the request, but request content was invalid. [400]'
					  }else if (jqXHR.status == 404) {
				    	msg = 'Requested page not found. [404]';            
				      }else if (jqXHR.status == 500) {
				        msg = 'Internal Server Error [500].';            
				      }else if (exception == 'parsererror') {                
				    	msg = 'Requested JSON parse failed.';            
				      }else if (exception == 'timeout') {                
				    	msg = 'Time out error.';            
				      }else if (exception == 'abort') {                
				    	msg = 'Ajax request aborted.';            
				      }else {                
				        msg = 'Uncaught Error.\n' + jqXHR.responseText;            
				      }
					  alert(msg);
					}
			});//end ajax
		}//end findId();
		
	
		
		//비밀번호 찾기 이메일유효성검사
		function emailCheck(){
			
			var email = $('#myEmail').val();
			var regularExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			if(email == ''){
				
				$('#pwdErrMsg').html('필수 입력값입니다.').show();
			
				return false;
			}
			
			if(!regularExp.test(email)){
				
				$('#pwdErrMsg').html('유효한 이메일 형식이 아닙니다.').show();
				$('#myEmail').val('');
				
				return false;
			}
			
			emailFlag = true;
			$('#pwdErrMsg').hide();
		}
		
			
		//비밀번호 찾기 아이디 유효성 검사
		function idCheck(){
			
			var id = $('#myId').val();

			console.log('아이디체크');
			
			if(id==''){
				
				$('#pwdErrMsg').html('필수 입력값입니다.').show();
				
				return false;
			}
			
			idFlag = true;
			$('#pwdErrMsg').hide();
		}
		  
		
		
		//비밀번호 찾기 아이디와 메일 존재 여부
		function checkMailId(){
			
			var submitFlag = false;
			
			//유효성 검사 통과 안할시 modal의 submit방지
			if(idFlag == false ){
				console.log('mailSubmit1');	
				return false;
			}
			if( emailFlag == false ){
				console.log('mailSubmit2');	
				return false;
			}
			
			var email = $("#myEmail").val();
			var id = $("#myId").val();
		
			$.ajax({
				 type :'POST',
				 url : 'count_emailId.do',
				 data : {'email':email, 'id':id},
				 dataType:"json",
				 success : function(res){
					if(res.result=='noExist'){
						
						$('#pwdErrMsg').html('존재하지 않는 아이디 혹은 이메일입니다.').show();
						return false;
					}
					else if(res.result=='exist'){
						
						submitFlag = true;
					}
					if(submitFlag == true){
						
						submitMail();
					}
				 },
				 error:function(jqXHR,status,exception){
			   	  let msg = '';
			  
				  if (jqXHR.status == 0) {
					msg = 'Not connect.\n Verify Network.';
			      }else if (jqXHR.status == 400) {
		        	msg = 'Server understood the request, but request content was invalid. [400]'
				  }else if (jqXHR.status == 404) {
			    	msg = 'Requested page not found. [404]';            
			      }else if (jqXHR.status == 500) {
			        msg = 'Internal Server Error [500].';            
			      }else if (exception == 'parsererror') {                
			    	msg = 'Requested JSON parse failed.';            
			      }else if (exception == 'timeout') {                
			    	msg = 'Time out error.';            
			      }else if (exception == 'abort') {                
			    	msg = 'Ajax request aborted.';            
			      }else {                
			        msg = 'Uncaught Error.\n' + jqXHR.responseText;            
			      }
			      alert(msg);
				}//end error
			});//end ajax
	}//end checkMailId

	
	//비밀번호 찾기 메일 전송 
	function submitMail(){
		
		var email = $("#myEmail").val();
		var mailAuthFlag = false;
		
		$.ajax({
			 type : 'POST',
			 url : 'sendEmail.do',
			 data : {'email':email},
			 dataType:"json",
			 success : function(res){
				
				if(res.result == false){
					
					alert('메일 전송이 실패하였습니다.\n관리자에게 문의하세요.');
					return false;
				}
				else if(res.result == true){
					
					mailAuthFlag = true;
				}
				if(mailAuthFlag == true){
					
					$("#sendMailBtn").hide();
					$("#pwdModal").find('input, label').hide();
					$("#pwdBodyForm").html(email+'로 임시 비밀번호가 전송되었습니다');
					
					//페이지 초기화(for 모달창 초기화)
					pageInit();
				}
			 },
			 error:function(jqXHR,status,exception){
		   	  var msg = '';
		  
			  if (jqXHR.status == 0) {
				msg = 'Not connect.\n Verify Network.';
		      }else if (jqXHR.status == 400) {
	        	msg = 'Server understood the request, but request content was invalid. [400]'
			  }else if (jqXHR.status == 404) {
		    	msg = 'Requested page not found. [404]';            
		      }else if (jqXHR.status == 500) {
		        msg = 'Internal Server Error [500].';            
		      }else if (exception == 'parsererror') {                
		    	msg = 'Requested JSON parse failed.';            
		      }else if (exception == 'timeout') {                
		    	msg = 'Time out error.';            
		      }else if (exception == 'abort') {                
		    	msg = 'Ajax request aborted.';            
		      }else {                
		        msg = 'Uncaught Error.\n' + jqXHR.responseText;            
		      }
			  alert(msg);
			}
		});		  
	}	
	
	
	//모달창 초기화용 
	function pageInit(){
		
		  $('[data-dismiss=modal]').on('click', function () {
			  
			 location.href = 'login_form.do';
				
		   });
	} 
	
	

</script>
    
</head>

<body class="text-center">

<!--로그인폼-->
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
<a href="#idModal" data-toggle="modal" id="openIdModal">아이디찾기</a>&nbsp;/
<div class="modal fade" id="idModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" style="width:500px;" role="document">
    <div class="modal-content">
      <form>
       	  <!--header-->
	      <div class="modal-header text-center">
   	        <h4 class="modal-title w-100 font-weight-bold">아이디 찾기</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <!--body-->
	      <div class="modal-body mx-1">
	        <div class="md-form mb-5" id="idBodyForm">
	          <label style="width:20%;">이름</label>
	          <input id="myName" name="name">
	        </div>
	
	        <div class="md-form mb-4">
	          <label style="width:20%;">휴대폰번호</label>
	          <input id="myPhone" name="phone">
	        </div>
	      </div>  
	      
	      <span id="idErrMsg" style="margin-left:45px; color:red; display:none;"></span>
	      
	      <!--footer-->
	      <div class="modal-footer d-flex justify-content-center">
	        <input type="button" class="btn btn-indigo" id="findIdBtn" onclick="findId();" value="아이디확인">
	        <input type="button"  class="modalBtns btn btn-indigo" id="closeBtn" data-dismiss="modal" value="닫기">
	      </div>
		</form>     
    </div>
  </div>
</div>

<!--비밀번호찾기-->
<a class="nav-link" href="#pwdModal" data-toggle="modal" >비밀번호찾기</a>
<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog"  style="width:500px;" role="document">
    <div class="modal-content">
     <form id="pwdFind_form" method="post" onsubmit="return checkMailId();">
      	  <!--header-->	
	      <div class="modal-header text-center">
	        <h4 class="modal-title w-100 font-weight-bold">임시비밀번호 발급</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <!--body-->
	      <div class="modal-body mx-3" id="pwdBodyForm">
	        <div class="md-form mb-5">
	          <label style="width:20%;">아이디</label>
	          <input id="myId" name="id">
	        </div>
	
	        <div class="md-form mb-4">
	          <label style="width:20%;">이메일</label>
	          <input id="myEmail" name="email">
	        </div>
	      </div>
	      
	      <span id="pwdErrMsg" style="margin-left:45px; color:red; display:none;"></span>
	      
	      <!--footer-->
	      <div class="modal-footer d-flex justify-content-center">
	        <input type="button" class="btn btn-indigo" id="sendMailBtn" onclick="checkMailId();" value="인증메일발송">
	        <input type="button"  class="modalBtns btn btn-indigo" id="closeBtn" data-dismiss="modal" value="닫기">
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