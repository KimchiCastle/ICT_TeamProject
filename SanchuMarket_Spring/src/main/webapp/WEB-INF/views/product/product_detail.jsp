<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	function jjimOn(){
		
		
		var p_idx = $("#p_idx").val();
		var u_idx = $("#u_idx").val().trim();
		
		if(u_idx==''){
			
			if(confirm("로그인후 이용가능 합니다.\n로그인 하시겠습니까?")==false) return;
			
			location.href="../user/login_form.do?url=" + encodeURIComponent(location.href);
			
			return;
		}
		
 		$.ajax({
			
			url	     : 'jjimon.do',
			data     : {"p_idx":p_idx, "u_idx":u_idx},
			success	 : function(res){
				
			},error	 : function(err){
				alert('찜 등록을 실패하였습니다. 관리자에게 문의하세요');
			}
			
		});
		
		
		
	}
	
	function jjimOff(){
		
		
	}


</script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/product_detail.css">

</head>
<body>

<div id="root">
	<%@ include file="../mainpage/header&sidebar.jsp"%>
	<input type="hidden" id="p_idx" value="${ vo.p_idx }">
	<input type="hidden" id="u_idx" value="${ user.u_idx }">
	<div id="box" align="left">
		<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					
					<c:forEach items="${ vo.image_list }" varStatus="i" begin="1" end="${ fn:length(vo.image_list) }">
					
						<li data-target="#myCarousel" data-slide-to="i"></li>
					</c:forEach>
					
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" >
					<div class="item active">
						<img class="Pro_image" src="${pageContext.request.contextPath}/resources/imgdata/${ vo.image_list[0].imagedata }" style="width: 100%; height: 500px;">
					</div>
					
					<c:forEach var="list" items="${ vo.image_list }" varStatus="i" begin="1" end="${ fn:length(vo.image_list) }">
							<div class="item">
								<img class="Pro_image" src="${pageContext.request.contextPath}/resources/imgdata/${ list.imagedata }" style="width: 100%; height: 500px;">
							</div>
					</c:forEach>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" 
					href="#myCarousel" data-slide="prev" style=" opacity: .2;"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control"
					href="#myCarousel" data-slide="next" style=" opacity: .2;"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div><!-- 캐러셀 끝 -->

		<div id="user_info">
			<div id="user_img">
				<img src="${ pageContext.request.contextPath }/resources/image/image_upload.png" width="100px" height="100px" style="margin-top:5px; border-radius: 50px;">
			</div>
			<div id="u_nickname">${ vo2.u_nickname }</div>
			<br>
			<div style="margin-left:30px; display: inline-block;">${ vo.p_location }</div>
			<br>
			<div style="margin-left:30px; margin-top:20px; display: inline-block;">
				<button type="button" class="btn" onclick="jjimOn();" style="background-color: rgb(200,200,200); width: 75px;">
					<span style="color: white; font-size: 20px;">찜 ♥</span>
				</button>
				<button type="button" class="btn" onclick="jjimOff();" style="background-color: rgb(156,247,117); width: 75px;">
					<span style="color: white; font-size: 20px;">찜 ♥</span>
				</button>
			</div>	
			
				
		</div><!-- 회원정보 끝 -->
		
		<div style=" margin:auto; clear: both; width: 800px;">
		
		<div style="width: 800px;"><span id="p_name">${ vo.p_name }</span></div>
		<div><span>${ vo.p_time }</span></div>
		<div><span id="p_price"><fmt:formatNumber pattern="#,###" value="${vo.p_price}"></fmt:formatNumber></span>&nbsp;원</div>
		<div style="margin-top: 50px;">${ vo.p_exp }</div>
		
		</div> <!-- 상품정보 끝 -->
	<c:if test="${ user.u_idx eq vo.u_idx }">
	<div align="right">
		<input type="button" class="btn btn-warning" value="상품수정" style=" font-size:25px; width: 200px; height: 50px;">
	</div>	
	</c:if>	
		
	</div>
	
	
</div>



</body>
</html>