<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 봉사</title>

</head>
<body>
	<div style="margin-left: 30%; width: 40%;">
		<h3>My Page</h3>
		<hr>
		<div style="width: 100%;">
			<table style="width: 100%;">
				<tr>
					<td id="tab1" align="center" class="tab" style="width: 20%"><a
						href="memberMypage.dog?id=}">내정보</a></td>
					<td id="tab2" align="center" class="tab" style="width: 20%"><a
						href="vworkMypage.dog?id=${sessionScope.loginmem.member_id }">봉사</a>
					</td>
					<td id="tab3" align="center" class="tab" style="width: 20%"><a
						href="fundingMypage.dog?id=${sessionScope.loginmem.member_id }">기부</a>
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