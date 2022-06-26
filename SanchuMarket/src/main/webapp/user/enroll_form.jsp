<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<style type="text/css">
  
  body{
     width: 600px;
     height: 800px; 
     margin: auto;
    
  }
  
  #title{
	 font-size: 30px; 
	 font-weight: bold;
	 color: #1f6f78;
	 line-height: 5;
	 cursor: pointer;
	  }
  
  #title-wrap{
    text-align:center;
  }  
  
  .table{
     width: 100%;
     height: 100%; 
     font-size: 15px; 
  }
  
  td{
    width: 30%;
  }
  
  .form-control{
    height: 40px;
    width: 300px;
  }
  
  #enroll_btn{
    width: 50%;
    padding: 21px 0 17px;
    border: 0;
    cursor: pointer;
    background-color: #aeccc6;
    font-size: 20px;
    font-weight: 600;
    align: center;
  }
  
   #enroll_btn.hover {
      color: #bbe9db;
   }
  
  .btn_area {
    margin: 30px 50px 20px 91px;
   }
   
  

</style>
	<script>
	    var idFlag = false;
	    var pwdFlag = false;
	    var submitFlag = false;
	  /*   var nickFlag = false;
	    var emailFlag = false;
	    var addrFlag = false;
		var birthFlag = false;
		var telFlag = false; */
		
		//유효성검사를 해주는 각 flag들이 1이 되어야 회원가입이 진행됨
	    $(document).ready(function(){
	    	
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
	    	
	    	 $("#u_pwd").blur(function() {
	            pwFlag = false;
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
	    })
//-------------이름 유효성 체크 함수------------------------------------ 	    
    	function checkName(){
    		
    		var oMsg = $("#nameMsg");
   	        var nonchar = /[^가-힣a-zA-Z0-9]/gi;

   	        var name = $("#u_name").val();
   	        var oInput = $("#u_name");
			if(name==""){
				showErrorMsg(oMsg,"필수정보입니다.");
		        setFocusToInputObject(oInput);
				return false;
			}
			
			 if (name != "" && nonchar.test(name)) {
				 showErrorMsg(oMsg,"한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
			     setFocusToInputObject(oInput);
		         return false;
		    }
			 
		    hideMsg(oMsg);
	        return true;
    	 }

//-------------비밀번호 유효성 체크 함수------------------------------------ 	

	    function checkPwd() {
	        if(pwFlag) return true;

	        var pwd1 = $("#u_pwd1").val();
	        var oMsg = $("#pwd1Msg");
	        var oInput = $("#u_pwd1");

	        if (pwd1 == "") {
	            showErrorMsg(oMsg,"필수정보입니다.");
	            setFocusToInputObject(oInput);
	            return false;
	        }
	      
	        //밑의 isValidPwd 함수 호출
	        if (!isValidPwd(pwd1)) {
	            showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
	            setFocusToInputObject(oInput);
	            return false;
	        }
	    }
	    
//----------------비밀번호 일치 확인 함수-----------------------
	    function checkPwd2() {
	       
	        $("#pwd2").on(propertychange change keyup paste input, function(){
	        	
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
			    });
	        		pwdFlag = true;
	        }
	        		
//-------------비밀번호 유효성 체크 함수(boolean반환)------------------------------------
		function isValidPwd(str) {
		        var cnt = 0;
		        if (str == "") {
		            return false;
		        }
		
		        var retVal = checkSpace(str);
		        if (retVal) {
		            return false;
		        }
		        if (str.length < 8) {
		            return false;
		        }
		        
		        //전체 글자수 중복된 단어 제한
		        for (var i = 0; i < str.length; ++i) {
		            if (str.charAt(0) == str.substring(i, i + 1))
		                ++cnt;
		        }
		        if (cnt == str.length) {
		            return false;
		        }
		
		        var isPwd = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
		        if (!isPwd.test(str)) {
		            return false;
		        }
		
		        return true;
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

	        if ( id == "") {
        	  showErrorMsg(oMsg,"필수정보입니다.");
              setFocusToInputObject(oInput);	         
              return false;
            }

	        var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	        if (!isID.test(id)) {
	            showErrorMsg(oMsg,"5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
	            setFocusToInputObject(oInput);
	            return false;
	        }

	        idFlag = false;
	                
	        $.ajax({
	            type:"GET",
	            url: "check_id.do?u_id=" + id,
	            success : function(data) {
					//db에 존재하는 아이디 없으면 data=y 넘어옴
	                if (data == "Y") {
	                	//checkId함수에 들어온 인자 first
	                	//blur함수로 처음 입력시 first가 들어옴
	                    if (event == "first") {
	                        showSuccessMsg(oMsg, "사용 가능한 아이디입니다.");
	                    } else {
	                        hideMsg(oMsg);
	                    }
	                    idFlag = true;
	                } else { 
	                	
	                    showErrorMsg(oMsg, "이미 사용중인 아이디입니다.");
	                    setFocusToInputObject(oInput);
	                }
	            }
	        });
	        return true;
	      }
	  	  }
//--------------닉네임 유효성 체크 함수------------------------
  
			function checkNickname(event){
	  		
	  		if(nickFlag) return true;

	        var nickname = $("#u_nickname").val();
	        var oMsg = $("#nickMsg");
	        var oInput = $("#u_nickname");

	        if ( nickname == "") {
        	  showErrorMsg(oMsg,"필수정보입니다.");
              setFocusToInputObject(oInput);	         
              return false;
            }

	        var nonchar = /[^가-힣a-zA-Z0-9]/gi;

	        if (!nonchar.test(nickname)) {
	            showErrorMsg(oMsg,"한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
	            setFocusToInputObject(oInput);
	            return false;
	        }

	        nickFlag = false;
	                
	        $.ajax({
	            type:"GET",
	            url: "check_nickname.do?u_nickname=" + nickname,
	            success : function(data) {
					//db에 존재하는 닉네임 없으면 data=y 넘어옴
	                if (data == "Y") {
	                	//checkNick함수에 들어온 인자 first
	                	//blur함수로 처음 입력시 first가 들어옴
	                    if (event == "first") {
	                        showSuccessMsg(oMsg, "사용 가능한 닉네임입니다.");
	                    } else {
	                        hideMsg(oMsg);
	                    }
	                    nickFlag = true;
	                } else { 
	                	
	                    showErrorMsg(oMsg, "이미 사용중인 닉네임입니다.");
	                    setFocusToInputObject(oInput);
	                }
	            }
	        });
	        return true;
	      }
	  	  }

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
   
//-------------메시지 표시------------------------------------  
	    function hideMsg(obj) {
        	obj.hide();
       }
	    function showErrorMsg(obj, msg) {
	        obj.attr("color", "red");
	        obj.html(msg);
	        obj.show();
	    }

	    function showSuccessMsg(obj, msg) {
	        obj.attr("color", "blue");
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
	        if (str.search(/\s/) != -1) {
	            return true;
	        } else {
	            return false;
	        }
	    }

	</script> 

</head>
<body>

		<form id="enroll_form" method="post" action="enroll.do">
			<div id="content">
				     <!--span은 정렬이 안됨-->
			 <div id="title-wrap"><span id="title">상추마켓</span></div>
			 <table class="table"> 
			    
			    <tr>
			      <td style="vertical-align: middle;">이름</td>	
			      <td colspan="2">
			      <input type="text" class="form-control" id="u_name" name="u_name">
			      <span id="nameMsg" style="display:none"></span>
			      </td>
			    </tr>
			    	
			    <tr>
			      <td style="vertical-align: middle;">이메일</td>
			      <td colspan="2">
			       <input type="text" class="form-control"  id="u_email" name="u_email">
			       <span id="emailMsg" style="display:none"></span>
			      </td>	
			    </tr>
			    
			    <tr>
			      <td style="vertical-align: middle;">아이디</td>
			      <td colspan="2">
			       <input type="text" class="form-control"  id="u_id" name="u_id">
			       <span id="idMsg" style="display:none"></span>
			      </td>	
			    </tr>
			  
			    <tr>
			      <td style="vertical-align: middle;">비밀번호</td>
			      <td colspan="2">	
			       <input type="password" class="form-control"  id="u_pwd" name="u_pwd">
			       <span id="pwd1Msg" style="display:none">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>
			       <input type="password" class="form-control"  id="u_pwd2"">
			       <span id="pwd2Msg" style="display:none"></span>
			      </td>
			    </tr>
			    
			     <tr>
			      <td style="vertical-align: middle;">닉네임</td>
			      <td colspan="2"><input type="text" class="form-control"  id="u_nickname" name="u_nickname">
				  <span id="nickMsg" style="display:none"></span>
				  </td>			   
			    </tr>
			    
			    <tr>
			       <td style="vertical-align: middle;">전화번호</td>
			       <td colspan="2"> <input type="text" class="form-control" id="u_tel" name="u_tel">
			        <span id="telMsg" style="dislay:none"></span>
			       </td>
			     </tr>
			     
			     <tr>
				   <td style="vertical-align: middle;">주소</td>
			       <td colspan="2">
			       <input type="text" id="sample2_postcode" name="postcode" style="margin-bottom:5px;"readonly>
					<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample2_address" name="address"style="width:295px; margin-bottom:5px;" readonly><br>
					<input type="text" id="sample2_detailAddress" name="detailAddress" placeholder="상세주소" style="width:295px;">
					<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				    <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
				    <span id="addrMsg" style="display:none"></span>
			       </td>
			     </tr>
			   
			     <tr>
			       <td style="vertical-align: middle;">생년월일</td>
			      		<td colspan="2">
			      		<input type="date" name="u_birth" id="u_birth" required> 
			      		<span id="birthMsg" style="display:none"></span>
				   </td>
			     </tr>
			
			    <tr>	 
				   <td colspan="2">
				  <div class="btn_area">
                    <button type="button" id="enroll_btn" class="btn-type btn_primary"><span>가입하기</span></button>
                </div>
				   </td>
			    </tr>
			 
	   </table>
	   </div>  
	</form>


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