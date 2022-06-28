<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <meta http-equiv="Content-Type" 
  		content="text/html; charset=UTF-8">
    <title>마이페이지</title>

    
    <!-- Bootstrap 3.x -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	
	#main_box {
	width: 800px;
	margin: auto;
}
#box {
	width: 700px;
	margin: auto;
}

#table {
	text-align: center;
	width: 600px;
	margin: auto;
}

</style>
  </head>
  
  
  <body>
  
  <div id="main_box" align="center"  >
  <hr>
  <div align="center">
      <font size="4" color="maroon">
          <b>마이 페이지</b>
      </font>
  </div>
  <hr>
  <div  >
      <a href="mypage_list.jsp" >내 판매 물품</a> |
      <a href="mypage_modify.jsp">내 정보 수정</a>
  </div>
  <hr>

  	<!-- 로그인이 안된경우 -->
  	<c:if test="${empty sessionScopeuser }">
  		<input id="button" type="button" value="로그인" style="float: right;"
  				onclick="location.href='../member/login_form.do';">
  	</c:if>
  	
  	<!-- 로그인이 된 경우 -->
  	<c:if test="${not empty sessionScope.user }">
  		<b>${user.m_name}</b>님 환영합니다
  		<input type="button" value="로그아웃" 
  				onclick="location.href='../member/logout.do';">
  	</c:if>
  </div>
 
  </body>
</html>