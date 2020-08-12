<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해독 : 봉사 메인 </title>
<!-- calendar 관련 -->
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<link href='${path }/js/packages/core/main.css' rel='stylesheet' />
<link href='${path }/js/packages/daygrid/main.css' rel='stylesheet' />
<script src='${path }/js/packages/core/locales/ko.js'></script>
<script src='${path }/js/packages/core/main.js'></script>
<script src='${path }/js/packages/daygrid/main.js'></script>
<script src='${path }/js/packages/interaction/main.js'></script>

<style type="text/css">
</style>
<script>
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
			window.location.href = "vjoin.dog?date="+info.event.start; //dateformat 필요
		}, 
		select: function(info) { //클릭
			if(${smem != null}){
				info.jsEvent.preventDefault();
	      	 	var op = "width=800, height=700, left=500, top=150";
	      	 	open("vwrite.dog?date="+info.startStr,"",op) <%-- +"&id="+document.f.id.value --%>	
			}		    
	    },
		events: 
			[{"title":"봉사 신청","start":"2020-08-16","color":"#A2BEE0"}]
   })
   calendar.render();
});
</script>
</head>
<body>

<form name="f" style="text-align: center;">
   <div class="vmain" style="vertical-align: middle; display: inline-block;">
      <div id="calendar" style="width: 800px; hegiht: 1000px;"></div>
   </div>
</form>
</body>
</html>