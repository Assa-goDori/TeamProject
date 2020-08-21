<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지</title>
<script type="text/javascript">
	function newlist() {
		alert("최신화 완료")
		document.f.submit();
	}
</script>
</head>
<body>
	<div class="main_div" style="width:100%;">
		<form name="f" method="post" action="recent.dog">
			<input type="button" value="보호소정보 최신화" onclick="newlist()">
		</form>
	</div>
</body>
</html>