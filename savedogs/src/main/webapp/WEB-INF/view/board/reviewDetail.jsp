<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구해독 : 입양 후기</title>
<link rel='stylesheet' href='../css/savedogs_main.css' />
<style type="text/css">
.b_th{
	width: 200px;
}

</style>
<script>
var board_no = '${board.board_no}'; 

//페이지 로딩시 댓글 목록 출력
$(document).ready(function(){
  replyList();  
});

//댓글 목록 
function replyList(){
  $.ajax({
      url : "replyList.dog",
      type : 'POST',
      data : {'board_no':board_no},
      success : function(data){
      	$("#replys").html(data);
      },
		error : function(e) {
			alert("서버오류: " + e.status);
		}
	})
}

//댓글 등록
$(function() {
  $("[name=replyinsert_btn]").on("click", function() {
  	var insertData = $('[name=replyf]').serialize(); 
      replyInsert(insertData); 
  })
});
  
//댓글 등록
function replyInsert(insertData){
  $.ajax({
      url : "replyInsert.dog",
      type : 'POST',
      data : insertData,
      success : function(data){
    	  replyList(); //댓글 작성 후 댓글 목록 reload
    	  $('[name=content]').val('');
      }
  });
}

//댓글 삭제 
function replyDelete(rno){
  $.ajax({
      url : "replyDelete.dog?rno="+rno,
      type : 'POST',
      success : function(data){
          replyList(); 
  }});
}

</script>
<style type="text/css">
.reply_div{
	padding-top: 50px;
}
</style>
</head>
<body>
<div class="main_div">
<h2>입양 후기</h2>
<hr>
	<table class="b_table">
		<tr><th class="b_th">제목</th><td class="b_td">${board.subject }</td></tr>
		<tr><th class="b_th">작성자</th><td class="b_td">${board.member_id }</td></tr>
		<tr><th class="b_th">작성일</th><td class="b_td"><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd HH:mm"/></td></tr>
		<tr><th class="b_th">내용</th><td class="b_td"><textarea rows="10" cols="30" class="txta" readonly="readonly">${board.content }</textarea></td></tr>
	</table>

<div class="reply_div" >
	<hr>
	<h4>댓글</h4>
	
	<div class="replys" id="replys"></div>
	<div class="replywrite" >
		
		<!-- action="replyInsert.dog"  -->
	<form name="replyf" onsubmit="replyInsert($('[name=replyf]').serialize()); return false;">
			<input type="hidden" name="board_no" value="${board.board_no }">
			<input type="hidden" name="member_id" value="${sessionScope.loginmem.member_id}">
			<input type="text" name="content" class="content_txt">
			<input type="button" value="등록" name="replyinsert_btn" class="s_btn">			
	</form>			
	</div>
</div>

<div class="btn_div">
	<input type="button" value="목록" class="s_btn" onclick="location.href='noticeList.dog?type=${board.type}'">
	<c:if test="${sessionScope.loginmem.member_id == board.member_id }">
		<input type="button" value="수정" class="g_btn" onclick="location.href='noticeUpdate.dog?no=${board.board_no}'">
		<input type="button" value="삭제" class="g_btn" onclick="location.href='noticeDelete.dog?no=${board.board_no}'">
	</c:if>
</div>

</div>
</body>
</html>