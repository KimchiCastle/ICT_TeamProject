<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style>
	  body{
	    font-family: 'Gowun Dodum', sans-serif;
	    font-size: 18px;
	  }
	  
	  #box{
	    width: 600px;
	    margin: 0 auto;
	  }
	   
	 .mb-4{
	     vertical-align: center;
	  }
	  
	 .fw-normal{
	    text-align: center;
	  } 
	  
	  .input-form{
		margin-bottom: 20px;	  
	  }
	  
	  .form-control{
	    margin-top: 20px;
	    margin-bottom: 40px;
	    width: 250px;
	    margin:auto;
	  } 
	  
	#login_btn{
	  display: inline-block;
	  color: white;
	  text-align: center;
	  vertical-align: middle;
	  cursor: if($enable-button-pointers, pointer, null);
	  background-color: #42b883;
	  margin-top: 20px;
	  margin-bottom: 45px;
	  
	}
	
	#naver_btn{
	 /*  outline: none; */
	  display: inline-block;
	  color: white;
	  text-align: center;
	  vertical-align: middle;
	  cursor: if($enable-button-pointers, pointer, null);
	  background-color: #19ce60;
	  margin-bottom: 10px;
	   font-size: 22px;
	  
	}
	
	 #kakaotalk_btn{
	 /*  outline: none; */
	  display: inline-block;
	  color: black;
	  text-align: center;
	  vertical-align: middle;
	  cursor: if($enable-button-pointers, pointer, null);
	  background-color: yellow;
	  margin-bottom: 10px;
	  font-size: 22px;
	   
	}
	
	#button-wrap{
	   width: 230px;
	   height: 80px;
	   margin: auto;
	}
    
    #social-wrap{
       width: 280px;
       margin: auto;
   	  
    }
    
</style>

 <script>

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
		  success:function(res){ //res = bResult

			  if(res=='false'){//bResult=false
				  $('#loginMsg').html('아이디나 비밀번호가 일치하지 않습니다.')
				  .css('color','red');
			  	  return;
				  
			  }else{
				 location.href = '../mainpage/list.do';
				  
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
	  });//end ajax
	}//end login 
</script>

</head>

<body class="text-center" id="form">

 <div id="box">
    <a href="../mainpage/list.do"><img class="mb-4" src="../image/상추마켓.png" alt="" width="300" height="100"></a>
    <div id="login-form">
    <h3 style="margin: 20px; height: 80px;">로그인</h3>
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
    
   	<div class="find_account"><a href="find_form.do">아이디/비밀번호 찾기</a></div>
   	
    <div id="button-wrap">
    <button class="w-50 btn btn-md" id="login_btn" onclick="send();">로그인</button>
    </div>
      
    <div>
      <span id="loginMsg"></span>
    </div>
    
    <div id="social-wrap">
     	<button class="w-100 btn btn-lg" id="naver_btn"  onclick="location.href='https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com'">네이버로그인</button>
		<button class="w-100 btn btn-lg" id="kakaotalk_btn" onclick="location.href='https://www.google.com/'">카카오로그인</button>
    </div>

    
    <p class="mt-5 mb-3 text-muted" align="center">한국 ICT 인재개발원</p>
  
  </div>


</body>
</html>