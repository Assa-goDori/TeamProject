<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원 마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#minfo").show();
		$("#vinfo").hide();
		$("#finfo").hide();
		$("#ainfo").hide();
		$("#sinfo").hide();
		$("#tab1").addClass("select");
	})
	
	function disp_div(id, tab) {
		$(".info").each(function() {
			$(this).hide();
		})
		$(".tab").each(function() {
			$(this).removeClass("select");
		})
		$("#" + id).show();
		$("#" + tab).addClass("select");
	}
	
	/*function list_disp(id) {
		$("#" + id).toggle();	//show()와 hide() 기능을 모두 담고있음
	}*/
</script>
<style type="text/css">
	.select {
		padding:3px;
		background-color: #0000ff;
	}
	
	.select>a {
		color:#ffffff;
		text-decoration: none;	/* 하이퍼링크 밑줄 제거 */
		font-weight:bold;		/* 글씨체 굵게 */
	}
</style>
</head>
<body>
	<div style="margin-left: 30%; width:40%;">
	<h3>My Page</h3>
	<hr>
	<div style=" width:100%;">
		<table>
			<tr>
				<td id="tab1" class="tab">
					<a href="javascript:disp_div('minfo','tab1')">내 정보</a>
				</td>
				<td id="tab2" class="tab">
					<a href="javascript:disp_div('vinfo', 'tab2')">봉사</a>
				</td>
				<td id="tab3" class="tab">
					<a href="javascript:disp_div('finfo', 'tab3')">기부</a>
				</td>
				<td id="tab4" class="tab">
					<a href="javascript:disp_div('ainfo', 'tab4')">입양</a>
				</td>
				<td id="tab5" class="tab">
					<a href="javascript:disp_div('sinfo', 'tab5')">쇼핑</a>
				</td>
			</tr>
		</table>
		<div id="minfo" class="info" style="width:100%;">
			<h3>내 정보 탭입니다.</h3>
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
					<td>${mem.member_birthday }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${mem.member_tel }</td>
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
			<div align="center">
				<input type="button" value="수정하기" onclick="location.href='memberUpdate.dog'">
				<input type="button" value="탈퇴" onclick="location.href='memberDelete.dog'">
			</div>
		</div>
		<div id="vinfo" class="info" style="display: none; width:100%;">
			<h3>봉사 탭입니다.</h3>
		</div>
		<div id="finfo" class="info" style="display: none; width:100%;">
			<h3>기부 탭입니다.</h3>
		</div>
		<div id="ainfo" class="info" style="display: none; width:100%;">
			<h3>입양 탭입니다.</h3>
		</div>
		<div id="sinfo" class="info" style="display: none; width:100%;">
			<h3>쇼핑 탭입니다.</h3>
		</div>
	</div>
	</div>
</body>
</html>