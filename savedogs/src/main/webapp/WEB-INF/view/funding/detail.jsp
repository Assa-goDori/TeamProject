<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부상세</title>

<!-- <link rel='stylesheet' href='../css/savedogs_main.css' /> -->
<script type="text/javascript">


	   function win_open(page) {
	   var op = "width=500, height=350, left=50,top=150";
	   open(page+".dog","",op);
}
</script>
</head>
<body>

<div style="margin-left: 25%; width:60%;">
 <form:form modelAttribute="funding" method="post" action="delete.dog">
<input type="hidden" value="${param.fund_no}" name="fund_no">
 <table class="w3-table" style="width:1000px">
       <!--  <form action="후원하기.dog=?fund_no=${f.fund_no}" method="POST"> -->
        <tr><td rowspan="4"><img src="${picture}" style="width:150%;" alt="후원 배너 사진"></td>
          <td colspan='2'>"${funding_subject}"</td></tr>
            <tr><td>"${sheltername}"</td></tr>
            <tr><td>달력 아이콘 : 1일 남음</td></tr>
            <td>게이지바</td>
            <tr><td>&nbsp;</tr><td>
             <c:if test="${!empty sessionScope.loginmem}"><h6><a href="fundingapply.dog?id=${sessionScope.loginmem.member_id}"></a></h6>
             <tr><td align="center"><h5><input type="button" value="후원하기" onclick="win_open('fundingapply')"></h5></td></tr>
             </c:if>
             <c:if test="${!empty sessionScope.loginsmem}"><h6><a href="fregForm.dog?id=${sessionScope.loginsmem.member_id}"></a></h6>
             <tr><td align="right"><h5><input type="button" value="수정하기" onclick="location.href='fregupdateForm.dog?id=${param.fund_no}'"></h5></td>
             <td><h5><input type="submit" value="삭제하기"></h5></td></tr>
             </c:if>

        </table>    
                </form:form>
        
        <hr>
        <!-- 댓글 작성칸 -->
       
    <form id="commentForm" name="commentForm" method="post">
        <div>
            <div>
      <span><strong><img src="smile.png" width="10px" height="10px" />응원댓글 작성하기</strong></span> <span id="cCnt"></span>
       </div>
       <div>
        <table class="table">                    
        <tr>
          <td>
           <textarea style="width: 750px" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>            
            <td>
              <h5><a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a></h5>
               </td>
                 </td>
                 </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="${result.code }" />        
    </form>

<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
        <!-- 댓글 리스트 -->
     <script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/board/addComment.do'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/board/commentList.do'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    html += data[i].comment + "<tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
 
</script>
 </div>
</body>
</html>
