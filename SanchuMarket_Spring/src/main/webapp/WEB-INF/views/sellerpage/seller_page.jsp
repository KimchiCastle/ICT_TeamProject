<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 상세정보</title>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/seller_page.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">


<script type="text/javascript">
	
	function onReport(){
		
		center_modify_popup();
		$(".shadow").show();
	}
	
	function center_modify_popup(){
		
		//윈도우 폭구하는 함수
		var w_width = $(window).width();
		//윈도우 높이 구하는 함수
		var w_height = $(window).height();
		
		var r_width  = $("#report_popup").width();
		var r_height = $("#report_popup").height();
		
		
		var left = w_width/2 - r_width/2;
		var top  = w_height/2 - r_height/2;
		
		/* 위치 css를 JSON으로 처리한다. */
		//css : Map방식 속성값 지정
		$("#report_popup").css({ 'left':left, 'top':top });
		
		$("#report_popup").show();
	}
	
	function hide_report_popup(){
		
		
		$("#report_popup").hide();
		$(".shadow").hide();
		
	}
	/* checkbox 하나만 선택되는 함수 */
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("report");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	
	
</script>


</head>
<body >


<%@ include file="report_popup.jsp" %>

<div>
	<%@ include file="../mainpage/header&sidebar.jsp"%>
</div>
<div class="i">
	<div>
		<div id="seller-box" >
			
			<div id="seller-pictrue">
				이미지
			</div> 
			<div  id="seller-page1">
				
				<div id="seller-page2">
					<div id="seller-info1">
						<div id="nickname"><b>${ user_info.u_nickname }</b></div>
						<div id="mark">인증마크</div>
					</div>
					<div id="seller-info2">
						<div id="u_regdate">마켓오픈 ${ user_info.u_regdate }일전</div>
						<div id="u_listcount">평가 회원 수 : ${ user_info.u_likecount }</div>
						<div id="u_like">회원 평점 : ${ user_info.u_like }</div>
					</div>
					<div id="seller-info3">
						
					</div>
					<div id="seller-info4">
							<div style="cursor: pointer; margin-top: 10px;"
								onclick="onReport();">
								<img
									src="${ pageContext.request.contextPath }/resources/image/report_icon.png"
									width="15px" height="15px"><span
									style="font-size: 15px; color: rgb(180, 180, 180)">신고하기</span>
								
							<div class="shadow">
							</div>
							
							</div>
						</div>
				</div>
				
			</div>
		
		</div>

		<div>

			<hr>
			<h3 style="margin: 0px; padding-left: 15px;">판매자가 올린 상품</h3>

		</div>
		<%@ include file="../mainpage/content.jsp"%>

	</div>

</div>






</body>
</html>