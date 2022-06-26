<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품등록</title>

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- daum API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
	#root {
		/* 		background: #ccffcc; */
		width: 100%;
		height: 100%;
	}
	
	/* 실제 전체 div */
	#insert_box {
		width: 1020px;
		margin: auto;
		padding-top : 160px;
		/* 		background: gray; */
		min-height: 1000px;
		text-align: center;
	}
	
	/* 인클루드 한 메인프레임 */
	#mainframe {
		position : absolute;
		z-index: 999;
	}
	
	
	#title {
		font-size: 40px;
	}
	
	/* span태그 */
	.pro_info {
		font-size: 21px;
	}
	
	/* 전체 인풋태그 css */
	.input-tag {
		display: inline-block;
		height: 30px;
		padding: 0 10px;
		vertical-align: middle;
		border: 1px solid black;
		width: 60%;
		color: black;
		font-size: 15px;
		border-radius: 5px;
	}
	
	/* 이미지 미리보기 css */
	.img_preview{
	
		margin: 10px;
		display: inline-block;
		position: relative;
		
/* 		width: 155px;
		height: 155px; */
		
/* 		border: 2px solid black; */
	
	}
	/* 미리보기 삭제버튼 css */
	.chk_style{
	width:30px;
	height:30px;
    position:absolute; 
	font-size:20px;
	outline:none;
	border:none;
	border-radius:15px;
    right:13px;
    bottom:120px;
    /* z-index:1; */
    background-color:rgba(0,0,0,0.5);
    color:#ffcccc;
	}
	
		
	/* 미리보기 삭제 css */
	#del_img1, #del_img2, #del_img3, #del_img4, #del_img5,#del_sum{
		cursor: pointer;
		display: none;
	}
	
	/* 이미지 미리보기 css */
	#imgup_1,#imgup_2, #imgup_3, #imgup_4, #imgup_5,#imgup_sum {
		cursor: pointer;
		display: none;
	}
	
	
	.input-tag:focus{
		outline: none;
		border: 1px solid black;
	}
	
	/* 제목입력창 넓이 */
	#p_name {
		width: 450px;
	}
	
	/* 제품설명 textarea css */
	#p_exp {
		padding: 15px;
		width: 550px;
		height: 150px;
		resize: none;
	}
	
	/* 주소버튼 */
	#addrfind, #myaddr{
		
		background: white;
		cursor: pointer;
		border: 1px solid black;
		width: 80px;
		height: 30px;
		
	}
	
	/* 상품 상태 */
	#p_condition {
		width: 15px;
		height: 15px;
	}
	
	input {
		accent-color: red;
	}
	
	/* 테이블 간의 간격 */
	td {
		width: 1020px;
		padding: 0.8em 1.4em 0.5em 0.8em;
	}
	
	.td1{
		width: 20%;
	}
	
	.td2{
		width: 80%;
	}
	
	
</style>

<!-- 이미지 추가버튼 스크립트 -->
<script type="text/javascript">
	
	var preview_array  = [false, false, false, false, false, false];
	
	var img_number = 0;
	
	function img_preview() {
		

		for(var i=0; i<preview_array.length; i++){
			
			
			/* i가 0일때 */
			if(i==0){
				
				/* 5번사진 비어있으면 */
				if(preview_array[0]==false){
					
					/* 섬네일사진 */
					/* 5번사진 인풋태그 호출 */
					
					send_0();
					
					
					
					return;
				}
			}
			
			
			
			/* i가0일때 */
			if(i==1){
				
				/* 1번사진이 비어있으면 */
				if(preview_array[1]==false){
					
					/* 1번사진 인풋태그 호출 */
					send_1();
					
					
					return;
				}
			}
			
			/* i가 1일때 */
			if(i==2){
				
				/* 2번사진 비어있으면 */
				if(preview_array[2]==false){
					
					/* 2번사진 인풋태그 호출 */
					send_2();
					
					return;
				}
			}
			
			/* i가 2일때 */
			if(i==3){
				
				/* 3번사진 비어있으면 */
				if(preview_array[3]==false){
					
					/* 3번사진 인풋태그 호출 */
					send_3();
					
					
					return;
				}
			}
			
			/* i가 3일때 */
			if(i==4){
				
				/* 4번사진 비어있으면 */
				if(preview_array[4]==false){
					
					/* 4번사진 인풋태그 호출 */
					send_4();
					

					return;
				}
			}
			
			/* i가 4일때 */
			if(i==5){
				
				/* 5번사진 비어있으면 */
				if(preview_array[5]==false){
					
					/* 5번사진 인풋태그 호출 */
					send_5();
					
					
					return;
				}
			}
					
		}/*  for end */
		
	}/* 프리뷰 end */
</script>	

<!-- 이미지 미리보기 -->
<script type="text/javascript">	

	/* 섬네일사진 */
	
	function send_0() {
		
		
		
		$("#sumimage").click();
		
	}
	
	$(function(){
		
		$("#sumimage").on('change',function(){
			
			/* 파일선택 취소했을때 */
			if( $("#sumimage")[0].files[0]==undefined) {
				
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

		var check_array = new Array( 'jpg','gif','png','jpeg' );

		$('#sumimage').val();
		
		if(check_array.indexOf(file_type)==-1){
			
			/* 사용자에게 알려주고 */
			alert('이미지 파일만 선택할 수 있습니다.');
			
			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#sumimage').val('');
			
			return;
		
		} 

		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
		        $('#imgup_sum').attr('src', e.target.result);
		        
		        
		        
				$('#imgup_sum').show();
		        $("#del_sum").show();
		       
				preview_array[0] = true;
				
				/* 이미지넘버 변경 */
			
				$("#img_number").html('('+ img_number + '/6)');
			
			
	        }
	        
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	
	
	/* 1번사진 */
	
	function send_1() {

		$("#imageFile1").click();
		
	}
	
	$(function(){
		
		$("#imageFile1").on('change',function(){
			
			/* 파일선택 취소했을때 */
			if( $("#imageFile1")[0].files[0]==undefined) {
				return;
			}
			
			imgcheck1(this);
			
		})
		
	});
	
	function imgcheck1(input) {
		
		/* 이미지 확장자 파일체크 */
		var file_kind = input.value.lastIndexOf('.');
		var file_name = input.value.substring(file_kind+1,input.length);
		var file_type = file_name.toLowerCase();

		var check_array = new Array( 'jpg','gif','png','jpeg' );

		
		if(check_array.indexOf(file_type)==-1){
			
			alert('이미지 파일만 선택할 수 있습니다.');
			
			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#imageFile1').val('');
			
			return;
		
		} 
		
		
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        
	        
	        	$('#imgup_1').attr('src', e.target.result);
	        	//배열에 트루값주기, 트루면 업로드 못함
	        
	        	$("#imgup_1").show();
	        	$("#del_img1").show();
	        	
	        	preview_array[1] = true;
				
	        	/* 이미지넘버 변경 */
				$("#img_number").html('('+ img_number + '/6)');
	        	
	        }
	        
	        reader.readAsDataURL(input.files[0]);
	    }
	}

	/* 2번사진 */

	function send_2() {
		$("#imageFile2").click();
	}
	
	$(function(){
		
		$("#imageFile2").on('change',function(){
			
			/* 파일선택 취소했을때 */
			if( $("#imageFile2")[0].files[0]==undefined) {
				return;
			}
			
			imgcheck2(this);
			
		})
		
	});
	
	
	
	function imgcheck2(input) {
		
		/* 이미지 확장자 파일체크 */
		var file_kind = input.value.lastIndexOf('.');
		var file_name = input.value.substring(file_kind+1,input.length);
		var file_type = file_name.toLowerCase();

		var check_array = new Array( 'jpg','gif','png','jpeg' );

		
		if(check_array.indexOf(file_type)==-1){
			
			alert('이미지 파일만 선택할 수 있습니다.');
			
			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#imageFile2').val('');
			
			return;
		
		} 
		
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
				$('#imgup_2').attr('src', e.target.result);
				
				
				$("#imgup_2").show();
				$("#del_img2").show();
				
				preview_array[2] = true;
	        	/* 이미지넘버 변경 */
				$("#img_number").html('('+ img_number + '/6)');
	       
	        }
	        
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	
	/* 3번사진 */
	
	function send_3() {
		$("#imageFile3").click();
	}
	
	$(function(){
		
		$("#imageFile3").on('change',function(){
			
			/* 파일선택 취소했을때 */
			if( $("#imageFile3")[0].files[0]==undefined){
				return;
			}
			
			imgcheck3(this);
			
		})
		
	});

	function imgcheck3(input) {
		
		/* 이미지 확장자 파일체크 */
		var file_kind = input.value.lastIndexOf('.');
		var file_name = input.value.substring(file_kind+1,input.length);
		var file_type = file_name.toLowerCase();

		var check_array = new Array( 'jpg','gif','png','jpeg' );

		
		if(check_array.indexOf(file_type)==-1){
			
			alert('이미지 파일만 선택할 수 있습니다.');
			
			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#imageFile3').val('');
			
			return;
		
		}
		
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
				$('#imgup_3').attr('src', e.target.result);
				
				
				$("#imgup_3").show();
				$("#del_img3").show();
				
				preview_array[3] = true;
	        	/* 이미지넘버 변경 */
				$("#img_number").html('('+ img_number + '/6)');
	       
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	
	/* 4번사진 */
	
	function send_4() {
		$("#imageFile4").click();
	}
	
	$(function(){
		
		$("#imageFile4").on('change',function(){
			
			/* 파일선택 취소했을때 */
			if( $("#imageFile4")[0].files[0]==undefined){
				return;
			}
			
			imgcheck4(this);
			
		})
		
	});

	function imgcheck4(input) {
		
		/* 이미지 확장자 파일체크 */
		var file_kind = input.value.lastIndexOf('.');
		var file_name = input.value.substring(file_kind+1,input.length);
		var file_type = file_name.toLowerCase();

		var check_array = new Array( 'jpg','gif','png','jpeg' );

		
		if(check_array.indexOf(file_type)==-1){
			
			alert('이미지 파일만 선택할 수 있습니다.');
			
			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#imageFile4').val('');
			
			return;
		
		}
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	
				$('#imgup_4').attr('src', e.target.result);
				
				$("#imgup_4").show();
				$("#del_img4").show();
				
				preview_array[4] = true;
	        	/* 이미지넘버 변경 */
				$("#img_number").html('('+ img_number + '/6)');
				
	       
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	
	/* 5번사진 */
	
	function send_5() {
		$("#imageFile5").click();
		
	}
	
	$(function(){
		
		$("#imageFile5").on('change',function(){
			
			/* 파일선택 취소했을때 */
			if( $("#imageFile5")[0].files[0]==undefined){
				
				return;
			}
			
			imgcheck5(this);
			
		})
		
	});

	function imgcheck5(input) {
		
		/* 이미지 확장자 파일체크 */
		var file_kind = input.value.lastIndexOf('.');
		var file_name = input.value.substring(file_kind+1,input.length);
		var file_type = file_name.toLowerCase();

		var check_array = new Array( 'jpg','gif','png','jpeg' );

		
		if(check_array.indexOf(file_type)==-1){
			
			alert('이미지 파일만 선택할 수 있습니다.');
			
			/* 실제 업로드 되는 input태그 vlaue값 지우기 */
			$('#imageFile5').val('');
			
			return;
		
		}
		
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
		        	
		        $('#imgup_5').attr('src', e.target.result);
		        
		        
				$('#imgup_5').show();
		        $("#del_img5").show();
				
		        preview_array[5] = true;
	        	
		        /* 이미지넘버 변경 */
				$("#img_number").html('('+ img_number + '/6)');
	       
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	

	
	
</script>


<!-- 이미지미리보기삭제 -->
<script type="text/javascript">
	
	function del_sum() {
		alert('썸네일이미지 지움');
		/* 실제 DB에 들어가는 input value 지움 */
		$('#sumimage').val('');
		
		$('#imgup_sum').hide();
		$("#del_sum").hide(); 
		
		/* 썸네일 비움 */
		preview_array[0] = false;
		
		
		img_number--;
		$("#img_number").html('('+ img_number + '/6)');
		
		return;
	}


	function del_img1() {
		alert('1번이미지 지움');
		
		$('#imageFile1').val('');

		
		$('#imgup_1').hide();
		$("#del_img1").hide();
		
		/* 1번사진 비움 */
		preview_array[1] = false;
		img_number--;
		$("#img_number").html('('+ img_number + '/6)');
		return;
	}
	
	function del_img2() {
		alert('2번이미지 지움');
		
		$('#imageFile2').val('');
		
		$('#imgup_2').hide();
		$("#del_img2").hide();
		
		/* 2번사진 비움 */
		preview_array[2] = false;
		img_number--;
		$("#img_number").html('('+ img_number + '/6)');
		return;
	}
	
	function del_img3() {
		alert('3번이미지 지움');
		
		$('#imageFile3').val('');
		
		$('#imgup_3').hide();
		$("#del_img3").hide(); 
		
		/* 3번사진 비움 */
		preview_array[3] = false;
		img_number--;
		$("#img_number").html('('+ img_number + '/6)'); 
		 
		return;
	}
	function del_img4() {
		alert('4번이미지 지움');
		
		$('#imageFile4').val('');
		
		$('#imgup_4').hide();
		$("#del_img4").hide();
		
		/* 4번사진 비움 */
		preview_array[4] = false;
		img_number--;
		$("#img_number").html('('+ img_number + '/6)');

		return;
	}
	function del_img5() {
		alert('5번이미지 지움');
		
		$('#imageFile5').val('');
		
		$('#imgup_5').hide();
		$("#del_img5").hide(); 
		
		/* 5번사진 비움 */
		preview_array[5] = false;
		img_number--;
		$("#img_number").html('('+ img_number + '/6)');
		
		return;
	}
	


</script>



<!-- 주소API -->
<script type="text/javascript">

	//다음에서 제공하는 주소 API
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


</script>




<!-- 데이터 넣기 -->
<script type="text/javascript">

	var regular_han = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z]/;
	
	function proInfoSend() {
		
		var p_name = $("#p_name").val().trim();
		
		var c_idx = $("#c_idx").val();
		
		var p_condition = $("#p_condition").val();
		
		var p_location = $("#p_location").val().trim();
		
		var p_price = $("#p_price").val().trim();
		
		var p_exp = $("#p_exp").val().trim();
		
		var sumimage = $("#sumimage").val();
		
 		if(sumimage==''){
 			alert('섬네일 이미지를 등록해주세요.');
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
			$("#c_idx").focus();
			return;
		}
		
		
		if(p_location==''){
			alert('거래지역을 입력해 주세요.');
			$("#p_location").val('');
			$("#p_location").focus();
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
		var formData = new FormData(form);
		
		formData.append('sumimage',$('#sumimage')[0].files[0]);
		formData.append('imageFile1',$('#imageFile1')[0].files[0]);
		formData.append('imageFile2',$('#imageFile2')[0].files[0]);
		formData.append('imageFile3',$('#imageFile3')[0].files[0]);
		formData.append('imageFile4',$('#imageFile4')[0].files[0]);
		formData.append('imageFile5',$('#imageFile5')[0].files[0]);
		formData.append('p_name',p_name);			// 상품명
		formData.append('c_idx',c_idx);				// 카테고리번호
		formData.append('p_location',p_location);	// 지역
		formData.append('p_condition',p_condition);	// 상품상태
		formData.append('p_price',p_price);			// 가격
		formData.append('p_exp',p_exp);				// 상품설명
		
 	 	$.ajax({
			
			url 	 : 'product_insert.do',
			type	 : 'POST',
			data	 : formData,
			processData : false,
			contentType : false,
			dataType : 'json',
			success  : function(res){
				alert('성공!')
			}
			
		}); 
		
		
		
	}

	
	

</script>

<!-- 가격 함수 (실시간 콤마, 한글입력불가) -->
<script type="text/javascript">
	
	
	
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
	
</script>


<!-- 실시간 글자수 체크 코드 -->
<script type="text/javascript">
	
	function numberMaxLength(e) {
		if (e.value.length > e.maxLength) {
			e.value = e.value.slice(0, e.maxLength);
		}
	}

	$(function() {

		$("#p_name").on("propertychange change keyup paste input", function() {

			var p_name = $(this).val().length;

			console.log(p_name);

			$("#name_length").html(p_name + '/40')

		});

	})

	$(function() {

		$("#p_exp").on("propertychange change keyup paste input", function() {

			var p_exp = $(this).val().length;

			$("#exp_length").html(p_exp + '/1000')

		});

	})
	
	
</script>


</head>
<body>
	<!-- 파일업로드 용 폼 -->
	<form enctype="multipart/form-data" id="imgform" method="post">
		<input type="file" id="sumimage"   style="display: none;" accept=".gif, .jpg, .jpeg, .png">
		<input type="file" id="imageFile1" style="display: none;" accept=".gif, .jpg, .jpeg, .png">
		<input type="file" id="imageFile2" style="display: none;" accept=".gif, .jpg, .jpeg, .png">
		<input type="file" id="imageFile3" style="display: none;" accept=".gif, .jpg, .jpeg, .png">
		<input type="file" id="imageFile4" style="display: none;" accept=".gif, .jpg, .jpeg, .png">
		<input type="file" id="imageFile5" style="display: none;" accept=".gif, .jpg, .jpeg, .png">
	</form>

	<div id="root">
	
	 	<div id="mainframe">
			<%@ include file="../mainpage/header&sidebar.jsp"%>
		</div> 
		<div id="insert_box">
			<span id="title">상품등록</span>

			<table style="margin-top: 30px;">
				<!-- 기본정보 -->
				<tr>
					<td colspan="2" align="left"><span class="pro_info">기본정보</span>
						&nbsp;&nbsp;&nbsp; <span style="font-size: 14px; color: red">*필수항목</span></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>

				<!-- 상품이미지 -->
				<tr>
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">상품이미지</span> 
						<span class="pro_info" id="img_number">(0/6)</span>
						<span style="color: red">*</span>
						</td>
					<td class="td2" align="left">
					
						<!-- 이미지 등록 영역 -->
						<div>
						
							<input type="image" id="imgup" onclick="img_preview();"
								src="../imgdata/image_upload.png" width="150px" height="150px">
							<br>
							
							<div class="img_preview" >
								<input type="image" id="imgup_sum" onclick="send_0();"
									src="" width="150px" height="150px">
								<!-- 삭제버튼 -->
								<input type="button" id="del_sum" class="chk_style" value="x" onclick="del_sum();">
							</div>
							
								
							<div class="img_preview" >
								<input type="image" id="imgup_1" onclick="send_1();"
									src="" width="150px" height="150px">
								<!-- 삭제버튼 -->
								<input type="button" id="del_img1" class="chk_style" value="x" onclick="del_img1();">
							</div>
							
							<div class="img_preview">
								<input type="image" id="imgup_2" onclick="send_2();"
									src="" width="150px" height="150px">
								<input type="button" id="del_img2" class="chk_style" value="x" onclick="del_img2();">
							</div>

							<div class="img_preview">
								<input type="image" id="imgup_3" onclick="send_3();"
									src="" width="150px" height="150px">
								<input type="button" id="del_img3" class="chk_style" value="x" onclick="del_img3();">
							</div>

							<div class="img_preview">
								<input type="image" id="imgup_4" onclick="send_4();"
									src="" width="150px" height="150px">
								<input type="button" id="del_img4" class="chk_style" value="x" onclick="del_img4();">
							</div>

							<div class="img_preview">
								<input type="image" id="imgup_5" onclick="send_5();"
									src="" width="150px" height="150px">
								<input type="button" id="del_img5" class="chk_style" value="x" onclick="del_img5();">
							</div>
								
						</div>


					</td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<!-- 제목  -->
				<tr>
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">제목<span style="color: red">*</span></span></td>
					<td class="td2" align="left"><input maxlength="40" oninput="numberMaxLength(this);"
						type="text" id="p_name" name="p_name" class="input-tag"
						placeholder="제목을 입력하세요." >
						&nbsp;&nbsp; <span class="pro_info" id="name_length">0/40</span></td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<!-- 카테고리 -->
				<tr>
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">카테고리<span style="color: red">*</span></span></td>
					<td class="td2" align="left"><select class="input-tag"
						id="c_idx" name="c_idx" style="width: 30%;">
							<option value="0">카테고리 선택</option>
							<option value="1">남성의류</option>
							<option value="2">여성의류</option>
							<option value="3">도서/문구</option>
							<option value="4">음반/악기</option>
							<option value="5">가전</option>
							<option value="6">뷰티/미용</option>
					</select></td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<!-- 거래지역 -->
				<tr>
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">거래지역<span style="color: red">*</span></span></td>
					
					<td align="left">
						<input type="button" id="myaddr" value="내주소" >
						<input type="button" id="addrfind" value="주소찾기" onclick="addrFind();">
						<br>
						<input type="text" id="p_location" class="input-tag" style="margin-top: 5px;" readonly="readonly">
					</td>


				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<!-- 상품상태 -->
				<tr>
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">상품상태<span style="color: red">*</span></span></td>
					<td class="td2" align="left"><input type="radio"
						name="p_condition" id="p_condition" value="중고상품" checked="checked">
						<span class="pro_info">중고상품</span> <input type="radio"
						name="p_condition" id="p_condition" value="새상품"> <span
						class="pro_info">새상품</span></td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<!-- 가격  -->
				<tr>	
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">가격<span style="color: red">*</span></span></td>
					<td class="td2" align="left"><input type="text" id="p_price" maxlength="11"
						name="p_price" class="input-tag" placeholder="가격"
						oninput="numberMaxLength(this);" style="width: 30%;"> &nbsp; <span class="pro_info">원</span>
						<br>
						<span class="pro_info" id="price_under"></span>
					</td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<!-- 상품설명 -->
				<tr>
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">상품설명<span style="color: red">*</span></span></td>
					<td align="left"><span style="font-size: 18px;"
						id="exp_length">0/1000</span>
						<br>
						<textarea class="input-tag"
							id="p_exp" name="p_exp" maxlength="1000"
							oninput="numberMaxLength(this);"
							placeholder="구입연도, 브랜드, 사용감, 하자유무 등 필요한 정보를 넣어주세요. &#13;&#10;구매자의 문의를 좀더 줄일 수 있습니다."></textarea>

					</td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<!-- 등록 취소버튼 -->
				<tr>
					<td colspan="2"><input type="button" value="등록하기"
						onclick="proInfoSend();"> <input type="button"
						value="취소하기"></td>
				</tr>

			</table>

		</div>

	</div>

</body>
</html>