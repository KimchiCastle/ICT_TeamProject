<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	
	
	function find(f) {
		 new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            // data = {'zonecode':13245,'address':'서울시 마포구 노고산동','roadAddress':'','jibunAddress':'',ㅇㅇㅇㅇ}
		       		
		            //선택된 주소의 우편번호 넣기
		        	
		            $("#m_zipcode").val(data.zonecode);
		            $("#m_addr").val(data.address);
		            
		        },
				 theme: {
		             searchBgColor: "#0B65C8", //검색창 배경색
		             queryTextColor: "#FFFFFF" //검색창 글자색
		         },
		         
		 }).open();
	}
	function send(f){
		  var m_name   =   f.m_name.value.trim();
	      var m_pwd   =   f.m_pwd.value.trim();
	      var m_zipcode   =   f.m_zipcode.value.trim();
	      var m_addr   =   f.m_addr.value.trim();
	      
	      if(m_name==''){
    		 alert('이름을 입력하세요');
	         f.m_pwd.value='';
	         f.m_pwd.focus();
	         return;
	      }
	      
	      if(m_pwd==''){
	         alert('비밀번호을 입력하세요');
	         f.m_pwd.value='';
	         f.m_pwd.focus();
	         return;
	      }
	      
	      if(m_zipcode==''){
	         alert('우편번호를 입력하세요');
	         f.m_zipcode.value='';
	         f.m_zipcode.focus();
	         return;
	      }
	      
	      if(m_addr==''){
	         alert('주소를 입력하세요');
	         f.m_addr.value='';
	         f.m_addr.focus();
	         return;
	      }
	      
	      f.action="modify.do";
	      f.submit();
	}
	
	

</script>
<script type="text/javascript">
	//현재 Element가 배치완료되면 자동호출
	$(document).ready(function(){
   
   //수정폼에 회원등급을 설정
   $("#m_grade").val("${vo.m_grade}");
   
});

</script>
<style type="text/css">
#box {
	width: 800px;
	margin: auto;
	margin-top: 20px;

}

#collapse {
	text-align: center;
	width: 600px;
	margin: auto;
}

th {
	margin: auto;
	text-align: center;
	width: 150px;
}

td {
	margin: auto;
	text-align: center;
	float:left;

}

#button{
	margin-top: 15px;
	margin-right: 15px;
}
</style>
</head>
<body>
	
		<jsp:include page="index.jsp" />
		<form>
		<div id="box" align="center" width="600px" style="font-size: 11pt;">
			<table id="collapse" class="table table-striped" >

				<input type="hidden" name="m_idx" value="${vo.m_idx }">

				<tr>
					<th>이름</th>
					<td><input name="m_name" value="${vo.m_name }"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input name="m_id" value="${vo.m_id}" readonly="readonly"></td>

				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="m_pwd" value="${vo.m_pwd }"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input name="m_zipcode" id="m_zipcode"
						value="${vo.m_zipcode }"> <input type="button"
						value="주소찾기" onclick="find(this.form);"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="m_addr" id="m_addr" size="60"
						value="${vo.m_addr }"></td>
				</tr>
				
			</table>
			<div id="button">		
						<input class="btn btn-info" type="button" value="수정하기"	onclick="send(this.form);">
					
						<input class="btn btn-danger" type="button"value="회원탈퇴" onclick="">
					
						<input class="btn btn-success" type="button" value="목록보기"  onclick="location.href='list.do'">
			</div>	
		</div>

		<br>
		<hr>
		
	</form>
</body>
</html>











