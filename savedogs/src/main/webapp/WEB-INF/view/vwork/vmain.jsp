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


<script type="text/javascript">
	$(function(){
		$("#goo").click(function(){
			$.ajax({
				url : "shelterNames.dog?goo="+$("#goo").val(),
				type : "post",
				success : function(data){
					console.log(data)
		            var shelters = data;
		            var str = '';
		            $.each(shelters , function(i){
		                str += '<option>' + shelters[i].shelter_name +'</option>';
		     
		           });
		           $("#shelterList").append(str); 
		        },
				error : function(e){
					alert("서버오류:"+e.status);
				}
			})			
		})	
	})
</script>
		
<style type="text/css">
.main_div{
	text-align: center;
	margin-bottom: 50px;
}
.search_div{
	vertical-align: middle; 
	display: inline-block;
	background-color: #E4E4E4;
	text-align: center;
	width: 50%;
	height: 100px;
	margin-bottom: 50px;
}
.cal_div{
	vertical-align: middle; 
	display: inline-block;
}
select{
	font-size: 15px;
	padding: 7px;
	width: 235px;
}
.s_btn {
	background-color: #19CE60;
	color : white;
	font-size: 20px;
	
	border: 0;
	outline: 0;
	width: 80px;
	height: 60%;
	margin-left: 5px;
}
form{
	padding-top: 25px;
}
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
			${json}
   })
   calendar.render();
});
</script>
</head>
<body>

<div class="main_div">
<a style="font-size: 10px;">지역구 -> 보호소목록 안됨.. 보호소만 선택 -> 검색 가능</a><br>
	<div class="search_div">
	
		<form action="vmain.dog" method="post" name="f">
			<select>
				<option value="">전체</option>
				<c:forEach items="${list }" var="s">
					<option id="goo" value="${s.shelter_address }">${s.shelter_address }</option>
				</c:forEach>
			</select>
				
			<select id="shelterList" name="shelter_no">
				<option value="">전체</option>
				<c:forEach items="${list }" var="s">
					<option id="goo" value="${s.shelter_no }">${s.shelter_name }</option>
				</c:forEach>
			</select>
			<input class="s_btn" type="submit" value="검색" >
		</form>
		
	</div>
	<br>
   	<div class="cal_div" >
    	<div id="calendar" style="width: 800px; hegiht: 1000px;"></div>
   	</div>
</div>
</body>
</html>