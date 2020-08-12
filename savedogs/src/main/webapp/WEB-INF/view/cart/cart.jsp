<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/webapp/WEB-INF/view/cart/cart.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>장바구니</title></head>
<body><h2>장바구니</h2>
<table>
	<tr><td colspan="4">장바구니 상품 목록</td></tr>
	<tr><th>상품명</th><th>수량</th><th>합계</th></tr>
	<c:set var="tot" value="${0}"/>
	<c:forEach items="${cart.itemSetList}" var="itemSet" varStatus="stat">
		<tr><td>${itemSet.item.item_name}</td>
			<td>${itemSet.item_each}</td>
			<td>${itemSet.item_each * itemSet.item.item_price}
		<c:set var="tot" value="${tot +(itemSet.item_each * itemSet.item.item_price)}"/>
		<a href="cartDelete.shop?index=${stat.index}">ⓧ</a></td></tr>
	</c:forEach>
	<tr><td colspan="4" align="right">
	총 구입 금액 : ${tot}원 </td></tr>
</table><br> ${message} <br><a href="../item/list.dog">상품목록</a>
<a href="checkout.dog">주문하기</a></body></html>