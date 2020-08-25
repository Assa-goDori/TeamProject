<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 후원</title>
<link rel='stylesheet' href='../css/savedogs_main.css' />
<style>
	.data {
		text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script>
	function showgraph() {
		var selectyear = document.getElementById("selectyear").value;
		$.ajax({
			url : "../ajax/fundgraph.dog",
			type : "POST",
			data : "year="+ selectyear + "&member_id=${sessionScope.loginmem.member_id}",
			success : function(data) {
				fundgraph(data);
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
	
	function fundgraph(data) {
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
					text : '월별 기부 횟수'
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
	<h3>신청한 펀딩내역</h3>
	<hr>
	<c:if test="${empty fundlist }">
		<h3>신청한 펀딩이 없습니다.</h3>
	</c:if>
	<c:if test="${!empty fundlist }">
		<table>
			<tr>
				<th style="width:250px;">펀딩 날짜</th>
				<th style="width:300px;">후원명</th>
				<th>후원금액</th>
			</tr>
			<c:forEach items="${fundlist }" var="list">
				<tr>
					<td style="width:250px;" class="data">
						<fmt:formatDate value="${list.fund_date }" pattern="yyyy년 MM월 dd일" var="date1"/>
						${date1 }
					</td>
					<td style="width:300px;" class="data">
						<a href="../funding/detail.dog?fund_no=${list.fund_no}">${list.fund_subject }</a>
					</td>
					<fmt:formatNumber pattern="##,###원" value="${list.fund_cost }" var="cost1"/>
					<td class="data">${cost1 }</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<br>
	<hr>
	<br>
	<h3>나의 펀딩 현황</h3>
	<c:if test="${empty endfundlist }">
		<h3>완료한 펀딩이 없습니다.</h3>
	</c:if>
	<c:if test="${!empty endfundlist }">
		<table>
			<tr>
				<th style="width:250px;">펀딩 날짜</th>
				<th style="width:300px;">후원명</th>
				<th>후원금액</th>
			</tr>
			<c:forEach items="${endfundlist }" var="endlist">
				<tr>
					<td style="width:250px;" class="data">
						<fmt:formatDate value="${endlist.fund_date }" pattern="yyyy년 MM월 dd일" var="date2"/>
						${date2 }
					</td>
					<td style="width:300px;" class="data">
						<a href="../funding/detail.dog?fund_no=${endlist.fund_no}">${endlist.fund_subject }</a>
					</td>
					<fmt:formatNumber pattern="##,###원" value="${endlist.fund_cost }" var="cost2"/>
					<td class="data">${cost2 }</td>
				</tr>
			</c:forEach>
		</table>
		<hr>
			<select id="selectyear">
				<c:forEach items="${yearlist }" var="list">
					<option>${list.year }</option>
				</c:forEach>
			</select>
			<input type="button" value="출력" onclick="showgraph()">
			<div id="main_div" align="center" style="width:50%; margin-left:25%">
				<canvas id="canvas" style="width:50%; height:100%;"></canvas>
			</div>
	</c:if>
</body>
</html>