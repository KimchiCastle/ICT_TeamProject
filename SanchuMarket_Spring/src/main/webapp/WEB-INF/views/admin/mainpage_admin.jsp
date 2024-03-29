<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--bootStrap-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<!--jquery-->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script> -->
<!--google font CDN-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!--CSS-->
<link rel="stylesheet" href="../resources/css/admin_form.css">
<link rel="stylesheet" href="../resources/css/admin_header_form.css">

<script type="text/javascript">

$(function(){
new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: {
      labels: ["남성의류", "여성의류", "도서/문구", "음반/악기","가전","뷰티/미용"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#c45850","#f8f398","#afc5ff"],
          data: [
        	  ${ serviceMap.category_list[0].category_cnt },
        	  ${ serviceMap.category_list[1].category_cnt },
        	  ${ serviceMap.category_list[2].category_cnt },
        	  ${ serviceMap.category_list[3].category_cnt },
        	  ${ serviceMap.category_list[4].category_cnt },
        	  ${ serviceMap.category_list[5].category_cnt },
        	  ]
        } 
      ]
    },
    options: {
      title: {
        display: true,
        text: '카테고리 순위'
      }
    }
});

new Chart(document.getElementById("line-chart"), {
  type: 'line',
  data: {
    labels: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
    datasets: [{ 
        
        data: [
        	${ serviceMap.annual_enrollList[0].u_tot },
        	${ serviceMap.annual_enrollList[1].u_tot },
        	${ serviceMap.annual_enrollList[2].u_tot },
        	${ serviceMap.annual_enrollList[3].u_tot },
        	${ serviceMap.annual_enrollList[4].u_tot },
        	${ serviceMap.annual_enrollList[5].u_tot },
        	${ serviceMap.annual_enrollList[6].u_tot },
        	${ serviceMap.annual_enrollList[7].u_tot },
        	${ serviceMap.annual_enrollList[8].u_tot },
        	${ serviceMap.annual_enrollList[9].u_tot },
        	${ serviceMap.annual_enrollList[10].u_tot },
        	${ serviceMap.annual_enrollList[11].u_tot }],
        label: "가입회원",
        borderColor: "#e8c3b9",
        fill: false
     },{
        data: [
        	${ serviceMap.annual_withdrawlList[0].w_tot },
        	${ serviceMap.annual_withdrawlList[1].w_tot },
        	${ serviceMap.annual_withdrawlList[2].w_tot },
        	${ serviceMap.annual_withdrawlList[3].w_tot },
        	${ serviceMap.annual_withdrawlList[4].w_tot },
        	${ serviceMap.annual_withdrawlList[5].w_tot },
        	${ serviceMap.annual_withdrawlList[6].w_tot },
        	${ serviceMap.annual_withdrawlList[7].w_tot },
        	${ serviceMap.annual_withdrawlList[8].w_tot },
        	${ serviceMap.annual_withdrawlList[9].w_tot },
        	${ serviceMap.annual_withdrawlList[10].w_tot },
,			${ serviceMap.annual_withdrawlList[11].w_tot }],
        label: "탈퇴회원",
        borderColor: "#c45850",
        fill: false
      }
    ]
   },
  options: {
    title: {
      display: true,
      text: '가입 탈퇴 회원'
    }
  }
});







});//end document ready



	
	function reportView(u_idx_reported,r_idx){
		
		$.ajax({
			
			url		 : 'check_reportCnt.do',
			data	 : {'u_idx_reported':u_idx_reported,'r_idx':r_idx},
			success	 : function(res){
				
				$("#report_inf").html(res)
				
			}
			
		})
		
		
	}
</script>


	



</head>
<body>
<div class="allbody">
<div id="header1">
  <%@include file="header.jsp"%>
</div>
<div id="content">
	
	<div id="board">
	   <label>실시간 상품 업로드 현황</label>
	  <c:forEach var="product" items="${ serviceMap.p_list }">
	   <div style=" cursor: pointer; margin-bottom: 10px; margin-left:3px;" onclick="location.href='${pageContext.request.contextPath}/product/product_detail.do?p_idx=${ product.p_idx }&p_name=${ product.p_name }'">
		   	<img src="${ pageContext.request.contextPath }/resources/imgdata/${ product.image_list[0].imagedata }" width="35px" height="40px">
		   <div class="product_p_name">${ product.p_name } </div> 	 
		    ${ fn:substring(product.p_date,0,10) }
	   </div>
	   </c:forEach> 
	</div>
	
 <div class="report-wrapper"  >
   <div id="report">
   <label style="text-align:center;">실시간 신고 현황</label>
     <table>  
    <c:forEach var="report" items="${ serviceMap.r_list }">
        <tr onclick="javascript:reportView(${report.userVo_reported.u_idx},${report.r_idx});">
	           		
	           	<c:if test="${ report.userVo_reported.u_photo eq 'no_file' }">
	           		<td><img src="../resources/image/avatar.png" width="30" height="30"></td>        
	           	</c:if>	
	         	<c:if test="${ report.userVo_reported.u_photo ne 'no_file' }">
			   		<td><img src="../resources/imgdata/${ report.userVo_reported.u_photo }" width="30" height="30"></td>        
	         	</c:if>     
		   <td>${ report.userVo_reported.u_name }</td>        
		   <td>${ report.userVo_reported.u_id }</td>        
        </tr>
        </c:forEach>
	
	 </table>    
 	</div>
	</div>
	
   <div id="report_inf">
      
   </div>
	
	<div id="number-wrapper">
	  <table class="table" id="number-table">
	   <tr>
	     <td>금일상품업로드</td>
	     <td>금일 거래량</td>
	   </tr>
	   
	   <tr>
	    <th>${ serviceMap.today_p_count }건</th>
	     <th>${ serviceMap.today_t_count }건</th>
	   </tr>
	   
	    <tr>
	     <td>금일 방문수</td>
	     <td>금일 가입수</td>
	   </tr>
	   
	   <tr>
	    <th>${ serviceMap.today_v_count }명</th>
	     <th>${ serviceMap.today_u_count }명</th>
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
</div>

<div class="b-example-divider"></div>
<!--chartJS CDN-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

</body>
</html>