<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 쇼핑몰 물품 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	function changestate(no, state) {
		var state = state;
		$.ajax({
			url : "../ajax/changestate.dog",
			type : "POST",
			data : "item_no="+ no + "&item_state="+state,
			success : function(data) {
				alert("설정 변경 완료")
				document.location.reload();
			},
			error : function(e) {
				alert("ajax 오류");
			}
		})
	}
</script>
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
				<th>선택시 변경</th>
			</tr>
			<c:forEach items="${shopalllist }" var="list">
				<tr>
					<td class="">${list.item_code }</td>
					<td class="data">${list.item_name }</td>
					<fmt:formatNumber value="${list.item_price }" pattern="##,###원" var="price" />
					<td class="data">${price }</td>
					<td class="data">${list.sellCnt }개</td>
					<fmt:formatNumber value="${list.item_price * list.sellCnt }" pattern="##,###원" var="total" />
					<td class="data">${total }</td>
					<td class="data">${list.item_state==0?"판매중":"매진" }</td>
					<td class="data">
						<c:if test="${list.item_state==0 }">
							<a href="javascript:changestate(${list.item_no }, 1)">매진</a>
						</c:if>
						<c:if test="${list.item_state==1 }">
							<a href="javascript:changestate(${list.item_no }, 0)">판매중</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>