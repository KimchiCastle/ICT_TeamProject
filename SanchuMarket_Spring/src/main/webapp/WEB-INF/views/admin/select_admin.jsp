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
     position: absolute;
     top : 220px;
     left: 300px;
     display: inline-block;
     width:200px;
     height: 90px;
     background-color: #118a7e;
     color: white;
     cursor:pointer;
     text-align: center;
     vertical-align: center;
     margin: auto;	
     border-radius: 3px;
   }
   
   #custom_page:hover{
     background-color: #9accc7;
   }
   
   #admin_page{
     position: absolute;
     top : 220px;
     right: 300px;
     display: inline-blo
     display: inline-block;
     width:200px;
     height: 90px;
     background-color: #118a7e;
     color: white;
	 cursor:pointer;
     text-align: center;
     margin: auto;
     border-radius: 3px;
   }
   
    #admin_page:hover{
     background-color: #9accc7;
   }


</style>
</head>

<body>


<div id="page">

  <div id="custom_page" onclick="location.href='../mainpage/list.do'">
     <h4>마켓 홈</h4>
  </div>
  <div id="admin_page" onclick="location.href='main_form.do'">
     <h4>관리자 홈</h4>
  </div>

</div>
</body>
</html>