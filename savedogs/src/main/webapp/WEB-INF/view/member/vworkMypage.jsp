<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 봉사</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script>
	function showgraph() {
		var selectyear = document.getElementById("selectyear").value;
		$.ajax({
			url : "../ajax/vworkgraph.dog",
			type : "POST",
			data : "year="+ selectyear + "&member_id=${sessionScope.loginmem.member_id}",
			success : function(data) {
				vworkgraph(data);
			},
			error : function(e) {
				alert("ajax 오류");
			}
		})
	}
	
	var randomColorFactor = function() {
		return Math.round(Math.random()*255);
	}
	var randomColor = function(opacity) {	//opacity : 투명도
		return "rgba(" + randomColorFactor() + ","
				+ randomColorFactor() + ","
				+ randomColorFactor() + ","
				+ (opacity || '.3') + ")";
	};
	
	function vworkgraph(data) {
		console.log(data)
		var rows = JSON.parse(data)
		var dates = []
		var datas = []
		var colors = []
		$.each(rows, function(index, item) {
			/* names[index] = item.name; */
			dates[index] = item.m;
			datas[index] = item.cnt;
			colors[index] = randomColor(0.7);
		})

		var chartData = {
			labels : dates,
			datasets : [
				{
					type:'line',
					borderWidth : 2,
					borderColor:colors,
					label : '건수',
					fill : false,
					data : datas
				},
				{
					type:'bar',
					label : '건수',
					backgroundColor:colors,
					data : datas,
				}
			]
		};
		
		var ctx = document.getElementById("canvas").getContext("2d");
		new Chart(ctx, {
			type : 'bar',
			data : chartData,
			options : {
				responsive : true,
				title : {
					display : true,
					text : '월별 봉사 횟수'
				},
				legend : {display : false},
				scales : {
					xAxes : [{
						display : true,
						scaleLabel : {
							display : true,
							labelString : '월'
						}
					}],
					yAxes : [{
						display : true,
						scaleLabel : {
							display : true,
							labelString : '횟수'
						},
						stacked : true	//(0부터 시작)
					}]
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="maiv_div" style="width: 100%;">
		<h3>신청한 봉사내역</h3>
		<hr>
		<c:if test="${empty list }">
			<h5>신청한 봉사내역이 없습니다.</h5>
		</c:if>
		<c:if test="${!empty list }">
			<table>
				<tr>
					<th>봉사날짜</th>
					<th style="width:300px;">장소</th>
					<th>비고</th>
				</tr>
			<c:forEach items="${list }" var="m">
				<tr>
					<fmt:formatDate value="${m.vwork_date }" pattern="yyyy-MM-dd" var="date"/>
					<td>${date}</td>
					<td style="width:300px;">${m.shelter_address} ${m.shelter_name }</td>
					<td>
						<a href="../vwork/vdetail.dog?vwork_no=${m.vwork_no }">상세보기</a>
					</td>
				</tr>
			</c:forEach>
			</table>
		</c:if>
		<hr>
		<h3>나의봉사 현황</h3>
		<select id="selectyear">
			<c:forEach items="${yearlist }" var="list">
				<option>${list.year }</option>
			</c:forEach>
		</select>
		<input type="button" value="출력" onclick="showgraph()">
		<div id="vworkgraph" style="margin:30%; width:40%;">
			<canvas id="canvas" style="width:100%;"></canvas>
		</div>
	</div>
</body>
</html>