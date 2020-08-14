<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유기견 상세</title>
<link rel='stylesheet' href='../css/savedogs_main.css' />
<style>
	img {
		width : 500px;
		height : 500px;
	}
</style>
</head>
<body>
	<div>
		<h2>상세 정보</h2>
		<br>
		<h3>유기견 정보</h3><table>
				<tr><td><img src="${go.popfile}"></td></tr>
				</table>
		<table>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<th>공고 기간</th>
				<td>${go.noticeSdt}부터${go.noticeEdt}까지</td>
			</tr>
			<tr>
				<th>공고 번호</th>
				<td>${go.noticeNo}</td>
			</tr>
			<tr>
				<th>종류</th>
				<td>${go.kindCd}</td>
			</tr>
			<tr>
				<th>색상</th>
				<td>${go.colorCd}</td>
			</tr>
			<tr>
				<th>성별
				<td>${go.sexCd}</td>
			</tr>
			<tr>
				<th>나이
				<td>${go.age}</td>
			</tr>
			<tr>
				<th>무게
				<td>${go.weight}</td>
			</tr>
			<tr>
				<th>특징
				<td>${go.specialMark}</td>
			</tr>
			<tr>
				<th>구조일
				<td>${go.happenDt}</td>
			</tr>
			<tr>
				<th>구조 장소
				<td>${go.happenPlace}</td>
			</tr>
		</table>
		<input type="submit" value="입양 신청" class="s_btn" onclick="location.href='adoptSignup.dog'">
	</div>
</body>
</html>