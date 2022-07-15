$(function(){
		$('#form').on('keyup',function(e){
			if(e.keyCode==13){
				send();
			}
		});
	})
		
	function send(){
		
		let u_id = $( '#u_id' ).val();
		let u_pwd = $( '#u_pwd' ).val();
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
		  
		   	  let msg = '';
		  
			  if (jqXHR.status == 0) {
				msg = 'Not connect.\n Verify Network.';
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
	}//end login 
	
