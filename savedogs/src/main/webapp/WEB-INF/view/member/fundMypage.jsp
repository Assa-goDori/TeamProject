<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 후원</title>

</head>
<body>
	<h3>신청한 펀딩내역</h3>
	<hr>
	<c:if test="${empty fundlist }">
		<h3>신청한 펀딩이 없습니다.</h3>
	</c:if>
	<c:if test="${!empty fundlist }">
		<table>
			<tr>
				<th style="width:250px;">펀딩 날짜</th>
				<th style="width:300px;">후원명</th>
				<th>후원금액</th>
			</tr>
			<c:forEach items="${fundlist }" var="list">
				<tr>
					<td style="width:250px;">
						<fmt:formatDate value="${list.fund_date }" pattern="yyyy년 MM월 dd일" var="date1"/>
						${date1 }
					</td>
					<td style="width:300px;">${list.funding_subject }</td>
					<td>${list.fund_cost }</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<br>
	<hr>
	<br>
	<h3>나의 펀딩 현황</h3>
	<c:if test="${empty endfundlist }">
		<h3>완료한 펀딩이 없습니다.</h3>
	</c:if>
	<c:if test="${!empty endfundlist }">
		<table>
			<tr>
				<th style="width:250px;">펀딩 날짜</th>
				<th style="width:300px;">후원명</th>
				<th>후원금액</th>
			</tr>
			<c:forEach items="${endfundlist }" var="endlist">
				<tr>
					<td style="width:250px;">
						<fmt:formatDate value="${endlist.fund_date }" pattern="yyyy년 MM월 dd일" var="date2"/>
						${date2 }
					</td>
					<td style="width:300px;">${endlist.funding_subject }</td>
					<td>${endlist.fund_cost }</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>