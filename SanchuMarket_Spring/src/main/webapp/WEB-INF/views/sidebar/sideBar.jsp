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
/*관리자 페이지 이동 버튼*/
	.buttons {
    margin: 10%;
    text-align: center;
    display: flex;
    position: absolute;
    z-index: 999;
    right: -50px;
    bottom: -100px;
    opacity:0.5;
   }
    .btn-hover {
    width: 130px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 20px;
    height: 45px;
    text-align:center;
    border: none;
    background-size: 300% 100%;

    border-radius: 30px;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:focus {
    outline: none;
}

.btn-hover.color-1 {
    background-image: linear-gradient(to right, #25aae1, #40e495, #30dd8a, #2bb673);
    box-shadow: 0 4px 15px 0 rgba(49, 196, 190, 0.75);
}


	
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
	
	<c:if test="${ user.u_grade eq '관리자' }">
	<div class="buttons">
	   <button class="btn-hover color-1" onclick="location.href='../admin/main_form.do'">Go Admin</button>
	</div>
	</c:if>
</div>



</body>
</html>