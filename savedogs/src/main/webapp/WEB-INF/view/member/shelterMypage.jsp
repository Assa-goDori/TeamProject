<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>보호소관리자 마이페이지</title>
<link rel='stylesheet' href='../css/savedogs_main.css' />
</head>
<body>
		<div class="main_div" style="width: 100%;">
				<table>
					<tr>
						<th>아이디</th>
						<td>${mem.member_id }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${mem.member_tel }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${mem.member_email }</td>
					</tr>
					<tr>
						<th>보호소</th>
						<td>${mem.shelter_no }</td>
					</tr>
				</table>
				<div align="center">
					<input type="button" class="s_btn" value="수정하기" onclick="location.href='checkpass.dog?type=1&id=${mem.member_id}'">
					<input type="button" class="s_btn" value="탈퇴" >
				</div>
		</div>
</body>
</html>