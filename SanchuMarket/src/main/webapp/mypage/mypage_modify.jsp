<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
</script>


</head>
<body>
	<jsp:include page="mypage_main.jsp" />
	<form>
		<div id="box">
			<table id="table" >

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

			</table>
			<div id="button">
				<input class="btn btn-info" type="button" value="수정하기"onclick="send(this.form);"> 
				<input class="btn btn-danger" type="button" value="회원탈퇴" onclick="탈퇴">
			</div>
		</div>

		<br>
		<hr>

	</form>
</body>
</html>











