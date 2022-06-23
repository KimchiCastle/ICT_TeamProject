<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>

	$("#login").keypress(function(e){
		if(e.keyCode == 13){
			//$(this).submit();
			login(document.login);
		}
	});

	function login(f){
		
		let u_id = ${ u_id }.val();
		let u_pwd = ${ u_pwd }.val();
		
		//아이디 비밀번호 유효성 체크 > 비동기통신 
	  $.ajax({
		  type:"POST",
		  url:'login_check.do', //LoginCheckAction
		  data:{"u_id":u_id, "u_pwd":u_pwd},
		  dataType:'text',
		  success:function(res){ //res = bResult
			 
			  if(!res){//bResult=false
				  
				  $( "#check_msg" ).html("아이디 혹은 비밀번호가 일치하지 않습니다.")
				  .css("color","red"); 
			  }else{
				  
				  f.action = "login.do";
				  f.submit();
			  }
		  },
		  error:function(jqXHR, exception){
			  
			  let msg = '';
			  
			  if (jqXHR.status === 0) {
				msg = 'Not connect.\n Verify Network.';}
		      }else if (jqXHR.status == 404) {
		    	msg = 'Requested page not found. [404]';            
		      }else if (jqXHR.status == 500) {
		        msg = 'Internal Server Error [500].';            
		      }else if (exception === 'parsererror') {                
		    	msg = 'Requested JSON parse failed.';            
		      }else if (exception === 'timeout') {                
		    	msg = 'Time out error.';            
		      }else if (exception === 'abort') {                
		    	msg = 'Ajax request aborted.';            
		      }else {                
		        msg = 'Uncaught Error.\n' + jqXHR.responseText;            
		      }
		      
		      alert(msg);
	      })

	}//end login
</script>
<body>

<form>
	<input id="u_id">
	<input id="u_pwd">
	<input type="button" id="login" value="로그인" onclick="login(this.form);">
	<span id="check_msg"></span>

</form>

</body>
</html>