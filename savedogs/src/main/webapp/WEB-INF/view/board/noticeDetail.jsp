<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해독 : 공지사항</title>
<link rel='stylesheet' href='../css/savedogs_main.css' />
<style type="text/css">
table{
	margin: 0 auto;
	border-collapse: collapse;
}

tr{
	border: 1px solid black;
}
td{
	border: 1px solid black;
	width: 80%;
	text-align: center;
}
</style>
</head>
<body>
<div class="main_div">
<h2>공지사항 게시판</h2>
<hr>
	<table>
		<tr><th>제목</th><td>${board.subject }</td></tr>
		<tr><th>작성자</th><td>${board.member_id }</td></tr>
		<tr><th>작성일</th><td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd HH:mm"/></td></tr>
		<tr><th>내용</th><td>${board.content }</td></tr>
		<tr><th>첨부파일</th>
			<td>
				<c:if test="${!empty board.fileurl }">
					<a href="notice.${board.fileurl }">${board.fileurl }</a>
				</c:if>
				<c:if test="${empty board.fileurl }">&nbsp;</c:if>
			</td>
		</tr>
	</table>
<div class="btn_div">
	<input type="button" value="목록" class="s_btn" onclick="location.href='noticeList.dog?type=${board.type}'">
	<c:if test="${sessionScope.loginadmin != null }">
		<input type="button" value="수정" class="g_btn" onclick="location.href='noticeUpdate.dog?no=${board.board_no}'">
		<input type="button" value="삭제" class="g_btn" onclick="location.href='noticeDelete.dog?no=${board.board_no}'">
	</c:if>
</div>
</div>
</body>
</html>