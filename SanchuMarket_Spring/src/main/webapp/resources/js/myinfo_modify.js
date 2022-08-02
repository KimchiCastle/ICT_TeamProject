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
	let nameFlag = true;
	let telFlag = true;
	
	 $(document).ready(function(){ 
		 
	    	
	    	$("#u_name").blur(function(){
	    		checkName();
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
	    });//end document.ready
	 
    	
    var nonchar = /[^가-힣a-zA-Z0-9]/;
	var isTel = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
	
	var Delimg = false;
	
	//이름 유효성 체크 함수   
	function checkName() {
	
		var oMsg = $("#nameMsg");
		var name = $("#u_name").val();
		var oInput = $("#u_name");
	
		if (name == '') {
			showErrorMsg(oMsg, "필수정보입니다.");
			setFocusToInputObject(oInput);
	
			nameFlag = false;
	
			return;
		}
	
		
	
		if (name != "" && nonchar.test(name)) {
			showErrorMsg(oMsg, "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
			setFocusToInputObject(oInput);
			
			
			nameFlag = false;
	
			return;
		}
	
		nameFlag = true;
		hideMsg(oMsg);
		return;
	}
	
	
	
	function checkTel() {
	
		var tel = $("#u_tel").val();
		var oMsg = $("#telMsg");
		var oInput = $("#u_tel");
	
		if (tel == "") {
			showErrorMsg(oMsg, "필수정보입니다.");
			setFocusToInputObject(oInput);
			telFlag = false;
			return;
		}
	
		
		if (!isTel.test(tel)) {
			showErrorMsg(oMsg, "형식에 맞지 않는 전화번호입니다.");
			setFocusToInputObject(oInput);
			
			
			
			telFlag = false;
			return;
		}
	
		telFlag = true;
	
		hideMsg(oMsg);
	}
	    
		//생일 체크 함수
		function checkBirth(){
	
			let birth = $("#u_bitrh").val();
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
	
	
	
	// 이미지 업로드
	function imgUpload(){
		
		$("#u_photo").click();
		
	}
	
	function imgdel(){
		
		$("#imgup_sum").attr('src','../resources/image/image_upload.png');
		$("#u_photo").val('');
		
		Delimg = true;
		
	}
	
	
	$(function(){
		
		$("#u_photo").on('change',function(){
			
			if( $("#u_photo")[0].files[0]==undefined) {
				
				
				return;
			
			}
			
			imgcheck0(this);
			
		})
		
	});
	
	
	function imgcheck0(input) {
		
		/* 이미지 확장자 파일체크 */
		var file_kind = input.value.lastIndexOf('.');
		var file_name = input.value.substring(file_kind+1,input.length);
		var file_type = file_name.toLowerCase();

		var check_array = new Array( 'jpg','png','jpeg' );

		
		if(check_array.indexOf(file_type)==-1){
			
			/* 사용자에게 알려주고 */
			alert('이미지 파일만 선택할 수 있습니다.');

			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#u_photo').val('');
			
			return;
		
		} 
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
		        $('#imgup_sum').attr('src', e.target.result);
				
				Delimg = false;
				
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	
	

 	    //회원가입 실행
	function modify(u_idx) {
		
		var u_name = $("#u_name").val().trim();
		var u_birth = $("#u_birth").val().trim();
		var u_tel = $("#u_tel").val().trim();
		var u_photo = $("#u_photo").val().trim();
		
		var u_profile = $("#u_profile").val();
		
		var postcode = $("#sample2_postcode").val().trim();
		
		var u_addr = $("#sample2_address").val().trim();
		
		var detailaddr = $("#sample2_detailAddress").val().trim();
		
		
		if(u_name==''){
			alert('이름을 반드시 입력하세요.');
			$("#u_name").focus();
			return;
		}
		
		if(nonchar.test(u_name)){
			alert('한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)');
			$("#u_name").val('');
			$("#u_name").focus();
			return;
		}
		
		if(u_birth==''){
			alert('생년월일을 반드시 입력하세요.');
			$("#u_birth").focus();
			return;
		}
		
		if(u_tel==''){
			alert('전화번호를 반드시 입력하세요');
			$("#u_tel").focus();
			return;
		}
		
		
		if(!isTel.test(u_tel)){
			alert('형식에 맞지 않는 전화번호입니다.');
			$("#u_tel").val('');
			$("#u_tel").focus();
			return;
		}
		
		if(postcode==''){
			alert('주소를 입력하세요.');
			return;
		}
		
		if(detailaddr==''){
			alert('상세주소를 입력하세요.');
			$("#sample2_detailAddress").focus();
			return;
		}
		
		// 주소 + 상세주소
		u_addr += " "+detailaddr;
		
		if(!confirm('회원정보를 수정하시겠습니까?')) return;
		
		
		
		
		var form = $("#imgform")[0];
		
		alert($("#u_photo")[0].files[0]);
		
		var formData = new FormData(form);
		//form에 이미지추가, 이미지가 있을 때
		if($("#u_photo")[0].files[0]!=undefined){
			formData.append('u_photo', $("#u_photo")[0].files[0]);
			
		}
		//이미지를 삭제했을때
		if(Delimg){
			formData.append('Delimg','이미지삭제');
		}
		formData.append('u_idx',u_idx);
		formData.append('u_name',u_name);
		formData.append('u_birth',u_birth);
		formData.append('u_tel',u_tel);
		formData.append('u_profile',u_profile);
		formData.append('postcode',postcode);
		formData.append('u_addr',u_addr);
		
		/*	파일 데이터를 ajax처리 하기 위해선
			반드시 processData,contentType 을 false 해주기
		 */
		console.log(formData);
		
		$.ajax({
			
			url		: 'myInfoModify.do',
			type	: 'POST',
			data	: formData,
			processData : false,
			contentType : false,
			dataType : 'json',
			success	: function(res){
				
				if(res.result){
					alert('회원정보가 수정되었습니다. 다시 로그인해주세요.');
					
					location.href='../mainpage/logout.do';
					
				}else{
					alert('회원정보수정중 문제가 발생했습니다. 관리자에게 문의해주세요.');
					return;
				}
				
			},
			error	: function(err){
				alert('에러발생');
			}
			
			
		})
		
		
	}