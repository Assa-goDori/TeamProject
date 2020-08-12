<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부</title>
</head>
<body>
<div style="width: 80%; margin-left: 10%;" >
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
        <c:if test="${f.fund_no == '1'}">
        <tr><td rowspan="4"><img src="" style="width:150%;" align="center" alt="후원 배너 사진"></td>
          <td colspan='2'><a href="detail.dog?id=${f.fund_no}">"${f.funding_subject}"</a></td></tr>
            <tr><td>"${f.sheltername}"</td></tr>
            <tr><td>달력 아이콘 : 1일 남음</td></tr>
            <td>게이지바</td>
          </c:if>
          </form>
          </c:forEach>
        </table>
        <h2>후원모집작성<h2></h2>
        </div>
      </div>
</body>
</html>