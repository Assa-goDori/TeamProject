<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원내역 상세보기</title>
<link rel='stylesheet' href='../css/savedogs_main.css' />
<style>
	.data {
		text-align: center;
	}
</style>
</head>
<body>
<div class="maiv_div" style="width: 100%;">
		<h3>나의 후원 리스트 상세보기</h3>
		<hr>
		<table>
			<tr>
				<th>제목</th>
				<td>${showFund.fund_subject}</td>
			</tr>
			<tr>
				<th>기간</th>
				<fmt:formatDate value="${showFund.start_date }" pattern="yyyy-MM-dd" var="start"/>
				<fmt:formatDate value="${showFund.end_date }" pattern="yyyy-MM-dd" var="end"/>
				<td>${start} ~ ${end}</td>
			</tr>
			<tr>
				<th>목표금액</th>
				<td>
					${showFund.fund_count}
				</td>
			</tr>
			<tr>
				<td class="data" colspan="2">
					<input class="small_btn" type="button" value="목록으로" onclick="location.href='shelterfundMypage.dog?type=3&id=${sessionScope.loginsmem.member_id}'">
				</td>
			</tr>
		</table>
		<hr>
		<h3>후원신청자 현황</h3>
		<table>
			<tr>
				<th>아이디</th>
				<th>이메일</th>
				<th>후원금액</th>
				<th></th>
			</tr>
			<c:forEach items="${detaillist }" var="dlist">
				<tr>
					<td class="data">
						${dlist.fund_id }
					</td>
					<td class="data">
						${dlist.member_email }
					</td>
					<td class="data">
						${dlist.fund_cost }
					</td>
					<td>
					
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>