<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원 쇼핑몰</title>
</head>
<body>
<div style="width: 80%; margin-left: 10%;" >
	<div align="center">
		<table style="width: 80%;">
			<tr>
				<td style="width: 50%;" align="center">
					<a href="../funding/list.dog">기부</a>
				</td>
				<td align="center">후원쇼핑몰</td>
			</tr>
		</table>
	</div>
	<hr>
	<div align="center">
		<h5 style="color: #8ac7e9">작은 후원으로 유기견들에게 큰 희망을!</h5>
		<h5 style="color: #8ac7e9">수익금 전액은 유기견 보호소 후원에 사용됩니다.</h5>
	</div>
	<br>
	<div align="right">
		<form action="../cart/cartView.dog">
			<input type="submit" value="장바구니">
		</form>
	</div>
	<br>
	<div class="row">
	 	<c:forEach items="${itemlist}" var="item">
	 		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" style="width: 30%; margin-left: 10%; margin-right: 10%;">
           		<div class="post-block">
            	   	<!-- post block -->
            		<div class="post-img">
            	    	<a href="#" class="imghover">
            	        	<img src="img/${item.item_picture}">
            	        </a>
            	    </div>
            	</div>
            	<div class="post-content">
            	   	<div class="meta">
            	   		<a href="#" class="meta-categories text-primary">${item.item_name}</a>
            	   	</div>
            	   	<h3 class="post-title"><a href="#" class="title">${item.item_price}</a></h3>
            	</div>
			</div>
		</c:forEach>
	</div>
	<div align="right"><a href="insert.dog">상품등록</a></div>
</div>
</body>
</html>