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
	width: 500px;
	height: 500px;
	text-align: center;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#minfo").show();
		$("#oinfo").hide();
		$("#tab1").addClass("selection");
	})
	function disp_div(id, tab) {
		$(".info").each(function() {
			$(this).hide();
		})
		$(".tab").each(function() {
			$(this).removeClass("selection");
		})
		$("#" + id).show();
		$("#" + tab).addClass("selection");
	}
	function list_disp(id) {
		$("#" + id).toggle();
	}
</script>
<style type="text/css">
th {
	width: 150px;
	text-align: left;
}

.selection {
	padding: 3px;
}

.selection>a {
	color: #000000;
	text-decoration: none;
	font-weight: bold;
}
</style>
</head>
<body>
	<div>
		<h2>상세 정보</h2>
		<br>
		<table>
			<tr>
				<td id="tab1" class="tab" style="width: 50%;" align="center"><a
					href="javascript:disp_div('minfo','tab1')"
					style="color: gray; width: 50%;">유기견 정보</a></td>
				<td id="tab2" class="tab" align="center"><a
					href="javascript:disp_div('oinfo','tab2')"
					style="color: gray; width: 50%;">보호소 정보</a></td>
			</tr>
		</table>
		<div id="minfo" class="info">
			<img src="${go.popfile}"> <br>
			<table>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<th>공고 기간</th>
					<td><fmt:formatDate value="${go.noticeSdt}"
							pattern="yyyy-MM-dd" /> 부터 <fmt:formatDate
							value="${go.noticeEdt}" pattern="yyyy-MM-dd" /> 까지</td>
				</tr>
				<tr>
					<th>공고 번호</th>
					<td>${go.noticeNo}</td>
				</tr>
				<tr>
					<th>구조일
					<td><fmt:formatDate value="${go.happenDt}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>구조 장소
					<td>${go.happenPlace}</td>
				</tr>
				<tr>
					<th>상태</th>
					<td>${go.processState}</td>
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
			</table>
		</div>
		<div id="oinfo" class="info">
			<table>
				<tr>
					<th>주소</th>
					<td>${go.careAddr}</td>
				</tr>
				<tr>
					<th>보호소명</th>
					<td>${go.careNm}</td>
				</tr>
				<tr>
					<th>보호소 연락처</th>
					<td>${go.careTel}</td>
				</tr>
				<tr>
					<th>담당자</th>
					<td>${go.chargeNm}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${go.officetel}</td>
				</tr>
			</table>
		</div>
		<br> <input type="submit" value="입양 신청" class="s_btn"
			onclick="location.href='adoptSignup.dog'">
	</div>
</body>
</html>