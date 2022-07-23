


//<!-- 이미지 장수 표현 함수 -->-----------------------
	function img_num() {
		
		var img_number = 0;
		
		for(var i=0; i<preview_array.length; i++ ){
			if(preview_array[i]==true){
				img_number++;
			}
			
		}
		/* 이미지 장수 표시 */
		$("#img_number").html('('+ img_number + '/6)');
		
	}
//-----------------------------------------------------------







//<!-- 주소API -->-------------------------------------------
	function addrFind() {
		
		var width = 500; //팝업의 너비
		var height = 300; //팝업의 높이
		
		
	    new daum.Postcode({
	        oncomplete: function(data) {
	         
	            $("#p_location").val(data.address);
	        },
	    
	    	theme: {
		        searchBgColor: "#7dd87d", //검색창 배경색
		        queryTextColor: "white" //검색창 글자색
		    },
		    
		    width: width, 
		    height: height
		    
	    
	    
	    }).open({
	        left: (window.screen.width / 2) - (width / 2),
	        top: (window.screen.height / 2) - (height / 2) - 200
	    });
		
	}

//-----------------------------------------------------------



//<!-- 데이터 넣기 -->---------------------------------------

	var regular_han = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z]/;
	
	function proInfoModify() {
		
		/* 세션으로부터 받은 u_idx 값 */
		var u_idx = $("#u_idx").val().trim();
		
		var p_name = $("#p_name").val().trim();
		
		var c_idx = $("#c_idx").val();
		
		var p_condition = $("input:radio[name=p_condition]:checked").val();
		
		var p_location = $("#p_location").val().trim();
		
		var p_price = $("#p_price").val().trim();
		
		var p_exp = $("#p_exp").val().trim();
		
//		var sumimage = $("#sumimage").val();
		
		//보안상 이유때문에 file의 value값은 미리 정할 수 없음.
		//그래서 이미지 배열을 통해 해결
 		if(preview_array[0]==false){
 			alert('대표 이미지를 반드시 등록해주세요.');
 			$("#imgup").focus();
 			return;
 		}
		
		if(p_name==''){
			
			alert('제목이 비어있습니다. (필수입력, 공백불가)');
			$("#p_name").val('');
			$("#p_name").focus();
			return;
		}
		
		if(c_idx==0){
			alert('카테고리를 선택하세요. ');
			$("input:radio[name=c_idx]").focus();
			return;
		}
		
		
		if(p_location==''){
			alert('거래지역을 입력해 주세요.');
			$("#p_location").val('');
			$("#p_location").focus();
			return;			
		}
		
		//라디오를 checked해놓지 않았음.
		if(p_condition==undefined){
			alert('상품상태를 선택해 주세요.');
			$("input:radio[name=p_condition]").focus();
			return;
		}
		
				
		if(p_price==''){
			
			alert('가격이 비어있습니다.');
			$("#p_price").val('');
			$("#p_price").focus();
			return;
		}
		
		
		if(p_exp==''){
			
			alert('상품 설명이 비어있습니다. ');
			$("#p_exp").val('');
			$("#p_exp").focus();
			return;
		}

		
		if( regular_han.test(p_price) ){
			alert('숫자만 입력 가능합니다.');
			$("#p_price").val('');
			$("#p_price").focus();
			return;
		} 

		/* 가격 콤마 제거 */
		p_price = p_price.replace(/,/g, "");
		
		if(p_price<100){
			alert('가격은 100원 이상 입력해주세요.');
			$("#p_price").val('');
			$("#p_price").focus();
			return;
		}
		
		if(confirm('등록 하시겠습니까?')==false) return;
		
		var form = $("#imgform")[0];
		var p_idx = $("#p_idx").val();
		var formData = new FormData(form);
		
		
		formData.append('imagedata',$('#sumimage')[0].files[0]);
		formData.append('imagedata',$('#imageFile1')[0].files[0]);
		formData.append('imagedata',$('#imageFile2')[0].files[0]);
		formData.append('imagedata',$('#imageFile3')[0].files[0]);
		formData.append('imagedata',$('#imageFile4')[0].files[0]);
		formData.append('imagedata',$('#imageFile5')[0].files[0]);
		formData.append('u_idx',u_idx);				// 유저 idx
		formData.append('p_name',p_name);			// 상품명
		formData.append('c_idx',c_idx);				// 카테고리번호
		formData.append('p_location',p_location);	// 지역
		formData.append('p_condition',p_condition);	// 상품상태
		formData.append('p_price',p_price);			// 가격
		formData.append('p_exp',p_exp);				// 상품설명
		//수정 에서 추가 되었음
		formData.append('p_idx',p_idx);				// 수정하려는 상품 idx
		formData.append('change_image',change_image)  // 이미지 수정정보
 	 	
		$.ajax({
			
			url 	 : 'product_modify.do',
			type	 : 'POST',
			data	 : formData,
			processData : false,
			contentType : false,
			dataType : 'json',
			success  : function(res){
				
				if(res.res==true){
					alert('상품수정 성공!');
					location.href='../mainpage/list.do';
				}
				
			},error	: function(err){
				alert('상품수정에 실패했습니다. 관리자에게 문의하세요.');
				
			}
			
		}); 
		
		
	}
	

	/* 상품등록 취소  */	
	function procancel(){
		
		if(confirm('상품등록을 취소하시겠습니까?')==false) return;
		
		location.href='../mainpage/list.do';
		
	}
	
//----------------------------------------------------------


//<!-- 가격 함수 (실시간 콤마, 한글입력불가) -->------------
	$(function() {

		$("#p_price").on("propertychange change keyup paste input", function() {
			
			
			var p_price = $(this).val() ;
			
			if(p_price<100 ){
				$("#price_under").show();
				$("#price_under").text('100원 이상만 입력하세요.').css('color','red');
		 		$("#p_price").css('outline','1px solid red');
				$("#p_price").css('border-color','red');
				
			}
			
			if(p_price>=100 || p_price=='' ){
				$("#price_under").hide();
				$("#p_price").css('border-color','black');
				$("#p_price").css('outline','black');
			}
			
			/* 숫자 comma 찍는 함수 */
			p_price = comma(uncomma(p_price));
			
			
			/* console.log(p_price); */
			
			$("#p_price").val(p_price);

		});

	})
	
	
	/* 실제 입력값을 변경해주는 함수 */
	function comma(str) {
	    str = String(str);
	    
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	function uncomma(str) {
	    str = String(str);
	    
	    if(regular_han.test(str)){
	    	alert('숫자만 입력하세요');
	    }
	    
	    return str.replace(/[^\d]+/g, '');
	}
//----------------------------------------------------------


//<!-- 실시간 글자수 체크 코드 -->--------------------------	
	
	
	function numberMaxLength(e) {
		if (e.value.length > e.maxLength) {
			e.value = e.value.slice(0, e.maxLength);
		}
	}

	$(function() {

		$("#p_name").on("propertychange change keyup paste input", function() {

			var p_name = $(this).val().length;

			/* console.log(p_name); */

			$("#name_length").html(p_name + '/40')

		});

	})

	$(function() {

		$("#p_exp").on("propertychange change keyup paste input", function() {

			var p_exp = $(this).val().length;

			$("#exp_length").html(p_exp + '/1000')

		});

	})
//----------------------------------------------------------	
