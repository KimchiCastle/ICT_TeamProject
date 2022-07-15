<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>

<link rel="stylesheet" 
      href="${ pageContext.request.contextPath }/resources/css/product_insert.css">





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

<!-- insert JavaScript -->
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/product_insert.js"></script>

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
					<td class="td1" align="left" ><span
						class="pro_info">상품이미지</span> 
						<span class="pro_info" id="img_number">(0/6)</span>
						<span style="color: red">*</span>
						<input type="image" id="imgup" onclick="img_preview();"
								src="${ pageContext.request.contextPath }/resources/image/image_upload.png" width="150px" height="150px">
						</td>
					<td class="td2" align="left">
					
						<!-- 이미지 등록 영역 -->
						<div id="img_zone">
							<div id="img_preview0" >
								<input type="image" id="imgup_sum" onclick="send_0();"
									src="" width="150px" height="150px">
								<span id="sum_style" >대표 이미지</span>
								<!-- 삭제버튼 -->
								<span id="del_sum" class="chk_style"  onclick="del_sum();">x</span>
							</div>
							
								
							<div id="img_preview1" >
								<input type="image" id="imgup_1" onclick="send_1();"
									src="" width="150px" height="150px">
								<!-- 삭제버튼 -->
								<span id="del_img1" class="chk_style" onclick="del_img1();">x</span>
							</div>
							
							<div id="img_preview2">
								<input type="image" id="imgup_2" onclick="send_2();"
									src="" width="150px" height="150px">
								<span id="del_img2" class="chk_style" onclick="del_img2();">x</span>
							</div>

							<div id="img_preview3">
								<input type="image" id="imgup_3" onclick="send_3();"
									src="" width="150px" height="150px">
								<span id="del_img3" class="chk_style" onclick="del_img3();">x</span>
							</div>

							<div id="img_preview4">
								<input type="image" id="imgup_4" onclick="send_4();"
									src="" width="150px" height="150px">
								<span id="del_img4" class="chk_style" onclick="del_img4();">x</span>
							</div>

							<div id="img_preview5">
								<input type="image" id="imgup_5" onclick="send_5();"
									src="" width="150px" height="150px">
								<span id="del_img5" class="chk_style" onclick="del_img5();">x</span>
							</div>
							
							
							
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
						<div style="display: inline-block; min-width: 70px; ">
							<span class="pro_info" id="name_length">0/40</span>
						</div>
						<input maxlength="40"
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
					<td align="left">
					
						<br>
						<div>
						<textarea class="input-tag"
							id="p_exp" name="p_exp" maxlength="1000"
							oninput="numberMaxLength(this);"
							placeholder="구입연도, 브랜드, 사용감, 하자유무 등 필요한 정보를 넣어주세요. &#13;&#10;구매자의 문의를 좀더 줄일 수 있습니다."></textarea>
						</div>
						<div align="right"><span style="font-size: 18px;"id="exp_length">0/1000</span></div>
					</td>
				</tr>

				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<!-- 등록 취소버튼 -->
				<tr>
					<td colspan="2">
						<input class="btn btn-success" type="button" value="등록하기" onclick="proInfoSend();"> 
						<input class="btn btn" type="button" value="취소하기" onclick="procancel()"></td>
				</tr>

			</table>

		</div>

	</div>

</body>
</html>