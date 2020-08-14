<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 쇼핑</title>
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
	<table style="width: 100%;">
		<tr>
			<td id="tab1" class ="tab" style="width: 50%;" align="center">
				<a href="javascript:disp_div('minfo','tab1')" style="color: gray; width: 50%;">장바구니</a>
			</td>
			<c:if test="${param.id != 'admin'}">
				<td id="tab2" class="tab" align="center">
					<a href="javascript:disp_div('oinfo','tab2')" style="color: gray; width: 50%;">구매내역</a>
				</td>
			</c:if>
		</tr>
	</table>
	</div>
</body>
</html>