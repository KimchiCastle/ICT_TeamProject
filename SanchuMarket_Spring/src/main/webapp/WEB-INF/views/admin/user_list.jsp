<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/table_form.js"></script>
<!--bootStrap-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!--jquery-->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--google font CDN-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!--CSS-->
<link rel="stylesheet" href="../resources/css/admin_user_list.css">
<link rel="stylesheet" href="../resources/css/admin_header_form.css">
<!--select picker-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript 한국어 번역 파일 -->
<!-- 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/i18n/defaults-ko_KR.min.js"></script>

 -->
 <script>


$(function(){

	var d = new Date();
	var strDate = d.getFullYear() + "." + (d.getMonth()+1) + "." + d.getDate() + " 회원 목록";
	$("#title").html(strDate);
	
})


 $(function(){
	 
	 //검색 엔터 처리
	 $('#body').on('keyup',function(e){
			if(e.keyCode==13){
				find();
			}
		});
	 
	  //검색했던 데이터 잔존
	  if("${ not empty param.search }"=="true"){
	      $("#search").val("${ param.search }");
	  }
	  
	  //전체보기면 검색어 지우기
	  if("${ empty param.search  or param.search eq 'all'}"=="true"){
		  $("#search_text").val("");
	  }
	  
  });


function find(){
	
	var search = $("#search").val();
	var search_text = $("#search_text").val().trim();
	
	//전체보기가 아닌데 검색어가 비어있는 경우 
	if(search_text=='' && search!='all'){
		alert('검색어를 입력하세요');
		 $("#search_text").val('');
		 $("#search_text").focus();
	}
	
	  //검색요청
	  location.href="user_listForm.do?search=" + search + "&search_text=" + encodeURIComponent(search_text);
	  
}//end find()


</script>

 
<!-- 계정 정지시키기, 정지 풀기(탈퇴한 회원도) 자바스크립트 -->
<script type="text/javascript">
	
	function bannedMember(u_idx, u_id){
		
		if( !confirm(u_id+' 회원을 정지시키겠습니까?') ) return;
		
		var u_status = "정지";
		
		$.ajax({
			
			url		 : '../user/user_updateStatus.do',
			type	 : 'POST',
			data	 : {'u_idx':u_idx, 'u_status':u_status},
			success : function(res){
				
				if(res.result){
					
					alert('회원정지 완료!')
					window.location.reload();
				}
				
			},
			error	 : function(err){
				alert('모종의 이유로 실패했습니다.');
			}
			
			
		})
		
		
		
	}
	
	function clearMember(u_idx, u_id){
	
		if( !confirm(u_id+' 회원을 복구시키겠습니까?') ) return;
		
		
		var u_status = "활동";
		
		$.ajax({
			
			url		 : '../user/user_updateStatus.do',
			type	 : 'POST',
			data	 : {'u_idx':u_idx, 'u_status':u_status},
			success : function(res){
				
					if(res.result){
					
					alert('복구 완료!')
					window.location.reload();
				}
				
			},
			error	 : function(err){
				alert('모종의 이유로 실패했습니다.');
			}
			
			
		})
		
		
	}

</script>


</head>
<body id="body">
<div id="header">
  <%@include file="header.jsp"%>
</div>

<div id="content">
  <div id="title-form">
  <span id="title"></span>
  </div>
  <br>
  <!-- Responsive table starts here -->
  <!-- For correct display on small screens you must add 'data-title' to each 'td' in your table -->
  <div class="table-responsive-vertical shadow-z-1" id="content">
  <!-- Table starts here -->
  <table id="table" class="table table-hover table-mc-light-blue">
  
	      <tr>
	        <th style="width:5%;">번호</th>
	        <th style="width:8%;">이름</th>
	        <th style="width:10%;">아이디</th>
	        <th style="width:12%;">전화번호</th>
	        <th style="width:20%;">주소</th>
	        <th style="width:8%;">상태</th>
	        <th style="width:8%;"></th>
	      </tr>
	    
	  <c:forEach var="list" items="${ userList }">
	  	
	      <tr onmouseover="this.style.background='#acc6aa40'" onmouseout="this.style.background='white'" style="cursor:pointer;">
	        <td style="vertical-align: middle;" onclick="location.href='../sellerpage/list.do?u_idx=${list.u_idx}'">${list.no}</td>
	        <td style="vertical-align: middle;" onclick="location.href='../sellerpage/list.do?u_idx=${list.u_idx}'">${list.u_name}</td>
	        <td style="vertical-align: middle;" onclick="location.href='../sellerpage/list.do?u_idx=${list.u_idx}'">${list.u_id}</td>
	        <td style="vertical-align: middle;" onclick="location.href='../sellerpage/list.do?u_idx=${list.u_idx}'">${list.u_tel}</td>
	        <td style="vertical-align: middle;" onclick="location.href='../sellerpage/list.do?u_idx=${list.u_idx}'">${list.u_addr}</td>
	        <td style="vertical-align: middle;" onclick="location.href='../sellerpage/list.do?u_idx=${list.u_idx}'">${list.u_status}</td>
	        <td>
	        	<c:if test="${list.u_status eq '활동'}">
		        	<button type="button" class="btn btn-danger" onclick="bannedMember(${ list.u_idx },'${list.u_id}');">정지</button> 
	        	</c:if>
	        	<c:if test="${list.u_status == '정지' || list.u_status == '탈퇴' }">
		        	<button type="button" class="btn btn-info" onclick="clearMember(${ list.u_idx },'${list.u_id}');">활동</button> 
	        	</c:if>
	        </td> 
	      </tr>  
	  </c:forEach>
    </table>
    
	    <div style="text-align: center;  margin-bottom: 20px;">
          <select id="search" value="${ empty param.search ? 'all' : param.search }">
              <option value="all">전체</option>
              <option value="u_id">아이디</option>
              <option value="u_name">이름</option>
              <option value="u_nickname">닉네임</option>
              <option value="u_tel">전화번호</option> 
              <option value="u_status">상태</option> 
          </select>
          <input id="search_text"  value="${ param.search_text }">
          <input type="button" id="find_btn" value="검색" onclick="find();">
     </div>
      <div id="page-form">
         ${ pageMenu }   
     </div>
  </div>
</div>

</body>
</html>