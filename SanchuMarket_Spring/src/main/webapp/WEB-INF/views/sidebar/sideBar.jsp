<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근본상품</title>

<link rel="stylesheet"
		href="${ pageContext.request.contextPath }/resources/css/sideBar.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<style type="text/css">


	
</style>

<script type="text/javascript">


	$(function(){
		/*  global_page=1; */
		slider(0);
		  
	});

</script>


<!-- 쿠키불러오기 -->
<script type="text/javascript">


	var global_page = 1;

	function slider(page_flag) {

		var curr_page = global_page + page_flag;
		//유효성 체크

		if (curr_page < 1) {
			return;
		}

		$("#now").text(curr_page);

		global_page = curr_page;
		$.ajax({
			url : "${pageContext.request.contextPath}/list_cookie.do",
			data : {'curr_page' : curr_page},
			success : function(res_data) {

				$("#disp").html(res_data);

			}

		});

	}
</script>

<!-- 쿠키삭제 -->
<script type="text/javascript">
	
	

</script>

</head>
<body>

<div id="floater">
	<div>
		<div id="recentBanner">
			<div  id="text_p">
				<span>최근 본 상품</span>
			</div>
				<div class="recentView" id="recentView">
					<div id="disp"></div>
					<%-- <div>
						<button onclick="slider(-1)">&lt;</button>
						<span id="now">1</span>/<span id="total">${ last_page }</span>
						<button onclick="slider(1)">&gt;</button>
					</div> --%>
				</div>
		</div>

	</div>
		<div id="top_move">
		<button id="top_button" onclick="window.scrollTo(0,0);">TOP</button>
	</div>
</div>



</body>
</html>