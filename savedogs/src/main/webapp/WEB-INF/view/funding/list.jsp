<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부</title>
<script type="text/javascript">
 function listpage(page) { 
	document.searchform.pageNum.value=page; 
	document.searchform.submit();
	}
</script>
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
	 <hr>

<table><tr><td colspan="5">
<div style="display: inline;">
   <form action = "list.dog" method="post" name = "searchform">
    <input type="hidden" name="pageNum" value="1"> <%--pageNum, searchtype, searchform : 파라미터 --%>
    <select name="searchtype" style="width:130px;">
     <option value ="">선택하세요</option>
     <option value ="fund_subject">제목</option>
     <option value ="member_id">작성자</option>
     <option value ="sheltername">보호소명</option>
     </select>
     <script type="text/javascript">
     document.searchform.searchtype.value="${param.searchtype}";
     </script>
     <input type="text" name="searchcontent" value="${param.searchcontent}" style="width:250px;">
     <input type="submit" value="검색" class="s_btn">
     <input type="button" value="전체게시물보기" class="g_btn"
       onclick="location.href='list.dog'">
   </form></div></td></tr></table><br>
   
   <c:if test="${listcount > 0}">
   <c:forEach var="f" items="${fundinglist}" varStatus="stat">
   <c:if test="${stat.first}"><div></c:if>
        <table>
        <tr><td rowspan="4"><img src="img/${f.fund_pic}" onclick="location.href='detail.dog?fund_no=${f.fund_no}' style="width:250px;" align="center" alt="후원 배너 사진"></td>
          <td><a href="detail.dog?fund_no=${f.fund_no}">"${f.fund_subject}"</a></td></tr>
            <tr><td>"${f.sheltername}"</td></tr>
            <tr><td><i class="fa fa-calendar fa-fw w3-margin-right w3-large w3-text-teal"></i>${f.restdate}일 남음</td></tr>
            <td>게이지바</td>
        </table>
        <c:if test="${stat.count==3 }"><br></c:if>	
		<c:if test="${stat.last}"></div></c:if>
		</c:forEach>
       <br>
        <table>
            <tr><td colspan="5">
           <c:if test="${pageNum > 1}">
           <a href="javascript:listpage('${pageNum-1}')">[이전]</a></c:if>
           <c:if test="${pageNum <= 1}">[이전]</c:if>
      <c:forEach var="a" begin="${startpage}" end="${endpage}">
             <c:if test="${a == pageNum}">[${a}]</c:if>
             <c:if test="${a != pageNum}">
             <a href="javascript:listpage('${a}')">[${a}]</a></c:if>
             </c:forEach>
             <c:if test="${pageNum < maxpage}"> <%--현재 페이지가 maxp 보다 작다->다음 페이지가 있음 --%>
             <a href="javascript:listpage('${pageNum + 1}')">[다음]</a></c:if>
             <c:if test = "${pageNum >= maxpage}">[다음]</c:if>
             </td></tr></table>
             </c:if>
             <c:if test="${listcount==0}">
             <table>
               <tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
               </table>
               </c:if>
                <div align="right">
        <c:if test="${!empty sessionScope.loginsmem}"><h6><a href="fregForm.dog?id=${sessionScope.loginsmem.member_id}">후원모집작성(로그인세션)</a></h6>
        </c:if>
        </div>
       </div>
</body>
</html>