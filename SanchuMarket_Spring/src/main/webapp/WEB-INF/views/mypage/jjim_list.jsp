<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
	#box{
		
		width: 800px;
		margin: auto;
		padding-top: 150px; 
		min-height: 1300px;
	}
	
	th,td{
		text-align: center;
		
	}
	td{
		vertical-align: middle;
	}
	
</style>
<script type="text/javascript">
	
	function deljjim(p_idx){
		
		var u_idx = ${ param.u_idx }.val();
		
		$.ajax({
			uri		: '${pagecContext}/jjimoff.do',
			type 	:  'POST',
			data	: {'p_idx':p_idx, 'u_idx':u_idx },
			success	: function(res){
				
				if(res.result){
					window.location.reload();
				}
				
			},
			error	: function(err){
				alert('실패했습니다. 새로고침 후 시도 해주세요.')				
			}
		})
		
			
	}

</script>



</head>
<body>

	<%@ include file="../mainpage/header&sidebar.jsp" %>
<div id="box">
	
	<table class="table table-hover">
	
		<tr>
			<th width="8%">번호</th>
			<th width="12%">상품사진</th>
			<th>상품명</th>
			<th>가격</th>
			<td></td>
		</tr>
		
		<c:forEach var="product" items="${ product_list }">
			<c:set var="i" value="${i+1}"/>
			<tr onclick="location.href='${pageContext.request.contextPath}/product/product_detail.do?p_idx=${ product.p_idx }&p_name=${ product.p_name }'">
				<td >${ i }</td>
				<td><img src="${ pageContext.request.contextPath }/resources/imgdata/${ product.image_list[0].imagedata }" width="50px" height="50px"></td>
				<td align="left">${ product.p_name }</td>
				<td><fmt:formatNumber pattern="#,###" value="${ product.p_price }"/>&nbsp;원</td>
				<td> 
					<button type="button" class="btn btn-Warnning" onclick="deljjim(${ product.p_idx });">삭제</button>
				 </td>
			</tr>
		</c:forEach>
		
		
	
	</table>
	
</div>


</body>
</html>