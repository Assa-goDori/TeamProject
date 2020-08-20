<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉사내역 상세보기</title>
<link rel='stylesheet' href='../css/savedogs_main.css' />
<style>
	.data {
		text-align: center;
	}
</style>
</head>
<body>
	<div class="maiv_div" style="width: 100%;">
		<h3>봉사내역 상세보기</h3>
		<hr>
		<table>
			<tr>
				<th>봉사날짜</th>
				<fmt:formatDate value="${showVwork.vwork_date }" pattern="yyyy-MM-dd" var="day"/>
				<td>${day}</td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td>${Nowmem} / ${showVwork.vwork_member }</td>
			</tr>
			<tr>
				<th>설명</th>
				<td>
					<textarea style="width:500px; height:200px;">
						${showVwork.vwork_content }
					</textarea>
				</td>
			</tr>
			<tr>
				<td class="data" colspan="2">
					<input class="small_btn" type="button" value="목록으로" onclick="location.href='sheltervworkMypage.dog?type=2&id=${sessionScope.loginsmem.member_id}'">
				</td>
			</tr>
		</table>
		<hr>
		<h3>신청자 현황</h3>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
			</tr>
			<c:forEach items="${detaillist }" var="dlist">
				<tr>
					<td class="data">
						${dlist.vwork_id }
					</td>
					<td class="data">
						${dlist.member_name }
					</td>
					<td class="data">
						${dlist.vwork_tel }
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>