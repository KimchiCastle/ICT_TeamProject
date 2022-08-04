<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/report_popup.css">


</head>
<body>
	<div id="report_popup" align="center">
		
		<div style="text-align: right;">
			<input type="button" value="x" id="x_button"
				onclick="hide_report_popup();">
		</div>
		<span id="popup_title">신고사유</span>
		<div align="center" style="margin-bottom:10px; ">
			<div class="report_box">
				<input type="checkbox" value="re_add_cnt" name="report" onclick="doOpenCheck(this);">
				<span class="report_reason">1.광고</span>
			</div>
			<div class="report_box">
				<input type="checkbox" value="re_fake_cnt" name="report" onclick="doOpenCheck(this);">
				<span class="report_reason">2.가품 / 상품 부정확</span>
			</div>
			<div class="report_box">
				<input type="checkbox" value="re_inhibit_cnt" name="report" onclick="doOpenCheck(this);">
				<span class="report_reason">3.거래금지품목(담배/주류/음란물 등..)</span>
			</div>
				<div class="report_box">
					<input type="checkbox" value="re_scam_cnt" name="report" onclick="doOpenCheck(this);">
					<span class="report_reason">4.사기</span>
				</div>
		</div>
		
		<div align="center">
			<input class="btn" type="button" value="신고하기" onclick="send_report();">
			<input class="btn" type="button" value="취소" onclick="hide_report_popup();">
		</div>
	</div>
</body>
</html>