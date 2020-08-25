<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 봉사</title>
<!-- calendar 관련 -->
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js"></script>

<link href='${path }/js/packages/core/main.css' rel='stylesheet' />
<link href='${path }/js/packages/daygrid/main.css' rel='stylesheet' />
<script src='${path }/js/packages/core/locales/ko.js'></script>
<script src='${path }/js/packages/core/main.js'></script>
<script src='${path }/js/packages/daygrid/main.js'></script>
<script src='${path }/js/packages/interaction/main.js'></script>

<link rel='stylesheet' href='../css/savedogs_cal.css' />

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

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
	   	var calendar = new FullCalendar.Calendar(calendarEl, {
	   		plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
	   		locale : 'ko',
	   		selectable : true,
			header : {
				left : 'title', 
				center : '',
				right : 'today,prev,next' 
			},dateClick : function(info) { 
			},
			eventClick: function(info) { //이벤트 클릭
				info.jsEvent.preventDefault();
				var date = moment(info.event.start).format('YYYY-MM-DD');
				window.location.href = "../vwork/vlist.dog?date="+date; //dateformat 필요
			}, 
			events: 
				${json}
	   })
	   calendar.render();
	});
	
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
	.data {
		text-align: center;
	}
</style>
</head>
<body>
	<div class="maiv_div" style="width: 100%;">
		<div align="center" style="width: 100%; margin-left: 45%;">
			<table style="width: 100%;">
				<tr>
					<td id="tab1" class="tab" style="width: 50%;" align="center">
						<a href="javascript:disp_div('minfo','tab1')" style="color: gray; width: 50%;">봉사 캘린더</a>
					</td>
					<td id="tab2" class="tab" align="center"><a href="javascript:disp_div('oinfo','tab2')" style="color: gray; width: 50%;">작성한 봉사</a></td>
				</tr>
			</table>
		</div>
		<div id="minfo" class="info" style="width:100%;">
			<div class="cal_div" >
    			<div id="calendar" style="width: 800px; hegiht: 1000px;"></div>
   			</div>
		</div>
		<div id="oinfo" class="info" style="display:none; width:100%;">
			<c:if test="${empty writelist }">
				<h3>작성한 봉사가 없습니다.</h3>
			</c:if>
			<c:if test="${!empty writelist }">
			<h3>작성한 봉사리스트</h3>
			<hr>
			<table>
				<tr>
					<th>봉사날짜</th>
					<th>모집인원</th>
					<th>상태</th>
				</tr>
				<c:forEach items="${writelist }" var="list">
					<tr>
						<td class="data">
							<fmt:formatDate value="${list.vwork_date }" pattern="yyyy-MM-dd" var="day"/>
							<a href="sheltervworkDetail.dog?vwork_no=${list.vwork_no }">${day }</a>
						</td>
						<td class="data">${list.vwork_member }</td>
						<td class="data">
							${list.state>0?"모집중":"완료" }
						</td>
					</tr>
				</c:forEach>
			</table>
			</c:if>
		</div>
	</div>
</body>
</html>