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
		padding-right: 20px;
	}
	#collapse{
		text-align: center;
		width: 600px;
		margin: auto;
	}
	th{
		margin:auto;
		text-align: center;
	}
	td{
		text-indent: 10px;
	}

</style>
</head>
<body>
	<jsp:include page="index.jsp"/>
	<div id="box" align="center" width="600px" >
		<table id="collapse"  border="1" style="border-collapse:collapse; font-size:8pt"
				 bordercolor="navy" cellpadding="4" cellspacing="0" >
		
		<hr>
			<tr >
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
			<!-- data 있는 경우-->
			<c:forEach var="vo" items="${list }">
				<tr>
					<th><img src="../images/${vo.img}" width="100" height="90"></th>
					<th>${vo.p_name }</th>
					<th>${vo.price }</th>
					<th>${vo.p_status }</th>
					<th>${vo.p_date }</th>
					<th>
						<input type="button" value="상세정보보기" onclick=""><br>
						<input type="button" value="삭제하기" onclick="">
					</th>
				</tr>
			</c:forEach>
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











