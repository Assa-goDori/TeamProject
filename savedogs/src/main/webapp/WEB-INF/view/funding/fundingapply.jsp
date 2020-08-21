<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 신청 양식</title>
<link rel='stylesheet' href='../css/style.css' />
<link rel='stylesheet' href='../css/savedogs_exc.css' />
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
		<!-- form:hidden path="member_id" value="${sessionScope.loginsmem.member_id }" /> -->
		<input type="hidden" name="fund_no" value="${param.fund_no}">
      <table>
        <tr height="40px">
        <td>기부모집명</td>
        <td><input type="text" name="fund_subject" readonly="readonly" value="${funding.fund_subject}" />
        </td>
        <tr><td>기부자</td>
        <td><input type="text" name="fund_id" readonly="readonly" value="${sessionScope.loginmem.member_id}" />
        </td></tr>
        <tr><td>기부금액</td>
        <td><input type="text" name="fund_cost"></td></tr>
        <tr><td style="color:red;">주의사항</td>
        <tr><td>1.기부 신청 후 회원탈퇴는 하실 수 없습니다.</td>
        <tr><td>2.기부 취소는 불가합니다.이 점 유의하시길 바랍니다.</td>
		</table>
		<input class="g_btn" type="submit" value="신청하기" onclick="fundingapplyclose()">
	</form:form>
	</div>
</body>
</html>