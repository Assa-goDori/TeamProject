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
            <div class="item">
                <div class="slider-img"> <img src="" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 pull-right">
                            <div class="slider-captions">
                                <h1 class="slider-title">I Am John Deo</h1>
                                <h3>Your Life Coach</h3>
                                <p class="hidden-sm hidden-xs hidden-md">Close the gap between where you are today & where you want to be...</p>
                                <a href="#" class="btn btn-primary  hidden-xs">Get Template</a>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"> <img src="" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 pull-right">
                             <div class="slider-captions">
                                <h1 class="slider-title">Design The Life You Want</h1>
                                <h3>Read My Latest Book</h3>
                                <p class="hidden-sm hidden-xs hidden-md">Enduring, energetic love isn't something you discover of good fortune — it's something you make.</p>
                                <a href="#" class="btn btn-primary hidden-xs">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"> <img src="" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 pull-right">
                            <div class="slider-captions">
                                <h1 class="slider-title">Life Coach Website Template</h1>
                                <h3>Free Website Templates</h3>
                                <p class="hidden-sm hidden-xs hidden-md">Nunc utnisi sapivamus auctor hendrerit feliseu interlente squesed aliquet velitin viverraorci.</p>
                                <a href="#" class="btn btn-primary  hidden-xs">Download Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
    	<caption>구현전 임시 크롤링 자리</caption>
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
