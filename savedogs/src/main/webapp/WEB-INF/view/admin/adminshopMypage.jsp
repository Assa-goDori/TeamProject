<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 쇼핑몰 물품 관리</title>
<style>
	.data {
		text-align:center;
	}
</style>
</head>
<body>
	<div class="main_div" style="width: 100%;">
		<h3>후원 물품 판매 관리</h3>
		<table>
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>단가</th>
				<th>판매량</th>
				<th>소계</th>
				<th>상태</th>
				<th>비고</th>
			</tr>
			<c:forEach items="${shopalllist }" var="list">
				<tr>
					
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>