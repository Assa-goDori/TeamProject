<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부상세</title>
</head>
<body>
<div style="width: 80%; margin-left: 10%;" >
 <table class="w3-table" style="width:1000px">
        <c:forEach var="f" items="${fundinglist}">
       <!--  <form action="후원하기.dog=?fund_no=${f.fund_no}" method="POST"> -->
        <c:if test="${f.fund_no == '1'}">
        <tr><td rowspan="4"><img src="" style="width:150%;" align="center" alt="후원 배너 사진"></td>
          <td colspan='2'>"${f.funding_subject}"</td></tr>
            <tr><td>"${f.sheltername}"</td></tr>
            <tr><td>달력 아이콘 : 1일 남음</td></tr>
            <td>게이지바</td>
          </c:if>
          </c:forEach>
        </table>
<div class="w3-panel">
        <hr>
        </div>
      </div>
</body>
</html>