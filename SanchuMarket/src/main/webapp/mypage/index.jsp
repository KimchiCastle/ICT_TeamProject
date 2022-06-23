<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Bootstrap 3.x -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <meta http-equiv="Content-Type" 
  		content="text/html; charset=UTF-8">
    <title></title>
    <style>
		a:link{text-decoration:none; color:black}
        a:visited{text-decoration:none; color:black}
        a:hover{text-decoration:none; color:orange;}
    </style>
  </head>
  
  <div id="box" align="center" width="1200px" >
  <body>
  <hr width="600" border="1" noshade color="black">
  <center>
      <font size="4" color="maroon">
          <b>마이 페이지</b>
      </font>
  </center>
  <hr width="600" border="1" noshade color="navy">
  
      <a href="mypage_list.jsp" >내 판매 물품</a> |
      <a href="mypage_modify.jsp">내 정보 수정</a> 

  
  <hr width="600" border="1" noshade color="navy">
  <div style="width:600px; text-align:right; margin:auto;">
  	<!-- 로그인이 안된경우 -->
  	<c:if test="${empty sessionScopeuser }">
  		<input type="button" value="로그인"
  				onclick="location.href='../member/login_form.do';">
  	</c:if>
  	
  	<!-- 로그인이 된 경우 -->
  	<c:if test="${not empty sessionScope.user }">
  		<b>${user.m_name}</b>님 환영합니다
  		<input type="button" value="로그아웃" 
  				onclick="location.href='../member/logout.do';">
  	</c:if>
  </div>
  <hr width="600" border="1" noshade color="navy">
  
  <!-- 회원인 경우 노출되는 메뉴 -->
  <c:if test="${not empty sessionScope.user }">
  	<div style="width:600px;  margin:auto;">
  		<input type="button" value="상품등록"
  				onclick="location.href='/product/insert.do';">
  	</div>
  <hr width="600" border="1" noshade color="navy">
  </c:if>
  
  </div>
  </body>
</html>