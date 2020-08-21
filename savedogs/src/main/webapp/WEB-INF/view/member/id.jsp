<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript">
	function winclose(){
		opener.document.getElementById("member_id").value=${id};
		self.close()
	}
</script>
<link rel='stylesheet' href='../css/savedogs_exc.css' />
</head>
<body>
	<div align="center">
		<h2>아이디 찾기</h2>
	</div>
	<hr>
	<h3>요청하신 아이디는 ${id}입니다.</h3>
	<input type="button" value="제출" onclick="winclose()">
	</form>
</body>
</html>