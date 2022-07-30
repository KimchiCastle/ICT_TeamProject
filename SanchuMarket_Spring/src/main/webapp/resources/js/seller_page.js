



	var report_on = false;
	var password_on = false;
	
	
	function onReport(){
		
		if(!report_on){
			report_on = true;
			center_modify_popup();
			$(".shadow").show();
		}else{
			return false;
		}
		
		
	}
	
	function center_modify_popup(){
		
		//윈도우 폭구하는 함수
		var w_width = $(window).width();
		//윈도우 높이 구하는 함수
		var w_height = $(window).height();
		
		var r_width  = $("#report_popup").width();
		var r_height = $("#report_popup").height();
		
		
		var left = w_width/2 - r_width/2;
		var top  = w_height/2 - r_height/2;
		
		/* 위치 css를 JSON으로 처리한다. */
		//css : Map방식 속성값 지정
		$("#report_popup").css({ 'left':left, 'top':top });
		
		$("#report_popup").show();
	}
	
	function hide_report_popup(){
		
		report_on= false;
		
		
		
		$("#report_popup").hide();
		$(".shadow").hide();
		
	}
	
	/* checkbox 하나만 선택되는 함수 */
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("report");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	
	
	function myInfoModify(u_idx){
		
		if(!confirm('회원정보를 수정하시겠습니까?')) return false;
		
		location.href='../mypage/myInfoModify_form.do?u_idx='+u_idx;
		
	}
	

	function show_pwdcheck(){
		
		if(!password_on){
			password_on = true;
			center_password_popup();
			$(".shadow").show();
		}else{
			return false;
		}
		
		
	}
	
	function center_password_popup(){
		
		
		//윈도우 폭구하는 함수
		var w_width = $(window).width();
		//윈도우 높이 구하는 함수
		var w_height = $(window).height();
		
		var r_width  = $("#password_check").width();
		var r_height = $("#password_check").height();
		
		
		var left = w_width/2 - r_width/2;
		var top  = w_height/2 - r_height/2
		
		/* 위치 css를 JSON으로 처리한다. */
		//css : Map방식 속성값 지정
		$("#password_check").css({ 'left':left, 'top':top });
		
		$("#password_check").show();
		window.scrollTo(0,0);
	}
	
	
	function hide_password_popup(){
		
		password_on = false;
		
		$("#u_pwd").val('');
		$("#u_pwdcheck").val('');
		
		$("#password_check").hide();
		$(".shadow").hide();
		window.scrollTo(0,document.body.scrollHeight); 
	}
	
	let pwdFlag = false;
	
	//비밀번호 체크
	$(function(){
		
		$("#u_pwdcheck").on('keyup', function(){
			
			var u_pwd = $("#u_pwd").val();
			var u_pwdcheck = $("#u_pwdcheck").val();
			
			if(u_pwd!=u_pwdcheck){
				
				$("#result_text").css('color','red');
				$("#result_text").html('비밀번호가 일치하지 않습니다.');
				
				
			}else{
				
				if(u_pwd==''){
					$("#result_text").html('');
					return false;
				}
					pwdFlag = true;
					$("#result_text").css('color','blue');
					$("#result_text").html('비밀번호가 일치합니다.');
			}
			
		});
		
		$("#u_pwd").on('keyup', function(){
			
			var u_pwd = $("#u_pwd").val();
			var u_pwdcheck = $("#u_pwdcheck").val();
			
			if(u_pwd!=u_pwdcheck){
				
				pwdFlag = false;
				$("#result_text").css('color','red');
				$("#result_text").html('비밀번호가 일치하지 않습니다.');
				
			}else{
				
				if(u_pwd==''){
					$("#result_text").html('');
					
					return false;
				}
					$("#result_text").css('color','blue');
					$("#result_text").html('비밀번호가 일치합니다.');
				
			}
			
			
		});
		
	}) // 비밀번호 체크 끝
	
	
	
	function withdrawl(){
		
		var u_pwd = $("#u_pwd").val();
		var p_idx = $("#p_idx").val();
		
		if(pwdFlag == false){
			$("#result_text").html('비밀번호가 일치하지 않습니다.');
			return;
		}
		
		$.ajax({
			url:"../user/check_pwd.do",
			data: {"u_pwd":u_pwd,"p_idx":p_idx},
			dataType: "json",
			success: function(res){
				
				if(res.result=="Y")
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
		})//end ajax
	}
	
	
	
	