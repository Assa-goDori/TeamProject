<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
</head>
<body>
	<h2>사용자 로그인</h2>
	<form:form modelAttribute="member" method="post" action="login.dog">
		<input type="hidden" name="username" value="의미없는 이름">
		<spring:hasBindErrors name="member">
			<font color="red">
				<c:forEach items="${errors.globalErrors}" var="error">
					<spring:message code="${error.code}" />
				</c:forEach></font>
		</spring:hasBindErrors>
		<table border="1" style="border-collapse: collapse;">
			<tr height="40px">
				<td>아이디</td>
				<td>
					<form:input path="member_id" />
						<font color="red">
							<form:errors path="member_id" />
						</font>
				</td>
			</tr>
			<tr height="40px">
				<td>비밀번호</td>
				<td>
					<form:password path="member_pass" />
						<font color="red">
							<form:errors path="member_pass" />
						</font>
				</td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="location.href='memberSignup.dog'">
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>
