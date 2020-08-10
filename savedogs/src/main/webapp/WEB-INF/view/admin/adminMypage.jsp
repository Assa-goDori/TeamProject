<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#linfo").show();
		$("#finfo").hide();
		$("#minfo").hide();
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
	
	function newlist() {
		alert("최신화 완료")
		document.f.submit();
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
					<a href="javascript:disp_div('linfo','tab1')">회원</a>
				</td>
				<td id="tab2" class="tab">
					<a href="javascript:disp_div('finfo', 'tab2')">기부</a>
				</td>
				<td id="tab3" class="tab">
					<a href="javascript:disp_div('minfo', 'tab3')">내 정보</a>
				</td>
			</tr>
		</table>
		<div id="linfo" class="info">
			<h3>회원 탭입니다.</h3>
			<form name="f">
				<input type="button" value="보호소정보 최신화" onclick="newlist()">
			</form>
		</div>
		<div id="finfo" class="info" style="display: none; width:100%;">
			<h3>기부 탭입니다.</h3>
		</div>
		<div id="minfo" class="info" style="display: none; width:100%;">
			<h3>내 정보 탭입니다.</h3>
		</div>
	</div>
	</div>
</body>
</html>