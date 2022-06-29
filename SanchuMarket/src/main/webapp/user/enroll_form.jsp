<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<style type="text/css">
  
  html {
    height: 100%;
}

body {
    margin: 0;
    height: 100%;
    background: #f5f6f7;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
#logo {
    width: 240px;
    height: 44px;
    cursor: pointer;
}

#header {
    padding-top: 62px;
    padding-bottom: 20px;
    text-align: center;
}
#wrapper {
    position: relative;
    height: 100%;
}

#content {
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    width: 460px;
}




/* 입력폼 */


h3 {
    margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
}


.box {
    display: block;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
}

.int {
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
}

input {
    font-family: Dotum,'돋움',Helvetica,sans-serif;    
}

.box.int_id {
    padding-right: 110px;
}

.box.int_pass {
    padding-right: 40px;
}

.box.int_pass_check {
    padding-right: 40px;
}

.step_url {
    /*@naver.com*/
    position: absolute;
    top: 16px;
    right: 13px;
    font-size: 15px;
    color: #8e8e8e;
}

.pswdImg {
    width: 18px;
    height: 20px;
    display: inline-block;
    position: absolute;
    top: 50%;
    right: 16px;
    margin-top: -10px;
    cursor: pointer;
}

#bir_wrap {
    display: table;
    width: 100%;
}

#bir_yy {
    display: table-cell;
    width: 147px;
    
}

#bir_mm {
    display: table-cell;
    width: 147px;
    vertical-align: middle;
}

#bir_dd {
    display: table-cell;
    width: 147px;
}

#bir_mm, #bir_dd {
    padding-left: 10px;
}

select {
    width: 100%;
    height: 29px;
    font-size: 15px;
    background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
    background-size: 20px 8px;
    -webkit-appearance: none;
    display: inline-block;
    text-align: start;
    border: none;
    cursor: default;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}

/* 에러메세지 */

.error_next_box {
    margin-top: 9px;
    font-size: 12px;
    color: red;    
    display: none;
}

#alertTxt {
    position: absolute;
    top: 19px;
    right: 38px;
    font-size: 12px;
    color: red;
    display: none;
}

/* 버튼 */

.btn_area {
    margin: 30px 0 91px;
}

#btnJoin {
    width: 100%;
    padding: 21px 0 17px;
    border: 0;
    cursor: pointer;
    color: #fff;
    background-color: #08a600;
    font-size: 20px;
    font-weight: 400;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
  

</style>
	<script>
	
		//유효성검사를 해주는 각 flag들이 1이 되어야 회원가입이 진행됨
	   $(document).ready(function(){ 
		   
		    let idFlag = false;
		    let pwdFlag = false;
		    let submitFlag
	    	
	    	setTimeout(showMessage,100);
	    	
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
	    	
	    	
	        $("#enroll_btn").click(function(event) {
	              
               submitClose();
               
               if(idFlag && pwFlag) {
              	 $("#enroll_form").submit();
               }else {
                  submitOpen();
                  return false;
               }
	        });
	    }); 
	     
	    
    	
      
	//-------------이름 유효성 체크 함수------------------------------------ 	    
    	function checkName(){
    		
    		var oMsg = $("#nameMsg");
   	        var name = $("#u_name").val();
   	        var oInput = $("#u_name");
   	        
			if(name==''){
				showErrorMsg(oMsg,"필수정보입니다.");
		        setFocusToInputObject(oInput);
				return false;
			}
			
   	        var nonchar = /[^가-힣a-zA-Z0-9]/;
			
			 if (name != "" && nonchar.test(name)) {
				 showErrorMsg(oMsg,"한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
			     setFocusToInputObject(oInput);
		         return false;
		    }
			 
		    hideMsg(oMsg);
	        return true;
    	 }

//-------------비밀번호 유효성 체크 함수------------------------------------ 	
	  
  			function checkPwd(){
	     
	
	        if(pwdFlag) return true;

	        var pwd1 = $("#u_pwd1").val();
	        var oMsg = $("#pwd1Msg");
	        var oInput = $("#u_pwd1");

	        if (pwd1 == '') {
	            showErrorMsg(oMsg,"필수정보입니다.");
	            setFocusToInputObject(oInput);
	            return false;
	        }
	      
	        //밑의 isValidPwd 함수 호출
	        if (!isValidPwd(pwd1)) {
	            showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
	            setFocusToInputObject(oInput);
	            return false;
	        }else{
	        	showSuccessMsg(oMsg,"사용 가능한 비밀번호입니다.");
	        	hideMsg(oMsg);
	        	return true;
	        }
	   
  			}  		
//-------------비밀번호 유효성 체크 함수(boolean반환)------------------------------------
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
	    
//----------------비밀번호 일치 확인 함수-----------------------
  	function checkPwd2() {
      
       	
   		var pwd1 = $("#u_pwd1");
   	        var pwd2 = $("#u_pwd2");
   	        var oMsg = $("#pwd2Msg");
	
	        if (pwd2.val() == "") {
	            showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
	            setFocusToInputObject(pwd2);
	            return false;
	        }
	        if (pwd1.val() != pwd2.val()) {
	            showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
	            setFocusToInputObject(pwd2);
	            return false;
	        } else {
	            oMsg.html("비밀번호가 일치합니다");
	            hideMsg(oMsg);
	            return true;
	        }
	        return true;
       		pwdFlag = true;
       } 

//-------------이메일 유효성 체크 함수------------------------------------ 		
	    function checkEmail(){
	    	
    	   var email = $("#u_email").val();
           var oMsg = $("#emailMsg");
           var oInput = $("#u_email");

           if ( email == "") {
         	  showErrorMsg(oMsg,"필수정보입니다.");
               setFocusToInputObject(oInput);	         
               return false;
             }

           var isEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
           var isHan = /[ㄱ-ㅎ가-힣]/g;
           if (!isEmail.test(email) || isHan.test(email)) {
               showErrorMsg(oMsg,"올바른 이메일 형식이 아닙니다.");
               return false;
           }

           hideMsg(oMsg);
           return true;
	    }
	    
//-------------id유효성 체크 함수------------------------------------  	  
	  	function checkId(event){
	  		
	  		if(idFlag) return true;

	        var id = $("#u_id").val();
	        var oMsg = $("#idMsg");
	        var oInput = $("#u_id");

	        if ( id == '') {
        	  showErrorMsg(oMsg,'필수정보입니다.');
              setFocusToInputObject(oInput);	         
              return false;
            }

	        var isID = /^[a-zA-Z](?=.{0,28}[0-9])[0-9a-zA-Z]{6,20}$/;
	        if (!isID.test(id)) {
	            showErrorMsg(oMsg,"영문자와 숫자를 조합하여 6~20자리를 입력해주세요.");
	            return false;
	        }
	        idFlag = false;
	                
	        $.ajax({
	            type:"GET",
	            url: "check_id.do?u_id=" + id,
	            success : function(data) {
					//db에 존재하는 아이디 없으면 data=y 넘어옴
	                if (data == "Y") {
	                	if (event == "first") {
	                	  showSuccessMsg(oMsg, "사용 가능한 아이디입니다.");
	                	   return true;
	                    }else if(data == "N"){
	                       showErrorMsg(oMsg,"존재하는 아이디입니다.");//호출하고 직후만 메시지 띄우려고..?
	                       return false;
	                    }
	                    idFlag = true;
	                    
	                    if ( id == '') {
	                  	  showErrorMsg(oMsg,'필수정보입니다.');
	                        setFocusToInputObject(oInput);	         
	                        return false;
	                      }

	                } else { 
	                    showErrorMsg(oMsg, "이미 사용중인 아이디입니다.");
	                    setFocusToInputObject(oInput);
	                    return false;
	                }
	            }
	        });//end ajax
	        return true;
	      }//end function
	  	  
//--------------닉네임 유효성 체크 함수------------------------
  
			function checkNickname(event){
	  		
	        var nickname = $("#u_nickname").val();
	        var oMsg = $("#nickMsg");
	        var oInput = $("#u_nickname");

	        if ( nickname == "") {
        	  showErrorMsg(oMsg,"필수정보입니다.");
              setFocusToInputObject(oInput);	         
              return false;
            }

	        var nonchar = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;

	        if (!nonchar.test(nickname)) {
	            showErrorMsg(oMsg,"한글과 영문만 입력가능합니다. (특수기호, 공백 사용 불가)");
	            setFocusToInputObject(oInput);
	            return false;
	        }

	                
	        $.ajax({
	            type:"GET",
	            url: "check_nickname.do?u_nickname=" + nickname,
	            success : function(data) {
					//db에 존재하는 닉네임 없으면 data=y 넘어옴
	                if (data == "Y") {
	                	 if (event == "first") {
	                		 showSuccessMsg(oMsg, "사용 가능한 닉네임입니다.");
	                		 hideMsg
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
	  	

//-------------주소 유무 체크 함수------------------------------------

   function checkAddr(){
	    	
    	   var addr = $("#u_addr").val();
           var oMsg = $("#addrMsg");
           var oInput = $("#u_addr");

           if ( addr == "") {
         	  showErrorMsg(oMsg,"필수정보입니다.");
               setFocusToInputObject(oInput);	         
               return false;
             }

           hideMsg(oMsg);
           return true;
	    }
   
//------------전화번호 체크 함수(인증 구현시 삭제 예정)------------------------------

   function checkTel(){
	    	
    	   var tel = $("#u_tel").val();
           var oMsg = $("#telMsg");
           var oInput = $("#u_tel");

           if ( tel == "") {
         	  showErrorMsg(oMsg,"필수정보입니다.");
               setFocusToInputObject(oInput);	         
               return false;
             }
           
           var isTel = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
           if (!isTel.test(tel)){
        	   showErrorMsg(oMsg,"형식에 맞지 않는 전화번호입니다.");
               setFocusToInputObject(oInput);	         
               return false;
           }

           hideMsg(oMsg);
           return true;
	    }
	    
//-------------생일 체크 함수-------------------------------
		function checkBirth(){
	
	
		}

   
//-------------메시지 표시, 가입버튼 활성화---------------------- 
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
//-------------shift/capslock/spacebar 대응------------------------------------  
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
	    

		  //enrollAction에서 실패시 redirect되는 parameter 받기
		  function showMessage(){
			  if("false" == "true"){
				  alert('회원가입에 실패했습니다. 관리자에게 문의하세요');
				  return;
			  } 
		   idFlag = false;
		   pwdFlag = false;
		   submitFlag = false;
		  }

	</script> 

</head>
<body>
<form id="enroll_form" method="post" action="enroll.do">
	<div id="header">
           <span id="title">상추마켓</span>
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
                    </span>
                    <span class="error_next_box" id="pwd1Msg"></span>
                </div>

                <!-- PWD2 -->
                <div>
                    <h3 class="join_title"><label for="u_pwd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="u_pwd2" name="u_pwd2" class="int" maxlength="20" autocomplete="off">
                    </span>
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
                        <input type="text" id="u_nickname" name="u_nickname" class="int" maxlength="20">
                    </span>
                    <span class="error_next_box" id="nickMsg"></span>
                </div>

                <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label>생년월일</label></h3>
			      	  <input type="date" name="u_birth" id="u_birth" required> 
                    <span class="error_next_box" id="birthMsg"></span>    
                </div>

                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">이메일<span class="optional">(선택)</span></label></h3>
                    <span class="box int_email">
                        <input type="text" id="u_email" name="u_email" class="int" maxlength="100" placeholder="선택입력">
                    </span>
                    <span class="error_next_box" id="emailMsg"></span>    
                </div>

                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="u_tel" name="u_tel" class="int" maxlength="16" placeholder="전화번호 입력">
                    </span>
                    <span class="error_next_box" id="telMsg"></span>    
                </div>
                
			    
				 	 <h3 class="join_title"><label>주소</label></h3>
				   
				    <span class="box int_addr">
				          <input type="text" class="int" id="sample2_postcode" name="postcode" style="float:left"readonly>
					   	  <input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" style="clear:both">
					</span>
					
					<span class="box int_addr2">    
					      <input type="text" class="int" id="sample2_address" name="address" readonly>
					</span>   
					
					 <span id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
					   	  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
					 </span>
					
					 
					   	  <span id="addrMsg" style="display:none"></span>
			  
			     


                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" id="enroll_btn">
                        <span>가입하기</span>
                    </button>
                </div>

                

            </div> 
            <!-- content-->



        </div> 
        <!-- wrapper -->
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
        var borderWidth = 1; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>	
</body>
</html>