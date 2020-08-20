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
                				<img src="${info[3*m].picture}" style="width: 200px; height: 240px;">
                			</div>
                			</td>
                			
                			<td>
                			<div align="center">
                				<img src="${info[3*m+1].picture}" style="width: 200px; height: 240px;">
                			</div>
                			</td>
                			
                			<td>
                			<div align="center">
                				<img src="${info[3*m+2].picture}" style="width: 200px; height: 240px;">
                			</div>
                			</td>
                		</tr>
                		<tr>
                			<td>
                			<div align="center">
                				<h3>지역 :${info[3*m].orgNm} <br>
                				종류 :${info[3*m].kindCd} <br>
                				${info[3*m].sexCd}/${info[3*m].age}</h3>
                			</div>
                			</td><td>
                			<div align="center">
                				<h3>지역 :${info[3*m+1].orgNm} <br>
                				종류 :${info[3*m+1].kindCd} <br>
                				${info[3*m+1].sexCd}/${info[3*m+1].age}</h3>
                			</div>
                			</td><td>
                			<div align="center">
                				<h3>지역 :${info[3*m+2].orgNm} <br>
                				종류 :${info[3*m+2].kindCd} <br>
                				${info[3*m+2].sexCd}/${info[3*m+2].age}</h3>
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
    <div align="center"><h3>공지사항</h3></div><br>
    	<c:forEach var="notice" items="${notice}" varStatus="stat">
	    	<div align="left"><li>${notice.subject}</li></div>
	    </c:forEach>
	    <br>
	    <div align="center"><h3>베스트 상품</h3></div>
	    <div class="row">
	    	<c:forEach begin="0" end="2" var="m">
 	 			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30" style="width: 31%; height: 260px; margin-left: 1%; margin-right:1%;  border: 1px solid black; background-color: #f1f3f4;" >
 	 				<div class="coach-service-block">
 	 					<div style="height: 150px; border: 1px solid black;" > 
 	 						<h5>상품 이미지</h5>
 	 					</div>
 	 					
 	 					<div style="height: 100px; border: 1px solid black;">
 	 						<h5>상품명</h5>
 	 						<h5>판매량</h5>
 	 					</div>
 	 				</div>
 	 			</div>
    		</c:forEach>	
	    </div>
    </div>
  </div>
  <br>
  <div class="row">
 	 <div class="g_div" style="background-color: white;">
 	 	<div align="center">
 	 		<h3>관련 소식</h3>
 	 	</div>
 	 	<div class="row" style="height: 420px;">
 	 		<c:forEach begin="0" end="5" var="m">
 	 			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30" style="width: 31%; height: 200px; margin-left: 1%; margin-right:1%;  border: 1px solid black; background-color: #f1f3f4;" >
 	 				<div class="coach-service-block">
 	 					<div style="height: 90px; width: 90px; margin-left: 40px; margin-top: 10px;" > 
 	 						${newsimg[m]}
 	 					</div>
 	 					
 	 					<div style="height: 100px;">
 	 						<h5>${newstitle[m]}</h5>
 	 					</div>
 	 				</div>
 	 			</div>
    		</c:forEach>	
		</div>
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
