<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
<script type="text/javascript">
	function win_open(page){
		  var op = "width=500, height=350, left=50,top=150";
		   open(page+".dog","",op);
	}
</script>
<link rel='stylesheet' href='../css/savedogs_main.css' />
</head>
<body>
	<div class="main_div" >
	<h2>사용자 로그인</h2>
	<hr>
	<form:form modelAttribute="member" method="post" action="login.dog">
		<input type="hidden" name="member_name" value="의미없는 이름">
		<input type="hidden" name="member_email" value="not@not">
		<input type="hidden" name="member_tel" value="의미없는 전화번호">
		<spring:hasBindErrors name="member">
			<font color="red">
				<c:forEach items="${errors.globalErrors}" var="error">
					<spring:message code="${error.code}" />
				</c:forEach></font>
		</spring:hasBindErrors>
		<br>
		<table >
			<tr height="40px">
				<th>아이디</th>
				<td>
					<form:input path="member_id" />
				
						<font color="red">
							&nbsp;<form:errors path="member_id" />
						</font>
				</td>
			</tr>
			<tr height="40px">
				<th>비밀번호</th>
				<td>
					<form:password path="member_pass" />
				
						<font color="red">
							&nbsp;<form:errors path="member_pass" />
						</font>
				</td>
			</tr>
			<tr height="40px">
				<td class="btn_td" colspan="3" >
					<input class="s_btn" type="submit" value="로그인">
					<input class="g_btn" type="button" value="회원가입" onclick="location.href='selectSignup.dog'">
				</td>
			</tr>
			<tr height="40px">
				<td class="btn_td" colspan="3" >
					<input class="g_btn" type="button" value="아이디 찾기" onclick="win_open('idfind')">
					<input class="g_btn" type="button" value="비밀번호 찾기" onclick="win_open('pwfind')">
				</td>
			</tr>
		</table>
	</form:form>
	</div>
</body>
</html>
