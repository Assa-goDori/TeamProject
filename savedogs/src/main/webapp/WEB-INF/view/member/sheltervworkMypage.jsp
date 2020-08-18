<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 봉사</title>
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
		<div align="center" style="width: 100%; margin-left: 45%;">
			<table style="width: 100%;">
				<tr>
					<td id="tab1" class="tab" style="width: 50%;" align="center">
						<a href="javascript:disp_div('minfo','tab1')" style="color: gray; width: 50%;">봉사 캘린더</a>
					</td>
					<td id="tab2" class="tab" align="center"><a href="javascript:disp_div('oinfo','tab2')" style="color: gray; width: 50%;">작성한 봉사</a></td>
				</tr>
			</table>
		</div>
		<div id="minfo" class="info" style="width:100%;">
		
		</div>
		<div id="oinfo" class="info" style="display:none; width:100%;">
			<h3>작성한 봉사리스트</h3>
			<hr>
			<table>
				<tr>
					<th>봉사날짜</th>
					<th>모집인원</th>
					<th>상태</th>
				</tr>
				<c:forEach items="${writelist }" var="list">
					<tr>
						<td>
							<fmt:formatDate value="${list.vwork_date }" pattern="yyyy-MM-dd" var="day"/>
							<a href="#">${day }</a>
						</td>
						<td>${list.vwork_member }</td>
						<td>
							${list.state>0?"모집중":"완료" }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>