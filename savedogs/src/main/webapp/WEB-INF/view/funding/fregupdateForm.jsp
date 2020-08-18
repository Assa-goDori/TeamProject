<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 모집 수정</title>
<link rel='stylesheet' href='../css/savedogs_main.css' />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head><body>
<div style="margin-left: 30%; width:40%;">
<h2>후원 모집 수정</h2>
<form:form modelAttribute="funding" method="post" action="fregupdateForm.dog" enctype="multipart/form-data">
<%-- globalErrors error.reject(코드값) --%>
<input type="hidden" name="member_id" value="${sessionScope.loginmem.member_id }">
<spring:hasBindErrors name="funding">
<font color="red">
<c:forEach items="${errors.globalErrors}" var="error">
<spring:message code="${error.code }" />
</c:forEach>
</font>
</spring:hasBindErrors>
<!-- db에서 불러오기 -->
<table style="border-collapse:collapse;">
<tr height="40px"><td>보호소 명</td> <!-- db에서 불러올것 입력값아님~ -->
<td><input type="text" name="sheltername" readonly="readonly" value="${funding.sheltername}" /><!-- ${sessionScope.loginUser.sheltername},readonly--> 
<font color="red"><form:errors path="sheltername" /></font></td></tr>

<tr height="40px"><td>후원 제목</td>
<td><td><input type="text" name="funding_subject" readonly="readonly" value="${funding.funding_subject}" />
<font color="red">
<form:errors path="funding_subject" /></font></td></tr>

<tr height="40px"><td>목표 금액</td>
<td><form:input path="count" />
<font color="red"><form:errors path="count" /></font></td></tr>

<tr height="40px"><td>시작 날짜</td>
<td><input type="date" name="start_date" />
<font color="red"><form:errors path="start_date" /></font></td></tr>

<tr height="40px"><td>마감날짜</td>
<td><input type="date" name="end_date" />
<font color="red"><form:errors path="end_date" /></font></td></tr>

<tr height="40px"><td>배너사진</td>
<td><input type="file" name="fund_pic" />
<font color="red"><form:errors path="fund_pic" /></font></td></tr>

<tr height="40px">
<td colspan="2" align="center">
<input type="submit" class="s_btn" value="수정하기">
</td></tr>
</table>
</form:form>
</div>
</body>
</html>