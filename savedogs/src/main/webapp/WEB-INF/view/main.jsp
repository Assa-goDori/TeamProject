<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>메인페이지 입니다.</title>
</head>
<body>
 <div class="row" style="height: 30%; width: 80%; margin-left: 10%;" align="center">
	<div style="width: 40%; height: 24%; float: left; background-color: #e1e1e1;" class="slider">
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
    <div style="width: 40%; height: 20%; float: right;">
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
  <div class="row" style="width: 80%; margin-left: 10%;" align="center">
 	 <div style="width: 40%; float: left; background-color: #e1e1e1;">
 	 <div align="left"><h3>관련 소식</h3></div>
    	<table style="border: 3px solid black; width: 95%;">
    	<c:forEach items="${newslist}" var="news">
    		<tr><th>${news}</th></tr>
    	</c:forEach>
    	</table>
    </div>
    <div style="width: 40%; height: 40%; float: right; margin-right: 5%;">
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
</body>
</html>
