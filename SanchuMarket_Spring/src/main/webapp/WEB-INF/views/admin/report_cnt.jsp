<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
       <table>
           
	 	   <tr>
	 	     <td>신고 사유 :</td>
	 	     <c:choose>
	 	     <c:when test="${ r_list.r_reason eq 're_add_cnt'}">
	 	     <td>광고</td>
	 	     </c:when>
	 	     <c:when test="${ r_list.r_reason eq 're_fake_cnt'}">
	 	     <td>가품/상품 부정확</td>
	 	     </c:when>
	 	     <c:when test="${ r_list.r_reason eq 're_inhibit_cnt'}">
	 	     <td>거래금지품목(담배/주류/음란물 등..)</td>
	 	     </c:when>
	 	     <c:when test="${ r_list.r_reason eq 're_scam_cnt'}">
	 	     <td>사기</td>
	 	     </c:when>
	 	     <c:otherwise><td>??</td></c:otherwise>
	 	     </c:choose>
	 	   </tr>
	 	   
	 	   <tr>
	 	     <td>신고 날짜 :</td>
	 	     <td>${ r_list.r_date }</td>
	 	   </tr>
	 	   
	 	   <tr>
	 	     <td>신고자 :</td>
	 	     <td>${ r_list.userVo_reporting.u_name }</td>
	 	   </tr>
	 	   
	 	   <tr>
	 	     <td>총 신고 : </td>
	 	     <td>${ r_cnt }</td>
	 	   </tr>
	 	   
	 	   <tr>
	 	     <td>활동 상태 :</td>
	 	     <td>${ r_list.userVo_reported.u_status }</td>
	 	   </tr>
	 	</table>

</body>
</html>