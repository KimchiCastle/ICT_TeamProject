<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style type="text/css">
   
   body{
     width: 100%;
     height: 100%;
     background-color: #e3e3e3;
     margin: auto;
   }
   
   #page{
     height: 300px;
     width: 1000px;
     margin: auto;
     positon: relative;
   }
   
   #custom_page{
     font-size: 30px;
     position: absolute;
     top : 220px;
     left: 300px;
     display:table;
     width:200px;
     height: 80px;
     opacity: 0.7;
     color: #118a7e;
     cursor:pointer;
     text-align: center;
     vertical-align: center;
     margin: auto;	
     border-radius: 3px;
     border:2px solid #118a7e;
   }
   
   #custom_page:hover{
     background-color: #9accc7;
     opacity: 0.6;	
   }
   
   #admin_page{
     position: absolute;
     top : 220px;
     right: 300px;
     display:table;
     font-size: 30px;
     width:200px;
     height: 80px;
     opacity: 0.7;
     color:  #118a7e;
	 cursor:pointer;
     text-align: center;
     margin: auto;
     border-radius: 3px;
     border:2px solid #118a7e;
   }
   
    #admin_page:hover{
     background-color: #9accc7;
     opacity: 0.6;
   }
   
   span{
    display:table-cell;
	vertical-align:middle;
   }
   

</style>
</head>

<body>


<div id="page">

  <div id="custom_page" onclick="location.href='../mainpage/list.do'">
    <span>마켓 홈</span>
  </div>
  <div id="admin_page" onclick="location.href='main_form.do'">
    <span>관리자 홈</span>
  </div>

</div>
</body>
</html>