<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<!--JavaScript-->
<script type="text/javascript" src="../resources/js/myinfo_modify.js"></script>
<!--CSS-->
<link rel="stylesheet" 
      href="${ pageContext.request.contextPath }/resources/css/enroll_form.css">

</head>
<body >

<form enctype="multipart/form-data" id="imgform" method="POST">
	<input type="file" id="u_photo" style="display: none;" accept=".jpg, .jpeg, .png"> 
</form>


		<div id="header" style="padding-top:100px;">
           <span id="title">회원정보수정</span>
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
                        <input type="text" id="u_id" name="u_id" class="int" maxlength="20" value="${ vo.u_id }" readonly="readonly">
                    </span>
                    <span class="error_next_box" id="idMsg"></span>
                </div>
               

                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="u_name" name="u_name" class="int" value="${ vo.u_name }" maxlength="20">
                    </span>
                    <span class="error_next_box" id="nameMsg"></span>	
                </div>
                
                <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label>생년월일</label></h3>
			      	  <input type="text" name="u_birth" id="u_birth" value="${ vo.u_birth }" required> 
                    <span class="error_next_box" id="birthMsg"></span>    
                </div>
              
                <!-- TEL -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="u_tel" name="u_tel" value="${ vo.u_tel }" class="int" maxlength="16" required>
                    </span>
                    <span class="error_next_box" id="telMsg"></span>    
                </div>
                
                <!-- 등록한 사진파일이 없을때 -->
                <c:if test="${ vo.u_photo eq 'no_file' }">
	                <div>
	                	<h3 class="join_title" style="display: inline-block;"><label for="image">이미지</label></h3>
	                	<button type="button" class="btn" style="margin-left:170px; background-color: #ffaaaa;" onclick="imgdel();"><b>사진삭제</b></button>
	                	<br>
	                	<input type="image" id="imgup_sum" src="${ pageContext.request.contextPath }/resources/image/image_upload.png" onclick="imgUpload();" width="300px" height="300px">
	                </div>
                </c:if>
				
				<!-- 등록한 사진파일이 존재할때 -->
				<c:if test="${ vo.u_photo ne 'no_file' }">
					<div>
	                	<h3 class="join_title" style="display: inline-block;"><label for="image">이미지</label></h3>
	                	<button type="button" class="btn" style="margin-left:170px; background-color: #ffaaaa;'" onclick="imgdel();"><b>사진삭제</b></button>
	                	<br>
	                	<input type="image" id="imgup_sum" src="${ pageContext.request.contextPath }/resources/imgdata/${vo.u_photo}" onclick="imgUpload();" width="300px" height="300px">
	                </div>
				</c:if>                
                
                <div>
                	<h3 class="join_title"><label for="image">자기소개</label></h3>
                	<textarea id="u_profile" style="width:100%; height: 150px; resize:none; padding: 10px;" placeholder="자기소개">${ vo.u_profile }</textarea>
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
                    <button type="button" class="btn" id="enroll_btn" onclick="modify(${vo.u_idx});">
                        <span>수정</span>
                    </button>
                    <button type="button" class="btn" id="revoke_btn" onclick= "location.href='../mainpage/list.do'">
                        <span>취소</span>
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
       var borderWidth = 1;  //샘플에서 사용하는 border의 두께

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