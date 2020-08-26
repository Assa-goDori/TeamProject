<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부상세</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<link rel='stylesheet' href='../css/savedogs_main.css' /> 
<script>


function win_open(page) {
var op = "width=800, height=700, left=500, top=150";
open(page+".dog?fund_no=${param.fund_no}","",op);

}


var bno = '${detail.bno}'; //게시글 번호
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : '/comment/list',
        type : 'get',
        data : {'bno':bno},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer;
                a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(cno){
    $.ajax({
        url : '/comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>
</head>
<body>

<div style="margin-left: 25%; width:80%;">
 <form:form modelAttribute="funding" method="post" action="delete.dog">
<input type="hidden" value="${param.fund_no}" name="fund_no">
 <table class="w3-table" style="width:1000px; margin-right:130px;">
       <!--  <form action="후원하기.dog=?fund_no=${f.fund_no}" method="POST"> -->
        <tr><td rowspan="7"><img src="img/${funding.fund_pic}" style="width:250px; height=:320px" alt="기부 배너 사진"></td></tr>
          <td colspan='1'><h3><${funding.fund_subject}></h3></td>
            <tr><td><i class="fa fa-building fa-fw w3-margin-right w3-large w3-text-teal"></i>"${funding.sheltername}"</td></tr>
            <tr><td><i class="fa fa-calendar fa-fw w3-margin-right w3-large w3-text-teal"></i>기부 기간<fmt:formatDate value="${funding.start_date}" pattern="yyyy.MM.dd" var="startdate" />
             <fmt:formatDate value="${funding.end_date}" pattern="yyyy.MM.dd" var="enddate" />
            ${startdate}&nbsp;-&nbsp;${enddate}</td></tr>
            <tr><td><i class="fa fa-calendar fa-fw w3-margin-right w3-large w3-text-teal"></i>${funding.restdate}일 남음</td></tr>
            <tr><td><i class="fa fa-money fa-fw w3-margin-right w3-large w3-text-teal"></i>목표금액 : ${funding.fund_count}원</td></tr>
            <td width="50%">
            <input type="button" readonly="readonly" style="width: ${funding.complete}%;  background-color: lightgreen; border-radius: 20px; border: none;" " ></td>
            <td width="8%" align="center">${funding.complete}%</td>
            <tr><td>&nbsp;</tr><td>
             </table> 
             <c:if test="${!empty sessionScope.loginmem}"><h6><a href="fundingapply.dog?id=${sessionScope.loginmem.member_id}"></a></h6>
             <tr><td><h5 style="text-align: center; margin-right:250px"><input type="button" class="s_btn" value="기부하기" onclick="win_open('fundingapply')"></h5></td></tr>
             </c:if>
             <c:if test="${!empty sessionScope.loginsmem && sessionScope.loginsmem.member_id.equals(funding.member_id)}"><h6><a href="fregForm.dog?id=${sessionScope.loginsmem.member_id}"></a></h6>
             <tr><td align="right"><h5><input type="button" class="s_btn" value="수정하기" onclick="location.href='fregupdateForm.dog?fund_no=${param.fund_no}'"></h5></td>
             <!-- <td><h5><input type="submit" value="삭제하기"></h5></td></tr>-->
             </c:if>
          
                </form:form>
        <!-- 댓글 -->
        <hr>
   <div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="bno" value="${detail.bno}"/>
               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    <div class="container">
        <div class="commentList"></div>
    </div>
</div>
 </div>
</body>
</html>
