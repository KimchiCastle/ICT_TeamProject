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

<!-- 페이지 들어올때 이상품이 찜이 되어있는지 아닌지 확인 -->
<script type="text/javascript">
	
	$(function(){
		
		var p_idx = $("#p_idx").val();
		var u_idx = $("#u_idx").val();
		
		$.ajax({
			
			url		: 'jjimCheck.do',
			type	: 'post',
			data	: {'p_idx':p_idx, 'u_idx':u_idx},
			success	: function(res){
				
				if(res.result){
					
					console.log('찜 있음')
					$("#jjim_off").css('display','inline-block')
					
				}else{

					console.log('찜 없음')
					$("#jjim_on").css('display','inline-block')
				
				}
				
			}
			
		})
		
		
	});

</script>

<!-- 찜기능 on off 함수 -->
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
			type	 : 'POST',
			data     : {"p_idx":p_idx, "u_idx":u_idx},
			success	 : function(res){
				
				if(res.result){
					
					$("#jjim_on").css('display','none');
					$("#jjim_off").css('display','inline-block');
				
				}else{
					
					alert('찜 등록을 실패하였습니다. 관리자에게 문의하세요');
				
				}
				
			},error	 : function(err){
				alert('찜 등록을 실패하였습니다. 관리자에게 문의하세요');
			}
			
		});
		
		
		
	}
	
	function jjimOff(){
		
		var p_idx = $("#p_idx").val();
		var u_idx = $("#u_idx").val().trim();
		
		
		$.ajax({
			
			url	     : 'jjimoff.do',
			type	 : 'POST',
			data     : {"p_idx":p_idx, "u_idx":u_idx},
			success	 : function(res){
				
				if(res.result){
					
					$("#jjim_off").css('display','none');
					$("#jjim_on").css('display','inline-block');
				
				}else{
					
					alert('찜 해제을 실패하였습니다. 관리자에게 문의하세요');
				
				}
				
			},error	 : function(err){
				alert('찜 해제을 실패하였습니다. 관리자에게 문의하세요');
			}
			
		});
		
	}


</script>

<!-- 거래하기기능 -->
<script type="text/javascript">

	function trade(){
		
		var product_u_idx = $("#product_u_idx").val();
		var u_idx = $("#u_idx").val();
		
		if(u_idx==''){
			
			if(confirm("로그인후 이용가능 합니다.\n로그인 하시겠습니까?")==false) return;
			
			location.href="../user/login_form.do?url=" + encodeURIComponent(location.href);
			
			return;
		}
		
		
	}

</script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/product_detail.css">

</head>
<body>

<div id="root">
	<%@ include file="../mainpage/header&sidebar.jsp"%>
	<input type="hidden" id="p_idx" value="${ vo.p_idx }">
	<input type="hidden" id="product_u_idx" value="${ vo.u_idx }">
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
			<div id="u_nickname"><a href="../sellerpage/list.do?u_idx=${vo.u_idx}" style="text-decoration: none; color: black;">${ vo2.u_nickname }</a></div>
			<br>
			<div style="margin-left:30px; display: inline-block;">${ vo.p_location }</div>
			<br>
			<!-- 찜등록 -->
			<div style="margin-left:30px; margin-top:20px; display: inline-block;">
				
				<button type="button" id="jjim_on" class="btn" onclick="jjimOn();" style=" background-color: rgb(200,200,200); width: 75px; display: none;">
					<span style="color: white; font-size: 20px;">찜 ♥</span>
				</button>
				<button type="button" id="jjim_off" class="btn" onclick="jjimOff();" style=" background-color: rgb(156,247,117); width: 75px; display: none;">
					<span style="color: white; font-size: 20px;">찜 ♥</span>
				</button>
			</div>	
			<div style="display: inline-block;">
				<button type="button" class="btn" onclick="trade();" style=" background-color: rgb(240,240,240); width: 100px;">
					<span style="color: black; font-size: 20px;">거래하기</span>
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
			<input type="button" class="btn btn-warning" value="상품수정" style=""
			id="modifyButton" onclick="location.href='modify_form.do?p_idx=${ vo.p_idx }'">
		</div>	
	</c:if>	
		
	</div>
	
	
</div>



</body>
</html>