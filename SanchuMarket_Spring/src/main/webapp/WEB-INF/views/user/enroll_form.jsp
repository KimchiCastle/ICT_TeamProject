<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--jquery-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!--boot strap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--google font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!--date picker-->
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<!--비밀번호 토글 아이콘-->
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<!--CSS-->
<link rel="stylesheet" 
      href="${ pageContext.request.contextPath }/resources/css/enroll_form.css">
	<script>
	
	
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
	 
	 
	 //enrollAction에서 실패시 redirect되는 parameter 받기
	  function showMessage(){
		 
		  if("${param.reason}" == "failed_enroll"){
			  alert('회원가입에 실패했습니다. 관리자에게 문의하세요');
			  return false;
		  } 
		  
	   idFlag = false;
	   pwdFlag = false;
	   submitFlag = false;
	  }
	
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
	
	        if(pwdFlag) return true;

	        var pwd1 = $("#u_pwd1").val();
	        var pwd2 = $("#u_pwd2").val();
	        var oMsg1 = $("#pwd1Msg");
	        var oMsg2 = $("#pwd2Msg");
	        var oInput = $("#u_pwd1");
			
	        if (pwd1 == '') {
	        	console.log("1");
	            showErrorMsg(oMsg1,"필수정보입니다.");
	            setFocusToInputObject(oInput);
	            return;
	        }
	        
	        if(!isValidPwd(pwd1)){
	        	console.log("2");
	        	showErrorMsg(oMsg1,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
	            setFocusToInputObject(oInput);
	            return;
	        } 
	        
	        
	        if( pwd2 != '' && (pwd1 != pwd2)){
	        	console.log("3");
	        	showErrorMsg(oMsg2,"비밀번호가 일치하지 않습니다.");
	        	return;
	        }
	        
	        if( pwd1==pwd2 ){
	        	console.log("4");
	        	hideMsg(oMsg2);
	        	return;
	        }
	       		 console.log("5");
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
	            return;
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
	  		
	  		if(idFlag) return true;

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
	                	  return;
	                	}
	                }else{
                      showErrorMsg(oMsg,"존재하는 아이디입니다.");//호출하고 직후만 메시지 띄우려고..?
                      return;
	                 }
					
                    idFlag = true;
                    
                    if ( id == '') {
                  	  showErrorMsg(oMsg,'필수정보입니다.');
                        setFocusToInputObject(oInput);	         
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
	                if (data == "Y") {
	                	 if (event == "first") {
	                		 showSuccessMsg(oMsg, "사용 가능한 닉네임입니다.");
	                		
	                     } else {
	                         hideMsg(oMsg);//호출하고 직후만 메시지 띄우려고..?
	                     }
	                   
	                } else { 
	                    showErrorMsg(oMsg, "이미 사용중인 닉네임입니다.");
	                    setFocusToInputObject(oInput);
	                }
	            }//end success
	        });//end ajax
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
        $("#enroll_btn").attr("disabled",true);
       }
		
		function submitOpen() {
	        $("#enroll_btn").attr("disabled",false);
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
 	    function submit_1(){ 
 	    	
	        if(idFlag && pwdFlag) {
	          
	           submitClose();
	       	   $("#enroll_form").submit();
	        }else {
	      
	           submitOpen();
	           return false;
	        }
        }
	</script> 

</head>
<body>
<form id="enroll_form" method="post" action="enroll.do">
	<div id="header">
           <span id="title">회원가입</span>
        </div>

        <!-- wrapper -->
        <div id="wrapper">

            <!-- content-->
            <div id="content">

                <!-- ID -->
                <div>
                    <h3 class="join_title">
                        <label for="u_id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="u_id" name="u_id" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box" id="idMsg"></span>
                </div>

                <!-- PWD1 -->
                <div>
                    <h3 class="join_title"><label for="u_pwd1">비밀번호</label></h3>
                    <span class="box int_pass">
                       <input type="password" id="u_pwd1" name="u_pwd1" class="int" maxlength="20" autocomplete="off">
                        <i class="fa fa-eye fa-lg"></i>
                    </span>
                    <span class="error_next_box" id="pwd1Msg"></span>
                </div>

                <!-- PWD2 -->
                <div>
                    <h3 class="join_title"><label for="u_pwd2">비밀번호 재확인</label></h3>
                    <div class="box int_pass_check">
                       <input type="password" id="u_pwd2" name="u_pwd2" class="int" maxlength="20" autocomplete="off">
 					      <i class="fa fa-eye fa-lg"></i>
                    </div>
                    <span class="error_next_box" id="pwd2Msg"></span>
                </div>

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="u_name" name="u_name" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box" id="nameMsg"></span>	
                </div>
                
                <!-- NICKNAME -->
                <div>
                    <h3 class="join_title"><label for="name">닉네임</label></h3>
                    <span class="box int_name">
                        <input type="text" id="u_nickname" name="u_nickname" class="int" maxlength="20" required>
                    </span>
                    <span class="error_next_box" id="nickMsg"></span>
                </div>

                <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label>생년월일</label></h3>
			      	  <input type="text" name="u_birth" id="u_birth" required> 
                    <span class="error_next_box" id="birthMsg"></span>    
                </div>

                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">이메일</label></h3>
                    <span class="box int_email">
                        <input type="text" id="u_email" name="u_email" class="int" maxlength="100" required>
                    </span>
                    <span class="error_next_box" id="emailMsg"></span>    
                </div>

                <!-- TEL -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="u_tel" name="u_tel" class="int" maxlength="16" required>
                    </span>
                    <span class="error_next_box" id="telMsg"></span>    
                </div>
                
			    <!-- ADDRESS -->
				 	 <h3 class="join_title"><label>주소</label></h3>
				   
				    <div style="display:inline-block; height: 50px;">
				    <!-- <span class="box int_addr"> -->
				          <input type="text"  id="sample2_postcode" name="postcode" readonly>
					   	  <input type="button" id="addr_btn" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
					<!-- </span> -->
					</div>
					
					<span class="box int_addr2">    
					      <input type="text" class="int" id="sample2_address" name="address" readonly>
					</span>   
					
					 <span id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
					   	  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
					 </span>
					
					<span class="box int_addr2">    
					      <input type="text" class="int" id="sample2_detailAddress" name="detail"  >
					</span>  
					 
					 <span id="addrMsg" style="display:none"></span>
			  
			     


                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" id="enroll_btn" onclick="submit_1();">
                        <span>가입</span>
                    </button>
                    <button type="button" id="revoke_btn" onclick= "location.href='../mainpage/list.do'">
                        <span>취소</span>
                    </button>
                </div>

            </div> 
            <!-- content-->

        </div> 
        <!-- wrapper -->
        </form>
    </body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
     /*    var borderWidth = 1; */ //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (window.screen.width / 2) - (width / 2) /* - borderWidth + 'px' */;
        element_layer.style.top = (window.screen.height / 2) - (height / 2) /* - borderWidth + 'px' */;
    }
</script>	
</body>
</html>