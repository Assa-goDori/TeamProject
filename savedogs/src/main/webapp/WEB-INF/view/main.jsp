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
 <div class="row">
	<div style="width: 40%; height: 40%; float: left; margin-left: 5%;" class="slider">
        <div class="owl-carousel owl-one owl-theme">
            <c:forEach items="${imglist}" var="im">
            	<div class="item">
                	<div class="slider-img" style="margin: 30%;"> 
                		<img src="${im}" style="width: 200px; height: 240px;">
                	</div>
            	</div>
            </c:forEach>
        </div>
    </div>
      <!-- /.slider -->
    <div style="width: 40%; height: 40%; float: right; margin-right: 5%;">
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
  <div class="row">
 	 <div style="width: 40%; height: 40%; float: left; margin-left: 5%; ">
    	<table style="border: 3px solid black; width: 100%;">
    	<caption>유기견 관련 뉴스</caption>
    	<c:forEach items="${list}" var="news">
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
