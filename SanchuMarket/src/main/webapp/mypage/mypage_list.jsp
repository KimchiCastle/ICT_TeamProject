<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<style type="text/css">
	#box {
		width: 800px;
		margin: auto;
		margin-top: 20px;
	
	}
	#collapse{
		text-align: center;
		width: 600px;
		margin: auto;
	}
	th{
		margin:auto;
		text-align: center;
		width: 150px;
	}
	td{
		text-indent: 10px;
	}
	img{
		display: block;
		margin: auto;
	}
	

</style>
</head>
<body>
	<jsp:include page="index.jsp"/>
	<div  id="box" align="center" >
	<table class="table table-hover" align="center"  border="1" style="border-collapse:collapse;font-size:11pt; width:800px;"
 bordercolor="gray" cellpadding="4" cellspacing="0">

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
			<tr>
				<td colspan="6" align="center">
					<font color="red">등록된 상품이 없습니다</font>
				</td>
			</tr>	
			</c:if>
			<!-- data 있는 경우-->
			<c:forEach var="vo" items="${list }">
				<tr>
					<td><img src="../images/${vo.img}" width="100" height="90"></td>
					<td>${vo.p_name }</td>
					<td>${vo.price }</td>
					<td>${vo.p_status }</td>
					<td>${vo.p_date }</td>
					<td align="center">
						<input type="button" value="상세정보보기" onclick=""><br>
						<input type="button" value="삭제하기" onclick="">
					</td>
				</tr>
			</c:forEach>
			<br>
			<hr>

		</table>
	</div>
</body>
</html>











