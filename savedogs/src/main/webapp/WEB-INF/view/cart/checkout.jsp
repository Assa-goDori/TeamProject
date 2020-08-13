<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/webapp/WEB-INF/view/cart/checkout.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>주문 전 상품 목록 보기</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js?autoload=false"></script>
<script>
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("#member_pass2").keyup(function() {
			var pass=$("#member_pass").val();
			var pass2=$("#member_pass2").val();
			if(pass != "" || pass2 != "") {
				if(pass == pass2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});

	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                   //document.getElementById("member_daddress").value = extraAddr;
                } else {
                   //document.getElementById("member_daddress").value = '';
                }
                document.getElementById('member_postcode').value = data.zonecode;
                document.getElementById("member_address").value = addr + extraAddr;
                document.getElementById("member_daddress").focus();
            }
        }).open();
	}
</script>

<link rel='stylesheet' href='../css/savedogs_main.css' />
</head>
<body>
<div style="width: 80%; margin-left: 10%;" >
	<div align="center" >
		<h2>상품구매</h2>
	</div>
	<hr>
	<h3 align="left" style="margin-left: 15%;">구매 정보</h3>
	<br>
	<div align="center">
	<table>
		<tr><th>상품명</th><th>상품코드</th><th>가격</th><th>수량</th></tr>
		<c:forEach items="${sessionScope.CART.itemSetList}" var="itemSet" varStatus="stat">
			<tr>
				<td align="center">${itemSet.item.item_name}</td><td align="center">${itemSet.item.item_code}</td><td align="center">${itemSet.item.item_price*itemSet.item_each}</td>
				<td align="center">${itemSet.item_each}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<br>
	<hr>
	<form>
	<h3 align="left" style="margin-left: 15%;">배송지 정보</h3>
	<br>
	<div align="center">
		<table style="width: 100%;"><tr><td align="right">회원정보와 동일<input name="info" type="checkbox" onclick=""></td></tr></table>
		<div>
			<table>
				<tr>
					<td width="30%">아이디</td>
					<td width="70%">${sessionScope.loginmem.member_id}</td>
				</tr>
				<tr>
					<td width="30%">이름</td>
					<td width="70%">${sessionScope.loginmem.member_name }</td>
				</tr>
				<tr>
					<td width="30%">우편번호</td>	
					<td width="70%"><input style="width: 50%;" value=<fmt:formatNumber pattern="00000" value="${sessionScope.loginmem.member_postcode }"/>>&nbsp;&nbsp;<input style="width: 20%;" type="button" value="찾기"></td>
				</tr>
				<tr>
					<td width="30%">주소</td>
					<td width="70%"><input value="${sessionScope.loginmem.member_address}"></td>
				</tr>
				<tr>
					<td width="30%">상세 주소</td>
					<td width="70%"><input value="${sessionScope.loginmem.member_daddress}"></td>
				</tr>		
				<tr>
					<td width="30%">전화번호</td>
					<td width="70%"><input value="${sessionScope.loginmem.member_tel}"></td>
				</tr>
			</table>
		</div>
	</div>
	<h3 align="left" style="margin-left: 15%;">총 구입 금액 : <fmt:formatNumber pattern="0,000" value="${sessionScope.CART.total}"/> 원</h3>
	<input type="button" value="주문 완료" onclick="location.href='end.dog'">
	<input type="button" value="취소" onclick="location.href='../item/list.dog'">
	</form>
</div>	
</body></html>