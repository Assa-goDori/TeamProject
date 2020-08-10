<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
         left : 'title', //년,월
         center : '',
         right : 'today,prev,next' //오늘, 전월, 다음월
      },
      dateClick : function(info) { //빈 날짜 선택
         var dateStr = prompt(info.dateStr);
         var date = new Date(info.dateStr);
         
      },
	  	events: 
	  		[{"title":"봉사 신청","start":"2020-08-16","color":"#A2BEE0"}],eventLimit: true //event가 많으면 more로 표시
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