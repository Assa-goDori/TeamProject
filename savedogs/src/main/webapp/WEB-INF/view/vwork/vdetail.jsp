<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해독 : 봉사 상세</title>
<link rel='stylesheet' href='../css/savedogs_main.css' />
<style type="text/css">
th{
	padding: 15px;
	width: 20%;
}
.btn_div{
	margin-top: 10%;
	text-align: center;
}
</style>
</head>
<body>
<div class="main_div">
<h2>봉사 정보</h2>
<hr>
<table>
	<tr><th>날짜</th><td>${vwork.date }</td></tr>
	<tr><th>보호소</th><td>${vwork.address }${vwork.name }</td></tr>
	<tr><th>위치</th><td>지도</td></tr>
	<tr><th>모집인원</th><td>${vwork.Nmem }/${vwork.Vmem } &nbsp;명</td></tr>
	<tr><th>설명</th><td>${vwork.vwork_content }</td></tr>
</table>
<br>
<div class="btn_div">
<c:if test="${smem != null }">
	<input type="button" class="g_btn" value="목록" onclick="history.back(-1);">
	<input type="button" class="g_btn" value="수정" onclick="location.href='vupdate.dog?vwork_no=${vwork.vwork_no}'">
	<input type="button" class="g_btn" value="삭제" onclick="location.href='vdelete.dog?vwork_no=${vwork.vwork_no}'">
</c:if>
<c:if test="${mem != null }">
	<input type="button" value="목록" class="g_btn" onclick="history.back(-1);">
	<c:if test="${vwork.Nmem != vwork.Vmem }">
		<input type="button" value="신청" class="s_btn" onclick="location.href='vjoin.dog?vwork_no=${vwork.vwork_no}'">
	</c:if>
	<c:if test="${vwork.Nmem == vwork.Vmem }">
		<input type="button" value="모집완료" class="g_btn">
	</c:if>
	
</c:if>

</div>
</div>

</body>
</html>