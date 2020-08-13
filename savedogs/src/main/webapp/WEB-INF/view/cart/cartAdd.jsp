<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 이동</title>
</head>
<body>
<div>
	<h3>장바구니에 상품이 추가되었습니다.</h3> 
	<h3>계속해서 쇼핑을 진행할까요?</h3>
	<h3>아니요 선택시 장바구니로 이동됩니다.</h3>
	<form>
		<table>
			<tr>
				<td><input type="button" class="yes" value="예" onclick="location.href='../item/list.dog'"></td>
				<td><input type="button" class="no"  value="아니오" onclick="location.href='cartView.dog'"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>