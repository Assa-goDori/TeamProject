<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/webapp/WEB-INF/view/cart/checkout.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>주문 전 상품 목록 보기</title></head>
<body>
<div style="width: 80%; margin-left: 10%;" >
	<div align="center">
		<h2>상품구매</h2>
	</div>
	<hr>
	<br>
	<div align="center">
	<h3>구매 정보</h3>
	<table>
		<tr><th>상품명</th><th>상품코드</th><th>가격</th><th>수량</th></tr>
		<c:forEach items="${sessionScope.CART.itemSetList}" var="itemSet" varStatus="stat">
			<tr>
				<td>${itemSet.item.item_name}</td><td>${itemSet.item.item_code}</td><td>${itemSet.item.item_price*itemSet.item_each}</td>
				<td>${itemSet.item_each}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<hr>
	</div>
	
	<div align="center">
		<table>
			<tr>
				<td width="30%">주문아이디</td>
				<td width="70%">${sessionScope.loginmem.member_id }</td>
			</tr>
			<tr>
				<td width="30%">이름</td>
				<td width="70%">${sessionScope.loginmem.member_name }</td>
			</tr>
			<tr>
				<td width="30%">우편번호</td>	
				<td width="70%">${sessionScope.loginmem.member_postcode }</td>
			</tr>
			<tr>
				<td width="30%">주소</td>
				<td width="70%">${sessionScope.loginmem.member_address} ${sessionScope.loginmem.member_daddress}</td>
			</tr>		
			<tr>
				<td width="30%">전화번호</td>
				<td width="70%">${sessionScope.loginmem.member_tel}</td>
			</tr>
		</table>
	</div>
	총 구입 금액 : ${sessionScope.CART.total}원
</div>	
</body></html>