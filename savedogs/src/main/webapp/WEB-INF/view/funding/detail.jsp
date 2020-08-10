<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 펀딩 리스트에서 항목 눌렀을때 나올 페이지(펀딩상세보기), 모달창 나와야함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript">
$(document).ready(function(){
  $("#funding").show(); //회원정보는 보이도록 //id가 minfo인 태그를 보여주기(화면뜰때 바로)
  $("#shopping").hide(); //주문내역은 안보이도록
  $(".saleLine").each(function() { //클래스 속성이 saleline인 것들 안보이게 하기
	  $(this).hide();
})
 $("#tab1").addClass("select"); //tab1이라는 id 안에 select속성 추가하기 =>34번줄
 })
 function disp_div(id,tab){
	  $(".info").each(function() { //.info 숨기기(클래스 속성이 info)
		  $(this).hide();
	  })
	  
	  $(".tab").each(function() {
		  $(this).removeClass("select");
	  })
	  $("#"+id).show();
	  $("#"+tab).addClass("select");
 }
      function list_disp(id){
      $("#"+id).toggle(); //보였다 안보였다 
 }
</script>
<style type="text/css">
 .select {
    padding:3px;
    background-color: #0000ff;
 }
 .select>a { color : #ffffff;  <%--select 속성안에 a태그 --%>
             text-decoration: none;
             font-weight:bold;
 
  }
  </style>
</head>
<table>
   <tr><td id="tab1" class="tab">
   <a href="javascript:disp_div('minfo','tab1')">펀딩</a></td>
     <c:if test="${param.id != 'admin'}">
    <td id="tab2" class="tab">
   <a href="javascript:disp_div('oinfo','tab2')">후원 쇼핑몰</a></td>
   </c:if></tr></table><hr>
 <%-- oinfo : 주문정보 출력 --%>
 <div id="oinfo" class="info" style="display:none; width:100%;">
 <table>
 <tr><th>주문번호</th><th>주문일자</th><th>총 주문 금액</th></tr>
 <c:forEach items="${salelist}" var="sale" varStatus="stat">
 <tr><td align="center">
 <a href="javascript:list_disp('saleLine${stat.index}')">
  ${sale.saleid}</a></td>
  <td align="center"><fmt:formatDate value="${sale.saledate}" pattern="yyyy-MM-dd" />
  </td><td align="right"><fmt:formatNumber value="${sale.total}" pattern="#,###" />원</td></tr>
  <tr id="saleLine${stat.index}" class="saleLine">
  <td colspan="3" align="center">
  <table>
  <tr><th width="25%">상품명</th><th width="25%">상품가격</th>
  <th width="25%">구매수량</th><th width="25%">상품총액</th></tr>
  <c:forEach items="${sale.itemList}" var="saleItem">
   <tr><td class="title">
     ${saleItem.item.name}</td>
     <td><fmt:formatNumber value="${saleItem.item.price}" pattern="#,###" />원</td>
     <td>${saleItem.quantity}개</td>
     <td><fmt:formatNumber value="${saleItem.quantity * saleItem.item.price}" pattern="#,###" />원</td></tr>
  </c:forEach>
  </table>
  </td></tr>
  </c:forEach> 
 </table>
 </div>
 <%-- minfo : 회원정보출력 --%>
   <div id="minfo" class="info">
   <table>
    <tr><td>아이디</td><td>${user.userid}</td></tr>
    <tr><td>이름</td><td>${user.username}</td></tr>
    <tr><td>우편번호</td><td>${user.postcode}</td></tr>
    <tr><td>전화번호</td><td>${user.phoneno}</td></tr>
    <tr><td>주소</td><td>${user.address}</td></tr>
    <tr><td>이메일</td><td>${user.email}</td></tr>
    <tr><td>생년월일</td><td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd" /></td></tr>
    </table><br>
    <a href = "update.shop?id=${user.userid}">[회원정보수정]</a>&nbsp;
     <c:if test="${loginUser.userid !='admin'}">
     <a href = "delete.shop?id=${user.userid}">[회원탈퇴]</a>&nbsp;
     </c:if>
     <c:if test="${loginUser.userid =='admin'}">
     <a href = "../admin/list.shop">[회원목록]</a>&nbsp;
     </c:if>
     </div><br>
</body>
</html>