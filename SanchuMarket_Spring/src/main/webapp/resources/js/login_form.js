let email = $('#email').val();
		let id = $('#id').val();
		let regularExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

$(function(){
	
	$('#form').on('keyup',function(e){
		if(e.keyCode==13){
			send();
		}
	});
	
	$('#email').blur(function(){
		
		if(email == ''){
			console.log('email2');
			$('#pwdErrMsg').html('필수 입력값입니다.').show();
		}
		if(!regularExp.test(email)){
			console.log('email');
			$('#pwdErrMsg').html('유효한 이메일 형식이 아닙니다.').show();
		}
	});
	
	$('#id').blur(function(){
		
		if(id == ''){
			console.log('id');
			$('#pwdErrMsg').html('필수 입력값입니다.').show();
		}
	});
	
	
});//end document.ready
	
	function phoneNoSubmit(){
		
	}
	
	function mailSubmit(f){
		
		$.ajax({
			 type : POST,
			 url : 'count_emailId.do',
			 data : {'email':email, 'id':id},
			 dataType : 'json',
			 success : function(res){
				
				if(res.result=='noExist'){
					$('#pwdErrMsg').html('존재하지 않는 아이디 혹은 이메일입니다.').show();
				}else{
					
				}
			 },
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
	
	
			
			
		});
	}
	
	
