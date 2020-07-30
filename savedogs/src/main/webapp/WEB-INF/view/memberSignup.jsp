<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<h2>회원 가입</h2>
	<hr>
	<form:form modelAttribute="member" method="post" action="memberSignup.dog">
		<spring:hasBindErrors name="user">
			<font color="red">
				<%--globalErrors : error.reject(코드값) --%>
				<c:forEach items="${errors.globalErrors }" var="error">	<%--rejectvalue가 아닌 reject --%>
					<spring:message code="${error.code }" />	<%-- error.input.user --%>
				</c:forEach>
			</font>
		</spring:hasBindErrors>
		<table border="1" style="border-collapse:collapse;">
			<tr height="40px">
				<td>아이디</td>
				<td>
					<form:input path="member_id"/>
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
				<td>비밀번호 확인</td>
				<td>
					<form:password path="member_pass2" />
					<font color="red">
						<form:errors path="member_pass2" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>이름</td>
				<td>
					<form:input path="member_name" />
					<font color="red">
						<form:errors path="member_name" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>생년월일</td>
				<td>
					<form:input path="member_birthday" />
					<font color="red">
						<form:errors path="member_birthday" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>우편번호</td>
				<td>
					<form:input path="member_postcode" />
					<font color="red">
						<form:errors path="member_postcode" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>주소</td>
				<td>
					<form:input path="member_address" />
					<font color="red">
						<form:errors path="member_address" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>상세주소</td>
				<td>
					<form:input path="member_daddress" />
					<font color="red">
						<form:errors path="member_daddress" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>전화번호</td>
				<td>
					<form:input path="member_tel" />
					<font color="red">
						<form:errors path="member_tel" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>이메일</td>
				<td>
					<form:input path="member_email" />
					<font color="red">
						<form:errors path="member_email" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>