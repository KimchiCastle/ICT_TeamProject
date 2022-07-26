 //birth datepicker 초기화
	  $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
        yearRange: 'c-100:c+0'
    });
	 
	 $( function() {
	    $( "#u_birth" ).datepicker({
	    	 changeMonth: true,
	    	 changeYear: true,
	    	 showButtonPanel: true,
	    	 maxDate: new Date
		        
		  });
	  });
	 
	
	 //스크립트 문서 배치 
	  let idFlag = false;
	  let pwdFlag = false;
	  let submitFlag = false;
	
	 $(document).ready(function(){ 
		 
		 	 //비밀번호 토글
			 $('.int_pass i').on('click',function(){
			        $('input').toggleClass('active');
			        if($('input').hasClass('active')){
			            $(this).attr('class',"fa fa-eye-slash fa-lg")
			            .prev('input').attr('type',"text");
			        }else{
			            $(this).attr('class',"fa fa-eye fa-lg")
			            .prev('input').attr('type','password');
			        }
			 });
		 	 
			 $('.int_pass_check i').on('click',function(){
			        $('input').toggleClass('active');
			        if($('input').hasClass('active')){
			            $(this).prop('class',"fa fa-eye-slash fa-lg")
			            .prev('input').prop('type',"text");
			        }else{
			            $(this).prop('class',"fa fa-eye fa-lg")
			            .prev('input').prop('type','password');
			        }
			 });
			 
	    	
	    	$("#u_name").blur(function(){
	    		checkName();
	    	}) 
	    	$("#u_email").blur(function(){
	    		checkEmail();
	    	})
	    	$("#u_id").blur(function(){
	    		idFlag = false;
	            checkId("first");
	    	})
	    	
	    	$("#u_pwd1").blur(function() {
	            pwdFlag = false;
	            checkPwd();
	            
	        }).keyup(function(event) {
	            checkShiftUp(event);
	        }).keypress(function(event) {
	            checkCapslock(event);
	        }).keydown(function(event) {
	            checkShiftDown(event);
	        }); 
	    	
	    	
	    	 $("#u_pwd2").blur(function() {
	             checkPwd2();
	         }).keyup(function(event) {
	             checkShiftUp(event);
	         }).keypress(function(event) {
	             checkCapslock(event);
	         }).keydown(function(event) {
	             checkShiftDown(event);
	         });
	    	 
	    	 
	    	$("#u_nickname").blur(function(){
	    		checkNickname("first");
	    	})
	    	$("#u_tel").blur(function(){
	    		checkTel();
	    	})
	    	$("#u_addr").blur(function(){
	    		checkAddr();
	    	})
	    	$("#u_birth").change(function(){
	    		checkBirth();
	    	})
	    	
	    	 //회원가입 실패시 enroll_form.do?reason=failed_enroll 받기
			 setTimeout(showMessage,100);
	    });//end document.ready
	 
	
	    
    	
      
		//이름 유효성 체크 함수   
    	function checkName(){
    		
    		var oMsg = $("#nameMsg");
   	        var name = $("#u_name").val();
   	        var oInput = $("#u_name");
   	        
			if(name==''){
				showErrorMsg(oMsg,"필수정보입니다.");
		        setFocusToInputObject(oInput);
				return;
			}
			
   	        var nonchar = /[^가-힣a-zA-Z0-9]/;
			
			 if (name != "" && nonchar.test(name)) {
				 showErrorMsg(oMsg,"한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
			     setFocusToInputObject(oInput);
		         return;
		    }
			 
		    hideMsg(oMsg);
	        return true;
    	 }

			//비밀번호1 유효성 체크 함수
  		function checkPwd(){
	
	     /*   if(pwdFlag) return true;*/

	        var pwd1 = $("#u_pwd1").val();
	        var pwd2 = $("#u_pwd2").val();
	        var oMsg1 = $("#pwd1Msg");
	        var oMsg2 = $("#pwd2Msg");
	        var oInput = $("#u_pwd1");
			
	        if (pwd1 == '') {
	            showErrorMsg(oMsg1,"필수정보입니다.");
	            setFocusToInputObject(oInput);
	            return;
	        }
	        
	        if(!isValidPwd(pwd1)){
	        	showErrorMsg(oMsg1,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
	            setFocusToInputObject(oInput);
	            return;
	        } 
	        
	        
	        if( pwd2 != '' && (pwd1 != pwd2)){
	        	showErrorMsg(oMsg2,"비밀번호가 일치하지 않습니다.");
	        	return;
	        }
	        
	        if( pwd1==pwd2 ){
	        	hideMsg(oMsg2);
	        	return;
	        }
	        	showSuccessMsg(oMsg1,"사용 가능한 비밀번호입니다.");
	        	hideMsg(oMsg1);
	        	return;
  	  }  		
			
		//비밀번호 유효성 체크 함수(checkPwd()에 boolean반환)
		function isValidPwd(pwd1) {
			
		        var cnt = 0;
		        if (pwd1 == "") {
		            return false;
		        }
		
		        var retVal = checkSpace(pwd1);
		        if (retVal) {
		            return false;
		        }
		        if (pwd1.length < 8) {
		            return false;
		        }
		        
		        //전체 글자수 중복된 단어 제한
		        for (var i = 0; i < pwd1.length; ++i) {
		            if (pwd1.charAt(0) == pwd1.substring(i, i + 1))
		                ++cnt;
		        }
		        if (cnt == pwd1.length) {
		            return false;
		        }
		
		        var isPwd = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[.$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
		        if (!isPwd.test(pwd1)) {
		            return false;
		        }
		        
		        
		
		        return true;
		    } 
	    
	//비밀번호 일치 여부 확인
  	function checkPwd2() {
      
       	
   			var pwd1 = $("#u_pwd1");
   	        var pwd2 = $("#u_pwd2");
   	        var oMsg = $("#pwd2Msg");
	
	        if (pwd2.val() == "") {
	            showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
	            setFocusToInputObject(pwd2);
	            return;
	        }
	        if (pwd1.val() != pwd2.val()) {
	            showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
	            setFocusToInputObject(pwd2);
	            return;
	        }else {
	            oMsg.html("비밀번호가 일치합니다");
	            hideMsg(oMsg);
	        }
       		pwdFlag = true;
       } 



		//이메일 유효성 체크 함수
	    function checkEmail(){
	    	
    	   var email = $("#u_email").val();
           var oMsg = $("#emailMsg");
           var oInput = $("#u_email");

           if ( email == "") {
         	  showErrorMsg(oMsg,"필수정보입니다.");
               setFocusToInputObject(oInput);	         
               return;
             }

           var isEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
           var isHan = /[ㄱ-ㅎ가-힣]/g;
           if (!isEmail.test(email) || isHan.test(email)) {
               showErrorMsg(oMsg,"올바른 이메일 형식이 아닙니다.");
               return;
           }
           
           
	        $.ajax({
	            type:"GET",
	            url: "check_email.do?u_mail=" + email,
	            success : function(data) {
					//db에 존재하는 닉네임 없으면 data=y 넘어옴
	                if (data.result == "Y") {
	                	 if (event == "first") {
	                		 showSuccessMsg(oMsg, "사용 가능한 이메일입니다.");
	                		
	                     } else {
	                         hideMsg(oMsg);//호출하고 직후만 메시지 띄우려고..?
	                     }
	                   
	                } else { 
	                    showErrorMsg(oMsg, "이미 사용중인 이메일입니다.");
	                    setFocusToInputObject(oInput);
	                }
	            }//end success
	        });//end ajax

           hideMsg(oMsg);
           return true;
	    }
	    
		
		//id유효성 체크 함수
	  	function checkId(event){
	  		
	  		/*if(idFlag) return true;*/

	        var id = $("#u_id").val();
	        var oMsg = $("#idMsg");
	        var oInput = $("#u_id");

	        if ( id == '') {
        	  showErrorMsg(oMsg,'필수정보입니다.');
              setFocusToInputObject(oInput);	         
              return;
            }

	        var isID = /^[a-zA-Z][0-9a-zA-Z]{5,21}$/g;
	        if (!isID.test(id)) {
	            showErrorMsg(oMsg,"영문자 또는 숫자를 조합하여 6~20자리를 입력해주세요.");
	            return;
	        }
	        idFlag = false;
	                
	        $.ajax({
	            type:"GET",
	            url: "check_id.do?u_id=" + id,
	            dataType: 'json',
	            success : function(data) {
					//db에 존재하는 아이디 없으면 data=y 넘어옴
	                if (data.result == "Y") {
	                	if (event == "first") {
	                	  showSuccessMsg(oMsg, "사용 가능한 아이디입니다.");
						  hideMsg(oMsg);
	                	}
	                }else{
                      showErrorMsg(oMsg,"존재하는 아이디입니다.");//호출하고 직후만 메시지 띄우려고..?
	                 }
					
                    idFlag = true;
                    
                    if ( id == '') {
                  	  showErrorMsg(oMsg,'필수정보입니다.');
                        setFocusToInputObject(oInput);	   
 						idFlag = false;      
                        return;
                    }
	            }
	        });//end ajax
	        return true;
	      }//end function
	  	  
			//닉네임 유효성 체크 함수
			function checkNickname(event){
	  		
	        var nickname = $("#u_nickname").val();
	        var oMsg = $("#nickMsg");
	        var oInput = $("#u_nickname");

	        if ( nickname == "") {
        	  showErrorMsg(oMsg,"필수정보입니다.");
              setFocusToInputObject(oInput);	         
              return;
            }

	        var nonchar = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;

	        if (!nonchar.test(nickname)) {
	            showErrorMsg(oMsg,"한글과 영문2~16자리를 입력하세요. (특수기호, 공백 사용 불가)");
	            setFocusToInputObject(oInput);
	            return;
	        }

	                
	        $.ajax({
	            type:"GET",
	            url: "check_nickname.do?u_nickname=" + nickname,
	            success : function(data) {
					//db에 존재하는 닉네임 없으면 data=y 넘어옴
	                if (data.result == "Y" ) {
	                	 if (event == "first") {
	                		 showSuccessMsg(oMsg, "사용 가능한 닉네임입니다.");
							hideMsg(oMsg);
	                     } 
	                } else { 
	                    showErrorMsg(oMsg, "이미 사용중인 닉네임입니다.");
	                    setFocusToInputObject(oInput);
	                }
	            }//end success
	        });//end ajax
			hideMsg(oMsg);
	        return true;
	      }//end function
	  	

	//주소 유무 체크 함수
   function checkAddr(){
	    	
    	   var addr = $("#u_addr").val();
           var oMsg = $("#addrMsg");
           var oInput = $("#u_addr");

           if ( addr == "") {
         	  showErrorMsg(oMsg,"필수정보입니다.");
               setFocusToInputObject(oInput);	         
               return;
             }

           hideMsg(oMsg);
           return true;
	    }
   
	//전화번호 체크 함수(인증 구현시 삭제 예정)
   function checkTel(){
	    	
    	   var tel = $("#u_tel").val();
           var oMsg = $("#telMsg");
           var oInput = $("#u_tel");

           if ( tel == "") {
         	  showErrorMsg(oMsg,"필수정보입니다.");
               setFocusToInputObject(oInput);	         
               return;
             }
           
           var isTel = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
           if (!isTel.test(tel)){
        	   showErrorMsg(oMsg,"형식에 맞지 않는 전화번호입니다.");
               setFocusToInputObject(oInput);	         
               return;
           }

           hideMsg(oMsg);
	    }
	    
		//생일 체크 함수
		function checkBirth(){
	
			let birth = $("#u_bitrh").val();
		}

   
	   //메시지 표시, 가입버튼 활성화
		function submitClose() {
        submitFlag = true;
        $("#enroll_btn").attr("disabled",false);
       }
		
		function submitOpen() {
	        $("#enroll_btn").attr("disabled",true);
	    }

	    function hideMsg(obj) {
        	obj.hide();
       }
	    function showErrorMsg(obj, msg) {
	        obj.css("color", "red");
	        obj.html(msg);
	        obj.show();
	    }

	    function showSuccessMsg(obj, msg) {
	        obj.css("color", "blue");
	        obj.html(msg);
	        obj.show();
	    }
	    
	    function setFocusToInputObject(obj) {
	        if(submitFlag) {
	            submitFlag = false;
	            obj.focus();
	        }
	    }
	  //shift/capslock/spacebar 대응
	    var isShift = false;
	    
	    function checkShiftUp(e) {
	        if (e.which && e.which == 16) {
	            isShift = false;
	        }
	    }

	    function checkShiftDown(e) {
	        if (e.which && e.which == 16) {
	            isShift = true;
	        }
	    }

	    function checkCapslock(e) {
	        var myKeyCode = 0;
	        var myShiftKey = false;
	        if (window.event) { // IE
	            myKeyCode = e.keyCode;
	            myShiftKey = e.shiftKey;
	        } else if (e.which) { // netscape ff opera
	            myKeyCode = e.which;
	            myShiftKey = isShift;
	        }

	        var oMsg = $("#pwdMsg");
	        if ((myKeyCode >= 65 && myKeyCode <= 90) && !myShiftKey) {
	            showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
	        } else if ((myKeyCode >= 97 && myKeyCode <= 122) && myShiftKey) {
	            showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
	        } else {
	            hideMsg(oMsg);
	        }
	     }

 	    function checkSpace(str) {
	        if (str.search(/\s/) !== -1) {
	            return true;
	        } else {
	            return false;
	        }
	    } 
	    
 	    //회원가입 실행
 	    function enroll(){ 
	
 	    	console.log(idFlag);
 	    	console.log(pwdFlag);

	        if(idFlag && pwdFlag) {
	           console.log('2');
	           submitClose();
	       	   $("#enroll_form").submit();
	        }else {
	      		 console.log('3');
	           submitOpen();
	           return false;
	        }
        }