<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품등록</title>

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style type="text/css">
	
	#root {
	
		/* 		background: #ccffcc; */
		width: 100%;
		height: 100%;
	}
	
	#insert_box {
	
		width: 850px;
		margin: auto;
		margin-top: 30px;
		/* 		background: gray; */
		min-height: 1000px;
		text-align: center;
	}
	
	#recent {
	
		float: left;
		position: sticky;
		top: 100px;
		left: 1200px;
	}
	
	#title {
	
		font-size: 40px;
	}
	
	.pro_info {
	
		font-size: 17px;
		
	}
	

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
	
	#p_name{
		width: 450px;

	}
	
	#p_exp{
		
		padding: 15px;
		
		width: 550px;
		height: 150px;
		
		resize: none;
	}
	
	#p_condition {
		 width:15px;
		 height:15px;
	}
	
	#imgmp_1{
		cursor: pointer;
	}
		
	#imgup_2,#imgup_3,#imgup_4,#imgup_5 {
		display: none;
	}
	
	
	input {
	  accent-color: red;
	}
	
	/* 테이블 간의 간격 */
	td {
		 padding: 0.8em 1.4em 0.5em 0.8em;
	}
	
	
	
</style>

<script type="text/javascript">
	
	
	
	function send(){
		$("#ajaxFile1").click();
		return;
	}
	
	
	
	
	 function numberMaxLength(e){
	        if(e.value.length > e.maxLength){
	            e.value = e.value.slice(0, e.maxLength);
	        }
	    }
	
	 function numberMaxLength2(e){
	        if(e.value.length > e.maxLength){
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
	
	$(function(){
	
		$("#p_exp").on("propertychange change keyup paste input", function() {

			var p_exp = $(this).val().length;
			
			
			$("#exp_length").html(p_exp + '/1000')

		});
		
		
	})
	
	
	
</script>


</head>
<body>
<form enctype="multipart/form-data" method="POST">
		<input type="file" id="ajaxFile1" style="display: none;">

</form>
	<div id="root">
		전체 div
		<div id="recent">
			<%@ include file="../sidebar/sideBar.jsp"%>
		</div>
		<div id="insert_box">
			<span id="title">상품등록</span>
			
			<table  style="margin-top:30px;"  >
				<tr>
					<td colspan="2" align="left" >
					<span class="pro_info">기본정보</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span style=" font-size:10px; color: red">*필수항목</span></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<tr>
					<td width="30%;" align="left" style="vertical-align : top;">
						<span class="pro_info">상품이미지</span>
						<span class="pro_info">(0/5)<span style="color: red">*</span></span>
					</td>
					<td width="70%;" align="left">
					<div>
						<img id="imgup_1" onclick="send(); return;" src="../imgdata/upload_img.png" width="150px" height="150px">
						<img id="imgup_2" onclick="send();" src="../imgdata/upload_img.png" width="150px" height="150px">
						<img id="imgup_3" onclick="send();" src="../imgdata/upload_img.png" width="150px" height="150px">
						<img id="imgup_4" onclick="send();" src="../imgdata/upload_img.png" width="150px" height="150px">
						<img id="imgup_5" onclick="send();" src="../imgdata/upload_img.png" width="150px" height="150px">
						
						
					
					</div> 
					</td>
				</tr>
				
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<tr>
					<td width="30%;" align="left" style="vertical-align : top;">
					<span class="pro_info">제목<span style="color: red">*</span></span>
					</td>
					<td width="70%;" align="left">
						<input maxlength="40" type="text" id="p_name" name="p_name" class="input-tag" 
						placeholder="제목을 입력하세요." oninput="numberMaxLength(this);">
						&nbsp;&nbsp;
						<span class="pro_info" id="name_length">0/40</span>
					</td>
				</tr>
				
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<tr>
					<td width="30%;" align="left" style="vertical-align : top;">
						<span class="pro_info">카테고리<span style="color: red">*</span></span>
					</td>
					<td width="70%;" align="left">
						<select class="input-tag" id="c_idx" name="c_idx" style="width: 30%;">
							<option value="1">남성의류</option>
							<option value="2">여성의류</option>
							<option value="3">도서/문구</option>
							<option value="4">음반/악기</option>
							<option value="5">가전</option>
							<option value="6">뷰티/미용</option>
						</select>
					</td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
					
				<tr>
					<td width="30%;" align="left" style="vertical-align : top;">
						<span class="pro_info">거래지역<span style="color: red">*</span></span>
					</td>
					
					
					
				</tr>	
				
				<tr>
					<td colspan="2"><hr></td>
				</tr>	
					
				<tr>
					<td width="30%;" align="left" style="vertical-align : top;">
						<span class="pro_info">상태<span style="color: red">*</span></span>
					</td>
					<td width="70%;" align="left">
						<input type="radio"  name="p_condition" id="p_condition" value="중고상품">
						<span class="pro_info">중고상품</span>
						<input type="radio"  name="p_condition" id="p_condition" value="새상품">
						<span class="pro_info">새상품</span>
					
					</td>
				</tr>
				
				<tr>
					<td colspan="2"><hr></td>
				</tr>				
				
				<tr>
					<td width="30%;" align="left" style="vertical-align : top;">
						<span class="pro_info">가격<span style="color: red">*</span></span>
					</td>
					<td width="70%;" align="left" >
						<input type="text" id="p_price" name="p_price" 
						class="input-tag" placeholder="가격" style="width: 30%;">
						&nbsp;
						<span class="pro_info">원</span>
					</td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>				
				
				<tr>
					<td width="30%;" align="left" style="vertical-align : top;">
						<span class="pro_info">상품설명<span style="color: red">*</span></span>
					</td>				
					<td align="left">
					<span style="font-size: 18px;" id="exp_length">0/1000</span>
					<textarea class="input-tag" id="p_exp" name="p_exp" maxlength="1000" oninput="numberMaxLength2(this);"
						placeholder="구입연도, 브랜드, 사용감, 하자유무 등 필요한 정보를 넣어주세요. &#13;&#10;구매자의 문의를 좀더 줄일 수 있습니다."></textarea>
					
					</td>
				</tr>
				
				<tr>
					<td colspan="2"><hr></td>
				</tr>				
				
				<tr>
					<td colspan="2">
						<input type="button" value="등록하기">
						<input type="button" value="취소하기">
					</td>
				</tr>
				
			</table>



		</div>



	</div>



</body>
</html>