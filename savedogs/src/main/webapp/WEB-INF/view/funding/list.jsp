<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부</title>
<!-- <link rel='stylesheet' href='../css/savedogs_main.css' /> -->
</head>
<body>
<div style="margin-left: 30%; width:40%;">
	<div align="center">
		<table style="width: 80%;">
			<tr>
			    <td align="center">기부</td>
				<td style="width: 50%;" align="center">
				<a href="../item/list.dog">후원쇼핑몰</a>
			</tr>
		</table>
	</div>
<div class="w3-panel">
        <hr>
        <table class="w3-table" style="width:1000px">
        <c:forEach var="f" items="${fundinglist}">
        <tr><td rowspan="4"><img src="${fund_pic}" style="width:150%;" align="center" alt="후원 배너 사진"></td>
          <td colspan='2'><a href="detail.dog?fund_no=${f.fund_no}">"${f.funding_subject}"</a></td></tr>
            <tr><td>"${f.sheltername}"</td></tr>
            <tr><td>달력 아이콘 : 1일 남음</td></tr>
            <td>게이지바</td>
          </c:forEach>
        </table>
        <div align="right">
        <c:if test="${!empty sessionScope.loginsmem}"><h6><a href="fregForm.dog?id=${sessionScope.loginsmem.member_id}">후원모집작성(로그인세션)</a></h6>
        </c:if>
        </div>
        </div>
      </div>
</body>
</html>