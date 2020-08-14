<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 신청 양식</title>
<link rel='stylesheet' href='../css/style.css' />
<link rel='stylesheet' href='../css/savedogs1.css' />
<script>
	function fundingapplyclose() {
		f = document.f;
		f.submit();
	}
</script>
</head>
<body>
	<h2>기부 하기</h2>
	<form:form modelAttribute="fundinglist" method="post" action="fundingapply.dog">
	
		<%-- globalErrors error.reject(코드값) --%>
		<input type="hidden" name="fund_no" value="${param.fund_no}">
		<!--  <spring:hasBindErrors name="funding">
			<font color="red"> <c:forEach items="${errors.globalErrors}"
					var="error">
					<spring:message code="${error.code }" />
				</c:forEach>
			</font>
		</spring:hasBindErrors>
		-->
		
		<table style="border-collapse: collapse;">
			<tr height="40px">
				<td>보호소 명</td>
				<!-- db에서 불러올것 입력값아님~ -->
				<td><form:input path="sheltername" /> <font color="red"><form:errors
							path="sheltername" /></font></td>
			</tr>

			<tr height="40px">
				<td>후원 제목</td>
				<td><form:input path="funding_subject" /> <font color="red"><form:errors
							path="funding_subject" /></font></td>
			</tr>

			<tr height="40px">
				<td>목표 금액</td>
				<td><form:input path="count" /> <font color="red"><form:errors
							path="count" /></font></td>
			</tr>

			<tr height="40px">
				<td>시작 날짜</td>
				<td><input type="date" name="start_date" /> <font color="red"><form:errors
							path="start_date" /></font></td>
			</tr>

			<tr height="40px">
				<td>마감날짜</td>
				<td><input type="date" name="end_date" /> <font color="red"><form:errors path="end_date" /></font></td>
			</tr>

			<tr height="40px">
				<td>배너사진</td>
				<td><input type="file" name="picure" /></td>
			</tr>

			<tr height="40px" >
				<td colspan="2" align="center"><input type="submit" value="등록"  class="s_btn"  >
				</td>
			</tr>
		</table>
	</form:form>
	</div>
</body>
</html>