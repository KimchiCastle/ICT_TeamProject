<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style type="text/css">
	#box{
		width: 1200px;
		margin: auto;
		margin-top: 20px;
	}
	#title{
		text-align: center;
		color: cccccc;
	}
	th{
		text-align: center;
	}
	td{
		text-indent: 10px;
	}

</style>
</head>
<body>
	<div id="box">
		<h1 id="title">마이 페이지</h1>
		<table>
		<hr>
		
		<table>
			<tr>
				<td>
					<input class="btn"  type="button" value="내 판매목록" onclick="">
					<input class="btn"  type="button" value="내 정보" onclick="">
				</td>
			</tr>
		</table>
		
		<hr>
			<tr>
				<th>사진</th>
				<th>상품명</th>
				<th>가격</th>
				<th>판매상태</th>
				<th>올린날짜</th>
				<th>기능</th>
			</tr>
			<br>
			
			<!-- data없는 경우 -->
			<c:if test="${empty list}">
				<td colspan="6" align="center">
					<font color="red">등록된 상품이 없습니다</font>
				</td>
			</c:if>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			<br><hr><br>
			<table>
				<tr>
					<td>
						<input class="btn btn-info" type="button" value="회원정보수정" onclick="">
						<input class="btn btn-danger" type="button" value="회원탈퇴" onclick="">
						<input class="btn"  type="button" value="돌아가기" onclick="">
					</td>
				</tr>
			</table>
		</table>
	</div>
</body>
</html>