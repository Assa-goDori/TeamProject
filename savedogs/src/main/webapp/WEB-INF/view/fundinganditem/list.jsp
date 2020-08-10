<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>MyPage</title>
<script type="text/javascript">
	$(document).ready(function(){
		$("#minfo").show();
		$("#oinfo").hide();
		$(".saleLine").each(function(){
			$(this).hide();
		})
		$("#tab1").addClass("select");
	})
	function disp_div(id,tab){
		$(".info").each(function(){
			$(this).hide();
		})
		$(".tab").each(function(){
			$(this).removeClass("select");
		})
		$("#"+id).show();
		$("#"+ tab).addClass("select");
	}
	function list_disp(id){
		$("#"+id).toggle();
	}
</script>
<style type="text/css">
	.select{
		padding: 3px;
	}
	.select > a {
		color: #000000;
		text-decoration : none;
		font-weight : bold;	
	}
</style>
</head>
<body>
<div style="margin-left: 20%; margin-right: 20%;">
	<table style="width: 100%;">
		<tr>
			<td id="tab1" class ="tab" style="width: 50%;">
				<a href="javascript:disp_div('minfo','tab1')" style="color: gray; width: 50%;">펀딩</a>
			</td>
			<c:if test="${param.id != 'admin'}">
				<td id="tab2" class="tab">
					<a href="javascript:disp_div('oinfo','tab2')" style="color: gray; width: 50%;">후원 쇼핑몰</a>
				</td>
			</c:if>
		</tr>
	</table>
	<hr>
	<%-- oinfo : 기부 정보 출력  --%>
	<div id="oinfo" class="info" style="display: none; width: 100%;">
	
	</div>
	
	<%-- minfo  : 쇼핑몰 정보 출력 --%>
	<div id="minfo" class="info">
	
	</div>
</div>
</body></html>