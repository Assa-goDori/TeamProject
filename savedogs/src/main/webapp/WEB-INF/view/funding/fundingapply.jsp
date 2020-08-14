<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 신청 양식</title>

<script>
	function fundingapplyclose() {
		f = document.f;
		f.submit();
	}
</script>
</head>
<body>
<div>
	<h2>기부신청양식</h2>
	<form:form modelAttribute="fundinglist" method="post" action="fundingapply.dog">
		<input type="hidden" name="fund_no" value="${param.fund_no}">
      <table style="border-collapse: collapse;">
        <tr height="40px">
        <td>기부 모집명</td>
        <td>${f.funding_subject}</td>
		</table>
		<input class="g_btn" type="button" value="신청하기" onclick="fundingapplyclose()">
	</form:form>
	</div>
</body>
</html>