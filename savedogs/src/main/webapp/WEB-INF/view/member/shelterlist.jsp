<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보호소 선택하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function() {
		$("li").click(function() {
			$(opener.document).find("#shelter_no").val($(this).text().substr(0,15));
			window.close();
		})
	})
</script>
</head>
<body>
	<form name="f" method="post">
		<select name="goo">
			<c:forEach items="${list }" var="m">
				<option>${m.shelter_address }</option>
			</c:forEach>
		</select>
		<script>
			f.goo.value="${param.goo}";
		</script>
		<input type="submit" value="검색">
	</form>
	<div align="left">
		<c:if test="${empty namelist }">
			<h4>구를 선택하세요</h4>
		</c:if>
		<c:if test="${!empty namelist }">
			${namelist[0].shelter_address } 보호소 현황<br>
			<ul>
				<c:forEach items="${namelist }" var="n">
					<li>${n.shelter_no} ${n.shelter_name }</li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
</body>
</html>