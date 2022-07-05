<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<style type="text/css">

	.body1{
		padding-top: 131px;
	
	}
</style>

<script type="text/javascript">

	function find(f) {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				// 예제를 참고하여 다양한 활용법을 확인해 보세요.
				// data = {'zonecode':13245,'address':'서울시 마포구 노고산동','roadAddress':'','jibunAddress':'',ㅇㅇㅇㅇ}

				//선택된 주소의 우편번호 넣기

				$("#m_zipcode").val(data.zonecode);
				$("#m_addr").val(data.address);

			},
			theme : {
				searchBgColor : "#ffccff", //검색창 배경색
				queryTextColor : "#FFFFFF" //검색창 글자색
			},

		}).open();
	}
	function send(f) {
		var u_name = f.u_name.value.trim();
		var u_pwd = f.u_pwd.value.trim();
		var u_zipcode = f.u_zipcode.value.trim();
		var u_addr = f.u_addr.value.trim();

		if (u_name == '') {
			alert('이름을 입력하세요');
			f.u_pwd.value = '';
			f.u_pwd.focus();
			return;
		}

		if (u_pwd == '') {
			alert('비밀번호을 입력하세요');
			f.u_pwd.value = '';
			f.u_pwd.focus();
			return;
		}

		if (u_zipcode == '') {
			alert('우편번호를 입력하세요');
			f.u_zipcode.value = '';
			f.u_zipcode.focus();
			return;
		}

		if (u_addr == '') {
			alert('주소를 입력하세요');
			f.u_addr.value = '';
			f.u_addr.focus();
			return;
		}

		f.action = "modify.do";
		f.submit();
		alert('수정이 완료되었습니다.')
	}
	
		
		//탈퇴 
		function withdraw(f){
			
			//실행 전 세션 존재 확인
			if(${user} == null){
				alert('세션이 만료됐습니다.\n로그인 창으로 이동합니다.');
				location.href = "../user/login_form.do";
			} 
			
			Swal.fire({
			  title: '정말 탈퇴하시겠습니까?',
			  text: "탈퇴시 계정을 다시 복구시킬 수 없습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '탈퇴',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
		          location.href='../user/withdraw.do';
			  }
			})
		}
	
</script>
<style type="text/css">
	
	th {
		text-align: center;
	}
	td{
		float: left;
		margin-left: 5px;
		padding-left: 5px;
	}
	
	input {
		display: inline;
		float: left;
		margin-left: 5px;
	}
	#button{
		align-content: center;	
	}
	
	
</style>

</head>
<body>
<div>
		<%@include file="../mainpage/header&sidebar.jsp"%>
</div>
<div class="body1">
	<jsp:include page="mypage_main.jsp" />
	<form>
		<div id="box">
		<div class="panel">
				<div class="panel-heading" align="center"><h4>내 정보 수정</h4></div>
				<div class="panel-body">
			<table id="table"  class="table table-stiped">
			
				<input type="hidden" name="u_idx" value="${vo.u_idx }">

				<tr>
					<th>이름</th>
					<td><input name="u_name" value="${vo.u_name }"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input name="u_id" value="${vo.u_id}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="u_pwd" value="${vo.u_pwd }"></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input name="u_zipcode" id="u_zipcode"
						value="${vo.u_zipcode }"> <input type="button"
						value="주소찾기" onclick="find(this.form);"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input name="u_addr" id="u_addr" size="60"
						value="${vo.u_addr }"></td>
				</tr>
				<tr>
					<th>자기소개</th>
					<td><textarea name="u_profile" id="u_profile" rows="10" cols="50" style="margin-left: 5px;"></textarea> </td>
				</tr>
				<tr>
					<th>사진등록</th>
					<td>사진등록폼 추가예정</td>
				</tr>


			</table>
			</div>
			</div>
			<div align="center">
			<table id="bt_table">
				<tr>
					<td >
						<input class="btn btn-info" type="button" value="수정하기"onclick="send(this.form);"> 
						<input class="btn btn-danger" type="button" value="회원탈퇴" onclick="withdraw();">
					</td>
				</tr>
			</table>
			</div>
		<br>
		<hr>
		</div>
	</div>	
	</form>
</body>
</html>











