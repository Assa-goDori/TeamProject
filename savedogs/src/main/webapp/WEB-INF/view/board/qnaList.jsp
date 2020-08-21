<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해독 : Q&amp;A 게시판</title>
<link rel='stylesheet' href='../css/savedogs_main.css' />
<style type="text/css">
.g_btn{
	width: 120px;
}
.sel{
	width: 120px;
	padding: 10px;
}
</style>
<script type="text/javascript">
	function listpage(page){
		document.searchform.pageNum.value=page;
		document.searchform.submit();
	}
</script>
</head>
<body>
<div class="main_div">
<h2>Q&amp;A 게시판</h2>
<hr>
<table>
	<tr><td colspan="5">
		<div style="display: inline;">
			<form action="noticeList.shop" method="post" name="searchform">
				<input type="hidden" name="pageNum" value="1">
				<select name="searchtype" class="sel">
					<option value="">선택하세요</option>
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select>
				<script type="text/javascript">
					searchform.searchtype.value="${param.searchtype}";
				</script>
				<input type="text" name="searchcontent" value="${param.searchcontent }" style="width: 250px;">
				<input type="submit" value="검색" class="s_btn">
				<input type="button" value="전체 게시물 보기" class="g_btn" onclick="location.href='list.shop'">
			</form>	
		</div></td>
	</tr>
	<c:if test="${listcount > 0 }">  
		<tr><td colspan="4">공지사항</td><td>글 개수 : ${listcount }</td></tr>
		<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
		<c:forEach var="board" items="${boardlist }">
			<tr><td>${boardno}</td><c:set var="boardno" value="${boardno-1 }"/>
				<td style="text-align: left; ">
					<c:if test="${!empty board.fileurl }"> 
						<a href="file/${board.fileurl }">@</a>
					</c:if>
					<c:if test="${empty board.fileurl }">&nbsp;&nbsp;&nbsp;</c:if>
					<%--답변글 --%>
					<c:forEach begin="1" end="${board.grplevel }">&nbsp;&nbsp;</c:forEach>
					<c:if test="${board.grplevel > 0 }">└</c:if>
					<a href="noticeDetail.shop?num=${board.num }">${board.subject }</a>
				</td>
				<td>${board.name }</td>
				<%-- 작성일 --%>
				<td>
				<fmt:formatDate var="rdate" value="${board.regdate }" pattern="yyyyMMdd"/>
				<c:if test="${rdate == today }">
					<fmt:formatDate value="${board.regdate }" pattern="HH:mm:ss"/>
				</c:if>
				<c:if test="${rdate != today}">
					<fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd HH:mm"/>
				</c:if>
				</td>
				<td>${board.readcnt }</td>
			</tr>
		</c:forEach>
		<%-- 페이징 --%>
		<tr><td colspan="5"> 
			<c:if test="${pageNum > 1 }"><a href="javascript:listpage('${pageNum-1 }')">[이전]</a></c:if>
			<c:if test="${pageNum <= 1 }">[이전]</c:if>
			<c:forEach var="a" begin="${startpage }" end="${endpage}">
				<c:if test="${a == pageNum }">[${a }]</c:if>
				<c:if test="${a != pageNum }"><a href="javascript:listpage('${a }')">[${a }]</a></c:if>
			</c:forEach>
			<c:if test="${pageNum < maxpage }">
				<a href="javascript:listpage('${pageNum+1 }')">[다음]</a>
			</c:if>
			<c:if test="${pageNum >= maxpage }">[다음]</c:if>
			</td>
		</tr>
	</c:if>
	<c:if test="${listcount == 0 }"> <%-- 등록된 게시물 없음 --%>
		<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
	</c:if>
	<c:if test="${sessionScope.loginadmin != null }">
		<tr><td colspan="5" class="btn_td"><input type="button" value="작성" class="s_btn" onclick="location.href='noticeWrite.dog'"></td></tr>
	</c:if>
</table>
</div>
</body>
</html>