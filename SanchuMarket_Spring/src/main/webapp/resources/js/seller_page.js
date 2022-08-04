	var report_on = false;
	var password_on = false;
	
	function onReport(){
		
		var u_idx_reporting = $('#u_idx_reporting').val();
		var u_idx_reported = $('#u_idx_reported').val();
	
		if(u_idx_reporting == ''){
			alert('로그인 후 이용 가능합니다.');
			return false;
		}
		
		$.ajax({
			url: 'check_reportHistory.do',
			data: {'u_idx_reporting':u_idx_reporting,'u_idx_reported':u_idx_reported},
			success: function(res){
				if(res.result==true){
				
					report_on = true;
					center_modify_popup();
					$(".shadow").show();
				}
				else{
					alert('이미 신고한 회원입니다.');
					return;
				}
			}//end success	
		});//end ajax
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
	
	function send_report(){
	
		var report_reason = $('input[type=checkbox][name=report]:checked').val();
		var u_idx_reported = $('#u_idx_reported').val();
		var u_idx_reporting = $('#u_idx_reporting').val();
		
		if(!report_on){
		    hide_report_popup();
		}
	    if(report_reason==null){
			alert('신고 사유를 선택하세요.');	
	    }
	    else{
			location.href = "report.do?r_reason=" +report_reason 
								   + "&u_idx_reported=" + u_idx_reported
								   + "&u_idx_reporting=" +  u_idx_reporting;
		}
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
		
		$("#result_text").html('');
		
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
	
	
	
	function withdrawl(u_idx){
		
		var u_pwd = $("#u_pwd").val().trim();
		
		if(u_pwd==''){
			$("#result_text").css('color','red');
			$("#result_text").html('비밀번호를 입력하세요.');
			return;
			
		}
		
		if(pwdFlag == false){
			$("#result_text").css('color','red');
			$("#result_text").html('비밀번호가 일치하지 않습니다.');
			return;
		}
		
		$.ajax({
			url:"../user/check_pwd.do",
			data: {'u_pwd':u_pwd,'u_idx':u_idx},
			dataType: "json",
			success: function(res){
				
				if(res.result=="Y"){
					
					
					withdrawlCheck(u_idx);
					
				}else{
					
					$("#result_text").css('color','red');
					$("#result_text").html('유효하지 않은 비밀번호 입니다.');
					return;
					
				}
			},
			error:function(err){
					 
				$("#result_text").html('유효하지 않은 비밀번호 입니다.');
				   
			}
		})//end ajax
	}
	
	function withdrawlCheck(u_idx){
		
		if(!confirm('정말 탈퇴하시겠습니까?')) {
			hide_password_popup();
			return false;
		}
		
		var u_status = "탈퇴";
		
		$.ajax({
			
			url		: '../user/user_updateStatus.do',
			type	: 'POST',
			data	: {
			'u_idx':u_idx, 
			'u_status':u_status
			},
			success : function(res){
				
				if(res.result){
					
					
					alert('탈퇴되었습니다. 메인화면으로 이동합니다.');
					location.href='../mainpage/logout.do';
					
				}else{
					
					alert('문제가 발생했습니다. 관리자에게 문의하세요.')
					
				}
				
				
			},error	: function(err){
				
				alert('문제가 발생했습니다. 관리자에게 문의하세요.')
				
			}
		});
		
		
		
		
		
	}
	
	
	