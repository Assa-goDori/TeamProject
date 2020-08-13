<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 마이페이지</title>
<link rel='stylesheet' href='../css/savedogs_main.css' />
</head>
<body>
		<div class="main_div" style="width: 100%;">
			<div id="minfo" class="info" style="width: 100%;">
				<table>
					<tr>
						<th>아이디</th>
						<td>${mem.member_id }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${mem.member_name }</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<fmt:formatDate var="birth" value="${mem.member_birthday }" pattern="yyyy년MM월dd일" />
						<td>${birth }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${mem.member_tel }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${mem.member_postcode }${mem.member_address }
							${mem.member_daddress }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${mem.member_email }</td>
					</tr>
				</table>
				<div align="center">
					<input type="button" value="수정하기" onclick="location.href='checkpass.dog?type=1&id=${mem.member_id}'">
					<input type="button" value="탈퇴" >
				</div>
			</div>
		</div>
</body>
</html>