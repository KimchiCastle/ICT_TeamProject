<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>

<link rel="stylesheet" 
      href="${ pageContext.request.contextPath }/resources/css/product_modify.css">





<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- daum API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<!-- 이미지 추가버튼 스크립트 -->
<script type="text/javascript">
	var preview_array  = [false, false, false, false, false, false];
	
	var myMap = new Map();
	
	
	for(var y=0; y<${ fn:length(vo.image_list) }; y++){
		preview_array[y] = true;
	}
	
	function img_preview() {

		for(var i=0; i<preview_array.length; i++){
			
			
			/* i가 0일때 */
			if(i==0){
				
				/* 0번사진 비어있으면 */
				if(preview_array[0]==false){
					
					/* 섬네일사진 */
					/* 0번사진 인풋태그 호출 */
					
					send_0();
					
					return;
				}
			}
			
			/* i가1일때 */
			if(i==1){
				
				/* 1번사진이 비어있으면 */
				if(preview_array[1]==false){
					
					/* 1번사진 인풋태그 호출 */
					send_1();
					
					return;
				}
			}
			
			/* i가 2일때 */
			if(i==2){
				
				/* 2번사진 비어있으면 */
				if(preview_array[2]==false){
					
					/* 2번사진 인풋태그 호출 */
					send_2();
					return;
				}
			}
			
			/* i가 3일때 */
			if(i==3){
				
				/* 3번사진 비어있으면 */
				if(preview_array[3]==false){
					
					/* 3번사진 인풋태그 호출 */
					send_3();
					return;
				}
			}
			
			/* i가 4일때 */
			if(i==4){
				
				/* 4번사진 비어있으면 */
				if(preview_array[4]==false){
					
					/* 4번사진 인풋태그 호출 */
					send_4();

					return;
				}
			}
			
			/* i가 5일때 */
			if(i==5){
				
				/* 5번사진 비어있으면 */
				if(preview_array[5]==false){
					
					/* 5번사진 인풋태그 호출 */
					send_5();
					
					return;
				}
			}
			
			
			
					
		}/*  for end */
		
		alert("더이상 등록할 수 없습니다.");
		return;
		
	}/* 프리뷰 end */


</script>

<script type="text/javascript">
//<!-- 이미지 미리보기 -->-----------------------------------
	function send_0() {
		
		
		$("#sumimage").click();
	
			
	}
	
	$(function(){
		
		$("#sumimage").on('change',function(){
			
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
	
		var check_array = new Array( 'jpg','png','jpeg' );
	
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
		        	
				alert('${vo.image_list[0].i_idx}');
	
		        $("#img_preview0").css("display","inline-block");
				$("#imgup_sum").show();
		        $("#del_sum").show();
		       
				preview_array[0] = true;
				
				
				/* 이미지넘버 변경 */
				img_num();
			
			
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
	
		var check_array = new Array( 'jpg','png','jpeg' );
	
		
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
	        
	        	$("#img_preview1").css("display","inline-block");
	        	$("#imgup_1").show();
	        	$("#del_img1").show();
	        	
	        	preview_array[1] = true;
				
	        	/* 이미지넘버 변경 */
	        	img_num();
	        	
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
	
		var check_array = new Array( 'jpg','png','jpeg' );
	
		
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
				
				 $("#img_preview2").css("display","inline-block");
				$("#imgup_2").show();
				$("#del_img2").show();
				
				preview_array[2] = true;
	        	/* 이미지넘버 변경 */
				img_num();
	       
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
	
		var check_array = new Array( 'jpg','png','jpeg' );
	
		
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
				
				 $("#img_preview3").css("display","inline-block");
				$("#imgup_3").show();
				$("#del_img3").show();
				
				preview_array[3] = true;
	        	/* 이미지넘버 변경 */
				img_num();
	       
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
	
		var check_array = new Array( 'jpg','png','jpeg' );
	
		
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
				$("#img_preview4").css("display","inline-block");
				$("#imgup_4").show();
				$("#del_img4").show();
				
				preview_array[4] = true;
	        	/* 이미지넘버 변경 */
				img_num();
				
	       
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
	
		var check_array = new Array( 'jpg','png','jpeg' );
	
		
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
		        
		        $("#img_preview5").css("display","inline-block");
				$('#imgup_5').show();
		        $("#del_img5").show();
				
		        preview_array[5] = true;
		        /* 이미지넘버 변경 */
		        img_num();
	       
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}

//-----------------------------------------------------------



</script>



<!-- modify JavaScript -->
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/product_modify.js"></script>


</head>
<body>
	<!-- 파일업로드 용 폼 -->
	<form enctype="multipart/form-data" id="imgform" method="post">
		<input type="file" id="sumimage"   style="display: none;" accept=".jpg, .jpeg, .png">
		<input type="file" id="imageFile1" style="display: none;" accept=".jpg, .jpeg, .png">
		<input type="file" id="imageFile2" style="display: none;" accept=".jpg, .jpeg, .png">
		<input type="file" id="imageFile3" style="display: none;" accept=".jpg, .jpeg, .png">
		<input type="file" id="imageFile4" style="display: none;" accept=".jpg, .jpeg, .png">
		<input type="file" id="imageFile5" style="display: none;" accept=".jpg, .jpeg, .png">
	</form>

	<div id="root">
		<input type="hidden" id="u_idx" value="${ user.u_idx }">
	 	<div id="mainframe">
			<%@ include file="../mainpage/header&sidebar.jsp"%>
		</div> 
		<div id="insert_box">
			<span id="title">상품수정</span>

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
					<td class="td1" align="left" ><span
						class="pro_info">상품이미지</span> 
						<span class="pro_info" id="img_number">(${ fn:length(vo.image_list) }/6)</span>
						<span style="color: red">*</span>
						<input type="image" id="imgup" onclick="img_preview();"
								src="${ pageContext.request.contextPath }/resources/image/image_upload.png" width="150px" height="150px">
						</td>
					<td class="td2" align="left">
					
						<!-- 이미지 등록 영역 -->
						<div id="img_zone">
							<div id="img_preview0" >
								<input type="image" id="imgup_sum" onclick="send_0();"
									src="${pageContext.request.contextPath }/resources/imgdata/${ vo.image_list[0].imagedata }" width="150px" height="150px">
								<span id="sum_style" >대표 이미지</span>
								<!-- 삭제버튼 -->
								<span id="del_sum" class="chk_style"  onclick="del_sum();">x</span>
							</div>
							
							<!-- 1번이미지 데이터가 있으면 -->	
							<c:if test="${ not empty vo.image_list[1].imagedata }">
								<div id="img_preview1" >
									<input type="image" id="imgup_1" onclick="send_1();"
										src="${pageContext.request.contextPath}/resources/imgdata/${ vo.image_list[1].imagedata }" width="150px" height="150px">
									<!-- 삭제버튼 -->
									<span id="del_img1" class="chk_style" onclick="del_img1();">x</span>
								</div>
							</c:if>	
							
							<!-- 1번이미지 데이터 없으면  -->
							<c:if test="${ empty vo.image_list[1].imagedata }">
								<div id="img_preview1" style="display: none;">
									<input type="image" id="imgup_1"  style="display: none;" onclick="send_1();"
										src="" width="150px" height="150px">
									<!-- 삭제버튼 -->
									<span id="del_img1"  class="chk_style" style="display: none;" onclick="del_img1();">x</span>
								</div>
							</c:if>	
							
							
							<!-- 2번이미지 데이터가 있으면 -->	
							<c:if test="${ not empty vo.image_list[2].imagedata }">
								<div id="img_preview2">
									<input type="image" id="imgup_2" onclick="send_2();"
										src="${pageContext.request.contextPath}/resources/imgdata/${ vo.image_list[2].imagedata }" width="150px" height="150px">
									<!-- 삭제버튼 -->
									<span id="del_img2" class="chk_style" onclick="del_img2();">x</span>
								</div>
							</c:if>
							
							
							<!-- 2번이미지 데이터가 없으면 -->	
							<c:if test="${ empty vo.image_list[2].imagedata }">
								<div id="img_preview2" style="display: none;">
									<input type="image" id="imgup_2" style="display: none;" onclick="send_2();"
										src="" width="150px" height="150px">
									<!-- 삭제버튼 -->
									<span id="del_img2" class="chk_style" style="display: none;" onclick="del_img2();">x</span>
								</div>
							</c:if>
							
							<!-- 3번이미지 데이터가 있으면 -->
							<c:if test="${ not empty vo.image_list[3].imagedata }">
								<div id="img_preview3">
									<input type="image" id="imgup_3" onclick="send_3();"
										src="${ pageContext.request.contextPath }/resources/imgdata/${ vo.image_list[3].imagedata }" width="150px" height="150px">
									<span id="del_img3" class="chk_style" onclick="del_img3();">x</span>
								</div>
							</c:if>
							
							<!-- 3번이미지 데이터가 없으면 -->
							<c:if test="${ empty vo.image_list[3].imagedata }">
								<div id="img_preview3" style="display: none;">
									<input type="image" id="imgup_3" style="display: none;" onclick="send_3();"
										src="" width="150px" height="150px">
									<span id="del_img3" class="chk_style" style="display: none;" onclick="del_img3();">x</span>
								</div>
							</c:if>
							
							<!-- 4번이미지 데이터가 있으면 -->
							<c:if test="${ not empty vo.image_list[4].imagedata }">
								<div id="img_preview4">
									<input type="image" id="imgup_4" onclick="send_4();"
										src="${ pageContext.request.contextPath }/resources/imgdata/${ vo.image_list[4].imagedata }" width="150px" height="150px">
									<span id="del_img4" class="chk_style" onclick="del_img4();">x</span>
								</div>
							</c:if>
							
							<!-- 4번이미지 데이터가 없으면 -->
							<c:if test="${ empty vo.image_list[4].imagedata }">
								<div id="img_preview4" style="display: none;">
									<input type="image" id="imgup_4" style="display: none;" onclick="send_4();" 
										src="" width="150px" height="150px">
									<span id="del_img4" class="chk_style" style="display: none;" onclick="del_img4();">x</span>
								</div>
							</c:if>
							
							<!-- 5번이미지 데이터 있으면 -->
							<c:if test="${ not empty vo.image_list[5].imagedata }">
								<div id="img_preview5">
									<input type="image" id="imgup_5" onclick="send_5();"
										src="${ pageContext.request.contextPath }/resources/imgdata/${ vo.image_list[5].imagedata }" width="150px" height="150px">
									<span id="del_img5" class="chk_style" onclick="del_img5();">x</span>
								</div>
							</c:if>
							
							<!-- 5번이미지 데이터가 없으면 -->
							<c:if test="${ empty vo.image_list[5].imagedata }">
								<div id="img_preview5" style="display: none;">
									<input type="image" id="imgup_5" style="display: none;" onclick="send_5();"
										src="" width="150px" height="150px">
									<span id="del_img5" class="chk_style" style="display: none;" onclick="del_img5();">x</span>
								</div>
							</c:if>
							
							
						</div>
						<div id="img_intro">
								
								* <b>대표 이미지</b>는 반드시 <font color="red"><b>등록</b></font>해야 합니다.<br>
								- 이미지를 <b>클릭할</b> 경우 이미지를 <b>수정</b>하실 수 있습니다.<br>
								- 이미지 등록은 좌측 <b>이미지 등록</b>을 눌러 등록할 수 있습니다.<br>
								- 이미지 확장자는 <b>.jpg, .jpeg, .png</b> 만 등록 가능합니다.
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
					<td class="td2" align="left">
						<div style="display: inline-block; min-width: 70px;">
						<span class="pro_info" id="name_length">${ fn:length(vo.p_name) }/40</span>
						</div>
						<input maxlength="40" value="${vo.p_name}"
						oninput="numberMaxLength(this);" type="text" id="p_name"
						name="p_name" class="input-tag" placeholder="제목을 입력하세요.">
					</td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<!-- 카테고리 -->
				<tr>
					<td class="td1" align="left" style="vertical-align: top;"><span
						class="pro_info">카테고리<span style="color: red">*</span></span></td>
					<td class="td2" align="left"><select class="input-tag"
						id="c_idx" name="c_idx" style="width: 30%; height: 35px;">
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
						<input type="text" id="p_location" class="input-tag" style="margin-top: 5px;" value="${ vo.p_location }" readonly="readonly">
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
						name="p_condition" id="p_condition" value="중고상품">
						<span class="pro_info">중고상품</span> 
						<input type="radio" name="p_condition" id="p_condition" value="새상품"> <span
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
						name="p_price" class="input-tag" placeholder="가격" value="<fmt:formatNumber pattern="#,###" value="${ vo.p_price }"/>"
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
					<td align="left">
					
						<br>
						<div>
						<textarea class="input-tag"
							id="p_exp" name="p_exp" maxlength="1000"
							oninput="numberMaxLength(this);"
							placeholder="구입연도, 브랜드, 사용감, 하자유무 등 필요한 정보를 넣어주세요. &#13;&#10;구매자의 문의를 좀더 줄일 수 있습니다.">${ vo.p_exp }</textarea>
						</div>
						<div align="right"><span style="font-size: 18px;"id="exp_length">${ fn:length(vo.p_exp) }/1000</span></div>
					</td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<!-- 등록 취소버튼 -->
				<tr>
					<td colspan="2">
						<input class="btn btn-success" type="button" value="등록하기" onclick="proInfoModify();"> 
						<input class="btn btn" type="button" value="취소하기" onclick="procancel()"></td>
				</tr>

			</table>

		</div>

	</div>

</body>
</html>