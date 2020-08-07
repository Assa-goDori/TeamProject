<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>키워드 검색</title>
</head>
<body>
	<h1>키워드 검색</h1>
	<br>
	<div style="width: 100%">
		<div style="width: 200px; height: 150px; float: left;">
			<h2>상태</h2>
			<select>
				<option value="null" selected="selected">전체</option>
				<option value="notice">공고중</option>
				<option value="protected">보호중</option>
			</select>
		</div>
		<div style="width: 200px; height: 150px; float: left;">
			<h2>품종</h2>
			<select>
				<option value="null" selected="selected">전체</option>
			</select>
		</div>
		<div style="width: 200px; height: 150px; float: left;">
			<h2>성별</h2>
			<select>
				<option value="null" selected="selected">전체</option>
				<option value="">암컷</option>
				<option value="">수컷</option>
			</select>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="tag"></div>
	<hr>
	<div>
		<span id="deadline" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''">공고 마감순&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span id="registration" onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''">최근 등록순</span>

	</div>
</body>
</html>