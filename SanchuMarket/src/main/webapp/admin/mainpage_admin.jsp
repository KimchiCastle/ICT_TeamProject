<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script defer src="chart.js"></script>
<style>
body{
font-family: 'Gowun Dodum', sans-serif;
font-size: 18px;
}

#header{
 
}

#search_form{
  width: 100%;
  height: 350px;
  position: relative;
}

#stats-form{
  width: 100%;
  height: 350px;
  display: flex;
  position: absolute;
  transform: translate(-50%, -50%);
  top:100%;
  left:50%;
}


#stats-form > div{ 
  box-sizing:border-box; 
  margin: 5px;
  border: 1px solid gray;
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

 #line-wrapper{
  width: 500px;
  clear: both;
}

#line-chart{
  vertical-align: center;
}

#number-wrapper{
 
}

#board-wrapper{
  width: 300px;
} 
</style>
</head>
<body>

<div id="header">
  <%@include file="header.jsp"%>
</div>

<div id="search_form">
	 <!-- <div class="col-lg-6 col-md-12">
                        <div class="card card-body mailbox">
                            <h5 class="card-title">Notification</h5>
                            <div class="message-center" style="height: 420px !important;">
                                Message
                                <a href="#">
                                    <div class="btn btn-danger btn-circle"><i class="fa fa-link"></i></div>
                                    <div class="mail-contnet">
                                        <h6 class="text-dark font-medium mb-0">Luanch Admin</h6> <span class="mail-desc">Just see the my new admin!</span>
                                        <span class="time">9:30 AM</span>
                                    </div>
                                </a>
                                Message
                                <a href="#">
                                    <div class="btn btn-success btn-circle"><i class="fa fa-calendar-check-o"></i></div>
                                    <div class="mail-contnet">
                                        <h6 class="text-dark font-medium mb-0">Event today</h6> <span class="mail-desc">Just a reminder that you have
                                            event</span> <span class="time">9:10 AM</span>
                                    </div>
                                </a>
                                Message
                                <a href="#">
                                    <div class="btn btn-info btn-circle"><i class="fa fa-cog text-white"></i></div>
                                    <div class="mail-contnet">
                                        <h6 class="text-dark font-medium mb-0">Settings</h6> <span class="mail-desc">You can customize this template as you
                                            want</span> <span class="time">9:08 AM</span>
                                    </div>
                                </a>
                                Message
                                <a href="#">
                                    <div class="btn btn-primary btn-circle"><i class="fa fa-user"></i></div>
                                    <div class="mail-contnet">
                                        <h6 class="text-dark font-medium mb-0">Pavan kumar</h6> <span class="mail-desc">Just see the my admin!</span> <span
                                            class="time">9:02 AM</span>
                                    </div>
                                </a>
                                Message
                                <a href="#">
                                    <div class="btn btn-info btn-circle"><i class="fa fa-cog text-white"></i></div>
                                    <div class="mail-contnet">
                                        <h6 class="text-dark font-medium mb-0">Customize Themes</h6> <span class="mail-desc">You can customize this template as you
                                            want</span> <span class="time">9:08 AM</span>
                                    </div>
                                </a>
                                Message
                                <a href="#">
                                    <div class="btn btn-primary btn-circle"><i class="fa fa-user"></i></div>
                                    <div class="mail-contnet">
                                        <h6 class="text-dark font-medium mb-0">Pavan kumar</h6> <span class="mail-desc">Just see the my admin!</span> <span
                                            class="time">9:02 AM</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div> -->
</div>

<div id="stats-form"><!--stats:통계-->

	<div >
		<canvas id="doughnut-chart"></canvas>
	</div>
	
	<div id="line-wrapper">
		<canvas id="line-chart"></canvas>
	</div>
	
	<div>
		<label>금일 거래량<br>(거래완료기준)</label>
		<p>132건</p>		
		<hr>
		<label>금일 방문수</label>
		<p>23명</p>		
	</div>
	
	<div id="board-wrapper">
	   <label>실시간 게시물 업로드 현황</label>
	</div>
  </div><!--end stats form-->
<div class="b-example-divider"></div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>