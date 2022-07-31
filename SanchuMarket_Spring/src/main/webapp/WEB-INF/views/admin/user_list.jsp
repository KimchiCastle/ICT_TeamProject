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

<script>


$(function(){

	var d = new Date();
	var strDate = d.getFullYear() + "." + (d.getMonth()+1) + "." + d.getDate() + " 회원 목록";
	$("#title").html(strDate);
	
	
})

</script>

</head>
<body>
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
	        <th style="width:5%">번호</th>
	        <th style="width:8%">이름</th>
	        <th style="width:10%">아이디</th>
	        <th style="width:12%">전화번호</th>
	        <th style="width:20%">주소</th>
	        <th style="width:8%">상태</th>
	      </tr>
	    
	  <c:forEach var="list" items="${ userList }">
	      <tr onmouseover="this.style.background='#acc6aa40'" onmouseout="this.style.background='white'" style="cursor:pointer;"onclick="location.href=''">
	        <td>${list.no}</td>
	        <td>${list.u_name}</td>
	        <td>${list.u_id}</td>
	        <td>${list.u_tel}</td>
	        <td>${list.u_addr}</td>
	        <td>${list.u_status}</td>
	      </tr>  
	  </c:forEach>
    </table>
    
    <form class="navbar-form navbar-left" action="">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
    
     
    
    <div class="flex-shrink-0 dropdown" style="width:300px;">
     <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-toggle="dropdown" aria-expanded="false">
      <img src="../resources/image/상추.png" alt="mdo" width="32" height="32" class="rounded-circle">
      </a>
   	 <ul class="dropdown-menu">
       <li><a class="dropdown-item" >닉네임</a></li>
       <li><a class="dropdown-item" >아이디</a></li>
       <li><a class="dropdown-item" >활동상태</a></li>
       <li><a class="dropdown-item">전화번호</a></li>
    </ul>
   </div>
   
      <div id="page-form">
         ${ pageMenu }   
     </div>
  </div>
</div>

</body>
</html>