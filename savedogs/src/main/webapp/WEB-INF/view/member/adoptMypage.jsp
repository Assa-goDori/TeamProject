<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 입양</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#minfo").show();
		$("#oinfo").hide();
		$(".saleLine").each(function(){
			$(this).hide();
		})
		$("#tab1").addClass("selection");
	})
	function disp_div(id,tab){
		$(".info").each(function(){
			$(this).hide();
		})
		$(".tab").each(function(){
			$(this).removeClass("selection");
		})
		$("#"+id).show();
		$("#"+ tab).addClass("selection");
	}
	function list_disp(id){
		$("#"+id).toggle();
	}
</script>
<style type="text/css">
	.selection{
		padding: 3px;
	}
	.selection > a {
		color: #000000;
		text-decoration : none;
		font-weight : bold;	
	}
</style>
</head>
<body>
	<div class="maiv_div" style="width: 100%;"> 
	<div align="center" style="width: 100%; margin-left:42%;">
	<table style="width: 100%;">
		<tr>
			<td id="tab1" class ="tab" style="width: 50%;" align="center">
				<a href="javascript:disp_div('minfo','tab1')" style="color: gray; width: 50%;">입양신청 조회</a>
			</td>
			<td id="tab2" class="tab" align="center">
				<a href="javascript:disp_div('oinfo','tab2')" style="color: gray; width: 50%;">관심 가는 아이</a>
			</td>
		</tr>
	</table>
	</div>
	<div id="minfo" class="info" style="display:none; width:100%;">
		<c:if test="${empty myadoptlist }" >
			<h3>유기견을 찾아보세요.</h3>
			<input class="s_btn" type="button" value="검색" onclick="location.href='../adopt/amain.dog'">
		</c:if>
		<c:if test="${!empty myadoptlist }">
		<h5>진행 단계는 다음과 같습니다.</h5>
		<h5>신청 -> 거부/승인 -> 완료</h5>
		<h5>신청 : 입양 신청이 접수된 상태</h5>
		<h5>거부 : 보호소에서 거부된 상태</h5>
		<h5>승인 : 보호소에서 승인된 상태</h5>
		<h5>완료 : 입양절차가 완료된 상태</h5>
		<table>
			<tr>
				<th>신청날짜</th>
				<th>공고번호</th>
				<th>보호소</th>
				<th>진행단계</th>
			</tr>
		</table>
	</c:if>
	</div>
	<div id="oinfo" class="info" style="width:100%;">
		<h3>관심 가는 아이</h3>
	</div>
	</div>
</body>
</html>