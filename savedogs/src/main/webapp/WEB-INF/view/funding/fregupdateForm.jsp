<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 모집 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head><body><h2>후원 모집 수정</h2>
<form:form modelAttribute="funding" method="post" action="fregupdateForm.dog">
<%-- globalErrors error.reject(코드값) --%>
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
<td><form:input path="sheltername" /><!-- ${sessionScope.loginUser.sheltername},readonly--> 
<font color="red"><form:errors path="sheltername" /></font></td></tr>

<tr height="40px"><td>후원 제목</td>
<td><form:input path="funding_subject" />
<font color="red"><form:errors path="funding_subject" /></font></td></tr>

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
<td><input type="file" name="picture" />
<font color="red"><form:errors path="picture" /></font></td></tr>

<tr height="40px">
<td colspan="2" align="center">
<input type="submit" value="수정하기">
</td></tr>
</table>
</form:form>
</body>
</html>