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

    <!--font-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style type="text/css">
	
body{
font-family: 'Gowun Dodum', sans-serif;
}	
	
#main_box {
width: 1050px;
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
  
  </div>
 
  </body>
</html>