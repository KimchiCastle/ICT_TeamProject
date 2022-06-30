<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style>
	  #box{
	    width: 600px;
	    margin: 0 auto;
	  }
	   
	 .mb-4{
	     vertical-align: center;
	  }
	   
	  #input-form{
	     margin-bottom: 20px;
	  } 
	 .fw-normal{
	    text-align: center;
	  } 
	  
	  .form-control{
	    margin-top: 20px;
	    margin-bottom: 20px;
	    width: 250px;
	    margin:auto;
	  } 
	  
	.btn{
	  display: inline-block;
	  color: white;
	  text-align: center;
	  vertical-align: middle;
	  cursor: if($enable-button-pointers, pointer, null);
	  background-color: #42b883;
	}
	
	#button-wrap{
	   width: 220px;
	   margin: auto;
	}
    
    
</style>

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

  <!-- Custom styles for this template -->
<!--  <link href="signin.css" rel="stylesheet"> -->

</head>

<body class="text-center">

 <form>
 <div id="box">
    <img class="mb-4" src="../image/상추마켓.png" alt="" width="300" height="100">
    <div id="login-form">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>
	</div>
	
	<div id="input-form">
      <input type="email" class="form-control" id="floatingInput" placeholder="아이디">
      <input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
	</div>
	
    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> 로그인 상태 유지
      </label>
    </div>
    
    <div id="button-wrap">
    <button class="w-50 btn btn-md" type="submit" >로그인</button>
    </div>
    
    <p class="mt-5 mb-3 text-muted" align="center">한국 ICT 인재개발원</p>
  
  </div>
  </form>



</body>
</html>