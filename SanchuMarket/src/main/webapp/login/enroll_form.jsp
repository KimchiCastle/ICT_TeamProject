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
     background-color: #f5f4e8;
     
  }
  
  #title{
	 font-size: 30px; 
	 font-weight: bold;
	 line-height: 5;
	 display: inline-block;
  }
  
  #title_wrap{
    text-align: center;
  }
  
  .table{
     width: 100%;
     height: 100%; 
     font-size: 15px; 
  }
  
  td{
  	width: 300px;
  }
  
  .th{
    width: 20%;
  }
  
  .form-control{
     width: 300px;
  }
  
  .birth-form-control{
     /* width: 100px; */
     padding: 0.3em 1.4em 0.5em 0.8em;
  }
  #zip-form-control{
     width: 100px;
     padding: 0.8em 1.4em 0.5em 0.8em;
     display: block;	
     margin-bottom: 5px;
  }
  #addr_search{
    float: left;
    margin-top: 10px;
  }
  #enroll_btn{
    text-align: center;
    margin-top: 30px;
  }

</style>
	<!-- <script>
		regular_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		regular_pwd = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
		regular_tel = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		
		 function send(f){
				
				let email = f.email.value;
				let pwd = f.pwd.value;
				let tel = f.tel.value;
				let name = f.name.value;
				let nickname = f.nickname.value;
				let birth = f.birth.value;
			
				if(regular_tel.test(tel)==false){
					
					alert("유효한 전화번호 형식이 아닙니다.")
					$( "#enroll").attr('disabled',true);
					f.tel.value='';
					f.tel.focus();
					return;
				}
				
				f.action = "insert.do";
				f.submit();
			}
		
		//문서 내의 element 배치가 완료되면,
	  $(document).ready(function(){
		  
		  //아이디 입력창에서 키가 입력되면, << 콜백함수
		  $("#email").keyup(function(e){
			  
			  var email = $( this ).val();
			  
			  if(regular_email.test(email)==false){
				  $("#email_msg").html("올바른 이메일 형식이 아닙니다.")
				     .css("color","red");
				  
				  //서버 안갔다왔을때(클라쪽). 여기 비활성화 안주면 안됨
				  $("#enroll").attr("disabled",true);
				  return;
			  }
				//서버에 사용 가능 여부 확인
				
			  $.ajax({
				  url:'email_check.do',  
			      data:{"email":email}, 
			      dataType:'json',
			      success:function(res){
			    	  //res = {"result":true}
			    	  //res = {"result":false}
			    	  if(res.result){//사용가능할때
			    		  $("#email_msg").html("사용 가능한 이메일입니다.")
			 		     .css("color","blue");
			    	  
			    	     //(서버 갔다오고 나서)가입버튼 활성화
			    	     $("#enroll").attr("disabled",false);
			    	     
			    	  }else{//사용중일때
			    		  $("#email_msg").html("이미 사용중인 이메일입니다.")
				 		 .css("color","red");
			    	  
			    	  	  //아이디 다시 안되는걸로 바꿨을때(서버 갔다오고 나서)비활성화
			    		 $("#enroll").attr("disabled",true);
			    	  }
			      },
			      error:function(err){
			    	  alert(err.responseText);
			      }
			  });
		  });
	  });
		
	  $(document).ready(function(){
		  
		  //아이디 입력창에서 키가 입력되면, << 콜백함수
		  $("#pwd").keyup(function(e){
			  
			  var pwd = $( this ).val();
			  
			  if(regular_pwd.test(pwd)==false){
				  
				  $("#pwd_msg").html("영문,숫자를 포함한 8자리 이상의 글자를 입력하세요.")
				     .css("color","red");
				  
				  //서버 안갔다왔을때(클라쪽). 여기 비활성화 안주면 안됨
				  $("#enroll").attr("disabled",true);
				  return;
			  }else{
				  
				  $("#pwd_msg").html("사용 가능한 비밀번호입니다.")
		 		     .css("color","blue");
		    	  
		    	     $("#enroll").attr("disabled",false);
			  }
		  });
	  });
	</script> -->	

		<script>
		  // 2월:28일, 4,6,9,11월 30일로 변환 함수
		  function dayChange(){
			  
			  change_month = $("#u_birth_month").val();
			  change_day = $("#u_birth_day").val();
			 
			  if((change_month == 4) || (change_month == 6) || (change_month == 9) || (change_month == 11)){
				  
			  	for(let i=1; i<30; i++){
			  		
			  		$("#u_birth_day").attr(i);
			  	}
			  }
			  
			  if(change_month == 2) {
				  
				for(let i=1; i<28; i++){
				  		
				  $("#u_birth_day").attr(i);
				}
			  }
			  
			  return;
		  }
		
		</script>

		<!--주소 팝업창 api-->
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		    function daumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                $("#u_zipcode").val(data.zonecode);
		                $("#u_addr").val(roadAddr);
		                $("#u_addr").val(data.jibunAddress);
		         
		                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		                if(roadAddr !== ''){
		                	 $("#u_addr").val().append(extraRoadAddr);
		                } else {
		                	 $("#u_addr").val().append();
		                }
		
		                var guideTextBox = document.getElementById("guide");
		                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		                if(data.autoRoadAddress) {
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		                    guideTextBox.style.display = 'block';
		
		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		                    guideTextBox.style.display = 'block';
		                } else {
		                    guideTextBox.innerHTML = '';
		                    guideTextBox.style.display = 'none';
		                }
		            }
		        }).open();
		    }
		</script>			      
</head>
<body>

		<form>
			<div id="content">
				
			 <div id="title_wrap"><span id="title">상추마켓</span></div>
			 <table class="table">    
			    <tr>
			      <td class="th" style="vertical-align: middle;">이름</td>	
			      <td colspan="2"><input type="text" class="form-control" id="u_name" name="u_name"></td>
			    </tr>
			    
			    <tr>
			      <td class="th" style="vertical-align: middle;">이메일</td>
			      <td colspan="2">
			       <input type="text" class="form-control"  id="u_email" name="u_email">
			       <span id="email_msg">ddd</span>
			      </td>	
			    </tr>
			    
			    <tr>
			      <td class="th" style="vertical-align: middle;">아이디</td>
			      <td colspan="2">
			       <input type="text" class="form-control"  id="u_id" name="u_id">
			       <span id="id_msg">ddd</span>
			      </td>	
			    </tr>
			  
			    <tr>
			      <td class="th" style="vertical-align: middle;">비밀번호</td>
			      <td colspan="2">	
			      <input type="password" class="form-control"  id="u_pwd" name="u_pwd">
			      <span id="pwd_msg">ddd</span>
			      </td>
			    </tr>
			    
			     <tr>
			      <td class="th" style="vertical-align: middle;">닉네임</td>
			      <td colspan="2"><input type="text" class="form-control"  id="u_nickname" name="u_nickname"></td>
			    </tr>
			   
			     <tr>
			       <td class="th" style="vertical-align: middle;">생일</td>
			      		<td colspan="2">
			      		<select id="u_birth_year" name="u_birth_year" style="width: 120px;" class="birth-form-control" >
						<option value="">년</option>
						<c:forEach var="i" begin="1950" end="2022">
						  <option value="${i}">${i}</option>
						  </c:forEach>
						</select>
						  
						<select id="u_birth_month" name="u_birth_month" class="birth-form-control" onchange="dayChange();">
						  <option value="">월</option>
						  <c:forEach var="i" begin="1" end="12">
						  <c:choose>
						  
						      <c:when test="${i < 10 }">
						        <option value="0${i}">0${i}</option>
						     </c:when>
						    <c:otherwise>
						        <option value="${i}">${i}</option>
						      </c:otherwise>
						  </c:choose>
						  </c:forEach>
						</select>
						  
						<select id="u_birth_day" name="u_birth_day" class="birth-form-control">
						  <option value="">일</option>
						  <c:forEach var="i" begin="1" end="31">
						  <c:choose>
						      <c:when test="${i lt 10 }">
						        <option value="0${i}">0${i}</option>
						    </c:when>
						    <c:otherwise>
						        <option value="${i}">${i}</option>
						      </c:otherwise>
						  </c:choose>
						  </c:forEach>
						</select>
					</td>
			     </tr>
			
			     <tr>
			       <td class="th" style="vertical-align: middle;">전화번호</td>
			       <td colspan="2"> <input type="text" class="form-control" id="u_tel" name="u_tel"></td>
			     </tr>
			     
			     <tr>
				   <td class="th" style="vertical-align: middle;">주소</td>
			       <td colspan="2">
			       <input type="text" id="zip-form-control" id="u_zipcode" name="u_zipcode" readonly>
			        <input type="text" class="form-control" id="u_addr" name="u_addr" readonly>
			       <input type="button" id="addr_search" value="검색" onclick="daumPostcode();">
			       </td>
			     </tr>

			    <tr>	 
				   <td colspan="2"><input id="enroll_btn" type="button" value="회원가입" onclick="send(tdis.form);" disabled="disabled" ></td>
			    </tr>
			 
	   </table>
	   </div>   
	</form>

</body>
</html>