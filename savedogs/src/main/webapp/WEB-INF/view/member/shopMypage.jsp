<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 쇼핑</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#minfo").show();
		$("#oinfo").hide();
		$(".saleLine").each(function(){
			$(this).hide();
		})
		$("#tab1").addClass("selection");
	})
	function disp_div(id,tab){
		$(".info").each(function(){
			$(this).hide();
		})
		$(".tab").each(function(){
			$(this).removeClass("selection");
		})
		$("#"+id).show();
		$("#"+ tab).addClass("selection");
	}
	function list_disp(id){
		$("#"+id).toggle();
	}
</script>
<style type="text/css">
	.selection{
		padding: 3px;
	}
	.selection > a {
		color: #000000;
		text-decoration : none;
		font-weight : bold;	
	}
</style>
</head>
<body>
	<div class="maiv_div" style="width: 100%;">
	<table style="width: 100%;">
		<tr>
			<td id="tab1" class ="tab" style="width: 50%;" align="center">
				<a href="javascript:disp_div('minfo','tab1')" style="color: gray; width: 50%;">장바구니</a>
			</td>
			<td id="tab2" class="tab" align="center">
				<a href="javascript:disp_div('oinfo','tab2')" style="color: gray; width: 50%;">구매내역</a>
			</td>
		</tr>
	</table>
	<div id="minfo" class="info" style="width:100%;">
		<h3>장바구니</h3>
	</div>
	<div id="oinfo" class="info" style="display:none; width:100%;">
		<c:if test="${empty buylist }" >
			<h3>구매 내역이 없습니다.</h3>
		</c:if>
		<c:if test="${!empty buylist }">
		<table>
			<tr>
				<th>주문번호</th>
				<th>주문일자</th>
				<th>총 주문금액</th>
			</tr>
			<c:forEach items="${buylist }" var="buy" varStatus="stat">
				<tr>
					<td align="center">
						<a href="javascript:list_disp('saleLine${stat.index+1 }')">${stat.index+1 }</a>
					</td>
					<td align="center">
						<fmt:formatDate value="${buy.buy_date }" pattern="yyyy-MM-dd" />
					</td>
					<td align="right">
						<fmt:formatNumber value="${buy.total }" pattern="#,###" />원
					</td>
				</tr>
				<tr id="saleLine${stat.index+1 }" class="saleLine">
					<td colspan="3" align="center">
						<table>
							<tr>
								<th width="25%">번호</th>
								<th width="25%">상품명</th>
								<th width="25%">수량</th>
								<th width="25%">합계</th>
							</tr>
							<c:forEach items="${buy.itemList }" var="buyItem">
								<tr>
									<td class="title">${buyItem.item.item_no }</td>
									<td>${buyItem.item.item_name }</td>
									<td>${buyItem.item_each }개</td>
									<td><fmt:formatNumber value="${buyItem.item_each * buyItem.item.item_price }" pattern="#,###" />원</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	</div>
	</div>
</body>
</html>