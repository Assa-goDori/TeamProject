<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- WEB-INF/view/item/detail.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>상품 상세 보기</title>
<script type="text/javascript">
 	function cartChk(){
 		
 		msg = "장바구니에 상품이 추가되었습니다. \n계속해서 쇼핑을 진행할까요? \n아니요 선택시 장바구니로 이동됩니다." 
 		if (confirm(msg) != 0){   
 		     location.href = "cartadd.dog"
 		 }else{
 			 
 			 location.href="../cart/cartadd.dog"
 		 }
 	}
</script>
</head>
<body>
<div style="width: 80%; margin-left: 10%;" >
	<div align="center">
		<h2>상품 상세 보기</h2>
	</div>
	<hr>
	<br>
	<div align="center">
		<table style="width: 70%;">
			<tr>
				<td width="50%">
					&nbsp;<img src="img/${item.item_picture}" style="width: 80%; height: 80%;">&nbsp;
				</td>
				<td>
					<table>
						<tr>
							<td align="center" width="30%"><h3>상품명</h3> </td>
							<td><h4>&nbsp;${item.item_name}</h4></td>
						</tr>
						<tr>
							<td align="center" width="30%"><h3>가격</h3></td>
							<td><h4>&nbsp;${item.item_price}원</h4></td>
						</tr>
						<tr>
							<td align="center" width="30%"><h3>상품코드</h3></td>
							<td><h4>&nbsp;${item.item_code}</h4></td>
						</tr>
						
						<tr>
							<td colspan="2">
								<form action="../cart/cartAdd.dog">
									<input type="hidden" name="id" value="${item.item_no}">
									<table style="width: 100%; height: 100%;">
										<tr>
											<td width="100%" align="center">
												<h3>수량 &nbsp;&nbsp;&nbsp;<select style="width: 70%;" name="quantity">
					 								<c:forEach begin="1" end="10" var="i">
					 									<option>${i}</option>
					 								</c:forEach>
					 							</select></h3>
					 						</td>
					 					</tr>
					 					<tr style="height: 15%;">
				 							<td width="100%" align="center">
				 								<input style="width: 100%;" type="button" value="장바구니" onclick="cartChk()">
				 							</td>
				 						</tr>
				 						
				 						<tr style="height: 15%;">
				 							<td width="100%" align="center">
				 								<input style="width: 100%;" type="button" value="상품목록" onclick="location.href='list.dog'">
				 							</td>
				 						</tr>
									</table>
								</form>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<br>
	<div>
		<h3 style="margin-left: 15%;">상품 정보</h3>
		<hr>
		<br>
		<h4 style="margin-left: 15%;">${item.item_content}</h4>
		<br>
		<hr>
		
		<div align="center">
			<c:if test="${sessionScope.loginmem.member_id eq 'admin'}"> 
			<table>
				<tr>
					<td><input type="button" value="수정" onclick="location.href='update.dog'">&nbsp;</td>
					<td><input type="button" value="삭제" onclick="location.href='delete.dog'"></td>
				</tr>
			</table>
			</c:if>
		</div>
	</div>
</div>
</body></html>