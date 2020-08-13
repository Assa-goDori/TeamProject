<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 봉사</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#tab1").removeClass("select");
		$("#tab2").removeClass("select");
		$("#tab3").removeClass("select");
		$("#tab4").removeClass("select");
		$("#tab5").addClass("select");
	})
</script>
<style type="text/css">
.select {
	padding: 3px;
	background-color: #3598DA;
}

.select>a {
	color: #ffffff;
	text-decoration: none; /* 하이퍼링크 밑줄 제거 */
	font-weight: bold; /* 글씨체 굵게 */
}
</style>
</head>
<body>
<div style="margin-left: 30%; width: 40%;">
<h3>My Page</h3>
		<hr>
	<div style="width: 100%;">
			<table style="width: 100%;">
				<tr>
					<td id="tab1" align="center" class="tab" style="width: 20%"><a
						href="memberMypage.dog?id=${sessionScope.loginmem.member_id }">내정보</a></td>
					<td id="tab2" align="center" class="tab" style="width: 20%"><a
						href="vworkMypage.dog?id=${sessionScope.loginmem.member_id }">봉사</a>
					</td>
					<td id="tab3" align="center" class="tab" style="width: 20%"><a
						href="fundMypage.dog?id=${sessionScope.loginmem.member_id }">기부</a>
					</td>
					<td id="tab4" align="center" class="tab" style="width: 20%"><a
						href="adoptMypage.dog?id=${sessionScope.loginmem.member_id }">입양</a>
					</td>
					<td id="tab5" align="center" class="tab" style="width: 20%"><a
						href="shopMypage.dog?id=${sessionScope.loginmem.member_id }">쇼핑</a>
					</td>
				</tr>
			</table>
		</div>
		</div>
</body>
</html>