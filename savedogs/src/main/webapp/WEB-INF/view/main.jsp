<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인페이지 입니다.</title>
<link rel='stylesheet' href='css/savedogs_main.css' />
<style type="text/css">
.row{
	width: 100%; 
	display: inline-block;
}
.g_div{
	height: 600px; 
	width: 45%;
	background-color: #e1e1e1; 
	display: inline-block;
	vertical-align : top ;
	padding: 20px 20px;
	margin: 20px;
}
.news_th{
	width: 100%;
	text-align: left;
}
</style>
</head>
<body>
<div class="main_div">
 <div class="row" >
	<div class="g_div">
	<div align="center"><h3>실시간 유기견들</h3></div>
        <div class="owl-carousel owl-one owl-theme" style="height: 15%;">
            <c:forEach begin="0" end="2" var="m">
            	<div class="item">
                	<table>
                		<tr>
                			<td>
                			<div align="center">
                				<img src="${picturelist[3*m]}" style="width: 200px; height: 240px;">
                			</div>
                			</td>
                			
                			<td>
                			<div align="center">
                				<img src="${picturelist[3*m+1]}" style="width: 200px; height: 240px;">
                			</div>
                			</td>
                			
                			<td>
                			<div align="center">
                				<img src="${picturelist[3*m+2]}" style="width: 200px; height: 240px;">
                			</div>
                			</td>
                		</tr>
                		<tr>
                			<td>
                			<div align="center">
                				<h3>지역 :${orglist[3*m]} <br>
                				종류 :${kindlist[3*m]} <br>
                				${sexlist[3*m]}/${agelist[3*m]}</h3>
                			</div>
                			</td><td>
                			<div align="center">
                				<h3>지역 :${orglist[3*m+1]} <br>
                				종류 :${kindlist[3*m+1]} <br>
                				${sexlist[3*m+1]}/${agelist[3*m+1]}</h3>
                			</div>
                			</td><td>
                			<div align="center">
                				<h3>지역 :${orglist[3*m+2]} <br>
                				종류 :${kindlist[3*m+2]} <br>
                				${sexlist[3*m+2]}/${agelist[3*m+2]}</h3>
                			</div>
                			</td>
                		</tr>
                	</table>
                	
				</div>
            </c:forEach>
        </div>
    </div>
      <!-- /.slider -->
    <div class="g_div">
    	<table style="border: 3px solid black; width: 100%;">
    	<caption>구현전 임시 공지사항 자리</caption>
    	<tr><th>번호</th><th>글제목</th></tr>
    	<tr><td>1</td><td>첫번째글</td></tr>
    	<tr><td>2</td><td>두번째글</td></tr>
    	<tr><td>3</td><td>세번째글</td></tr>
    	<tr><td>4</td><td>네번째글</td></tr>
    	<tr><td>5</td><td>다섯번째글</td></tr>
    	</table>
    </div>
  </div>
  <br>
  <div class="row">
 	 <div class="g_div">
 	 <div align="center"><h3>관련 소식</h3></div>
    	<table style="border: 3px solid black; width: 95%;">
    	<c:forEach items="${newslist}" var="news">
    		<tr><th class="news_th">${news}</th></tr>
    	</c:forEach>
    	</table>
    </div>
    <div class="g_div">
    	<table style="border: 3px solid black; width: 100%;">
    	<caption>구현전 임시 기부 자리</caption>    	
    	<tr><td>1</td><td>첫번째글</td></tr>
    	<tr><td>2</td><td>두번째글</td></tr>
    	<tr><td>3</td><td>세번째글</td></tr>
    	<tr><td>4</td><td>네번째글</td></tr>
    	<tr><td>5</td><td>다섯번째글</td></tr>
    	</table>
    </div>
  </div>
 </div>	
</body>
</html>
