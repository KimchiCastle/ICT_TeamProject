
	//비밀번호 찾기시 유효성 판단 전역 변수
	let emailFlag = false;
	let idFlag = false;
	
	$(function(){
	
		$('#form').on('keyup',function(e){
			if(e.keyCode==13){
				send();
			}
		});
		
		//비밀번호 찾기 유효성 검사
		$('#email').blur(function(){
				emailCheck();
		});
		
		$('#id').blur(function(){
				idCheck();
		});
		
	});//end document.ready	

	//이메일유효성검사
	function emailCheck(){
		
		var email = $('#email').val();
		var regularExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(email == ''){
			
			$('#pwdErrMsg').hide();
			$('#pwdErrMsg').html('필수 입력값입니다.').show();
		
			return false;
		}
		
		if(!regularExp.test(email)){
			
			$('#pwdErrMsg').hide();
			$('#pwdErrMsg').html('유효한 이메일 형식이 아닙니다.').show();
			
			return false;
		}
		
		emailFlag = true;
		$('#pwdErrMsg').hide();
	}
	
	
	function idCheck(){
		
		var id = $('#id').val();
		
		if(id == ''){
			
			$('#pwdErrMsg').hide();
			$('#pwdErrMsg').html('필수 입력값입니다.').show();
			
			return false;
		}
		
		idFlag = true;
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
				  $('#loginMsg').html('아이디나 비밀번호가 일치하지 않습니다.')
				  .css('color','red');
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
	
	
	function phoneNoSubmit(){
		
	}
	
	//임시 비밀번호 메일 전송
	function mailSubmit(){

		var mailFlag = false;
		//유효성 검사 통과 안할시 modal의 submit방지
		if(idFlag == false || emailFlag == false || mailFlag == false){
			
			return false;
		}
		
		var email = $("#email").val();
		var id = $("#id").val();

		$.ajax({
			 type : 'POST',
			 url : 'count_emailId.do',
			 data : {'email':email, 'id':id},
			 success : function(res){
				if(res.result=='noExist'){
					
					$('#pwdErrMsg').html('존재하지 않는 아이디 혹은 이메일입니다.').show();
					return false;
				}
				else if(res.result=='exist'){
					
					mailFlag = true;
				}
				if(mailFlag == true){
					
					$("#pwdFind_form").submit();
				}
			 },
			 error:function(jqXHR,exception){
		  	
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
	}//end mailSubmit
	
	
