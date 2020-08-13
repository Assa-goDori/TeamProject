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

<div style="margin-left: 30%; width:40%;">
 <table class="w3-table" style="width:1000px">
       <!--  <form action="후원하기.dog=?fund_no=${f.fund_no}" method="POST"> -->
        <tr><td rowspan="4"><img src="${picture}" style="width:150%;" alt="후원 배너 사진"></td>
          <td colspan='2'>"${funding_subject}"</td></tr>
            <tr><td>"${sheltername}"</td></tr>
            <tr><td>달력 아이콘 : 1일 남음</td></tr>
            <td>게이지바</td>
            <tr><td>&nbsp;</tr><td>
             <c:if test="${!empty sessionScope.loginmem}"><h6><a href="fundingapply.dog?id=${sessionScope.loginmem.member_id}"></a></h6>
             <tr><td align="center"><h5><input type="button" value="후원하기"></h5></td></tr>
             </c:if>
             <c:if test="${!empty sessionScope.loginsmem}"><h6><a href="fregForm.dog?id=${sessionScope.loginsmem.member_id}"></a></h6>
             <tr><td align="right"><h5><input type="submit" value="수정하기" onclick="location.href=update.dog'"></h5></td>
             <td><h5><input type="submit" value="삭제하기" onclick="location.href=delete.dog'"></h5></td></tr>
             </c:if>
        </table>
    
<div class="w3-panel">
        <hr>
        <!-- 스마일 + 응원댓글 작성하기 -->
        <!-- 댓글 작성칸 -->
        <!-- 댓글 리스트 -->
        </div>
      </div>
</body>
</html>