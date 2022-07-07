<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--bootStrap-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!--jquery-->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!--google font CDN-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!--chartJS CDN-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script defer src="chart.js"></script>

<style>
body{
font-family: 'Gowun Dodum', sans-serif;
font-size: 18px;

}

#header{
}

#content{
  background-color: #f2f2f2;
  height: 100%;
}


label{
  line-height: 40px;
  text-align: center;
}

p{
  font-size: 30px;
  font-weight: bold;
  text-align: center;
}

.board-wrapper{
  background-color: white;
  height: 400px;
  margin: 20px;
 
} 

#board{
  width: 390px;
  height: 350px;
  display: inline-block;
  float: left;
  margin: 20px;
}

#chat{
  width: 450px;
  height: 350px;
  display: inline-block;
  float: left;
  margin: 20px;
}


#number-wrapper{
  background-color: white;
  width: 300px;
  display: inline-block;
  margin: 20px;
   float: left;
}

#number-table{
  text-align: center;
}


th{
  font-size: 40px;
}


#doughnut-wrpper{
  float: left;
  background-color: white;
  width: 350px;
  display: inline-block;
  margin: 20px;
  margin-left: 80px;
  
}

 #line-wrapper{
  width: 700px;
  background-color: white;
  display: inline-block;
  margin: 20px;
}

#line-chart{
  vertical-align: center;
}


</style>
</head>
<body>

<div id="header">
  <%@include file="header.jsp"%>
</div>

<div id="content">

	<div class="board-wrapper" id="board">
	   <label>실시간 상품 업로드 현황</label>
	   <c:forEach var="product" items="${ map.p_list }">
	    ${ product.u_name } 
	    ${ product.p_name } 
	    ${ product.p_date } 
	   </c:forEach>
	</div>
	
	<div class="board-wrapper" id="chat" >
	   <label>실시간 채팅문의 현황</label>
	   <c:forEach var="chat" items="${ map.ch_list }">
	    ${ chat.u_name } 
	    ${ chat.ch_message } 
	    ${ chat.ch_date } 
	   </c:forEach>
	</div>
	
	<div id="number-wrapper">
	  <table class="table" id="number-table">
	   <tr>
	     <td>${ map.today_p_count }</td>
	     <td>금일 거래량</td>
	   </tr>
	   
	   <tr>
	     <th>132건</th>
	     <th>23건</th>
	   </tr>
	   
	 </table> 	
	</div>
	
	<div id="number-wrapper">
	  <table class="table" id="number-table">
	   <tr>
	     <td>금일 방문수</td>
	     <td>금일 가입수</td>
	   </tr>
	   
	   <tr>
	     <th>132명</th>
	     <th>23명</th>
	   </tr>
	   
	 </table> 	
	</div>
	

	<div id="doughnut-wrpper">
		<canvas id="doughnut-chart"></canvas>
	</div>
	
	<div id="line-wrapper">
		<canvas id="line-chart"></canvas>
	</div>
  
  </div><!--end content-->
<div class="b-example-divider"></div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>