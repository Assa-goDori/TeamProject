<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 봉사</title>

</head>
<body>
	<div class="maiv_div" style="width: 100%;">
		<h3>신청한 봉사내역</h3>
		<hr>
		<c:if test="${empty list }">
			<h5>신청한 봉사내역이 없습니다.</h5>
		</c:if>
		<c:if test="${!empty list }">
			<table>
				<tr>
					<th>봉사날짜</th>
					<th style="width:300px;">장소</th>
					<th>비고</th>
				</tr>
			<c:forEach items="${list }" var="m">
				<tr>
					<fmt:formatDate value="${m.vwork_date }" pattern="yyyy-MM-dd" var="date"/>
					<td>${date}</td>
					<td style="width:300px;">${m.shelter_address} ${m.shelter_name }</td>
					<td>
						<a href="../vwork/vdetail.dog?no=${m.vwork_no }">상세보기</a>
					</td>
				</tr>
			</c:forEach>
			</table>
		</c:if>
		<hr>
		<h3>나의봉사 현황</h3>
	</div>
</body>
</html>