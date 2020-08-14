<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해독 : 봉사 목록</title>
<link rel='stylesheet' href='../css/savedogs_main.css' />
</head>
<body>
<div class="main_div">
	<h2>봉사 신청</h2>
	<hr>
	<table><tr><th>보호소 선택</th><th>></th><th>최종 신청</th></tr></table>
	
	<div>
		<div>
			날짜 : <input type="date" value="${param.date }">
		</div>
		<div>
			<table>
			<c:if test="${listcnt > 0 }"> 
				<tr><th>no</th><th>지역</th><th>보호소</th><th>모집인원</th><th>&nbsp;</th></tr>
				<c:forEach var="vwork" items="${vworklist }">
				<tr><td>${vworkno}</td><c:set var="vworkno" value="${vworkno-1 }"/>
					<td>지역구</td>
					<td>보호소명</td>
					<td>/${vwork.vwork_member }</td>
					<td>
						<input type="button" value="상세보기">
						<input type="button" value="신청">
					</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${listcnt == 0 }"> 
				<tr><td colspan="5">해당 날짜 봉사활동이 없습니다.</td></tr>
			</c:if>
			</table>
		</div>
	</div>
</div>


</body>
</html>