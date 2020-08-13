<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="update" style="display: none; width:100%;">
			<!-- <form name="updatef" method="post" action="memberupdate.dog"> -->
				<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" value="${mem.member_id }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" value="${mem.member_name }"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<fmt:formatDate var="birth" value="${mem.member_birthday }" pattern="yyyy년 MM월 dd일"/>
					<td><input type="text" value="${birth }"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" value="${mem.member_tel }"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${mem.member_postcode }${mem.member_address } ${mem.member_daddress }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${mem.member_email }</td>
				</tr>
			</table>
			<!-- </form> -->
		</div>
</body>
</html>