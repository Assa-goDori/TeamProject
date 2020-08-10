<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해독 : 봉사 등록</title>
</head>
<body>
<form:form modelAttribute="vwork" action="vwrite.dog" enctype="multipart/form-data" name="f">
	<input type="hidden" name="id" value="${param.id }"> <%--로그인 user id --%>
	<table>
		<tr><td>날짜</td><td><input type="text" name="vwork_date" value="${param.date }" readonly="readonly"></td></tr>
		<tr><td>보호소</td><td><input type="text" value="${param.date }" readonly="readonly">
							 <input type="text" value="${param.date }" readonly="readonly"></td></tr>
		<tr><td>모집인원</td><td><form:input path="subject"/><font color="red"><form:errors path="subject"/></font></td></tr>
		<tr><td>설명</td><td><form:textarea path="content" rows="15" cols="80"/>
		<font color="red"><form:errors path="content"/></font></td></tr>
		<tr><td colspan="2"><input type="submit" value="등록"></td>
		</tr>
	</table>
</form:form>
</body>
</html>