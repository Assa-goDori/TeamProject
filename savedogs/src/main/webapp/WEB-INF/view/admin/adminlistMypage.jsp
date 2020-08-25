<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원목록 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel='stylesheet' href='../css/savedogs_main.css' />
<script>
	function changeauth(id, auth) {
		$.ajax({
			url : "../ajax/changeauth.dog",
			type : "POST",
			data : "member_id="+ id + "&member_auth="+auth,
			success : function(data) {
				alert("설정 변경 완료")
				document.location.reload();
			},
			error : function(e) {
				alert("ajax 오류");
			}
		})
	}
</script>
<style>
	.data {
		text-align:center;
	}
</style>
</head>
<body>
	<div class="main_div" style="width: 100%;">
		<h3>일반회원목록</h3>
		<hr>
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>핸드폰</th>
				<th>주소</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>관리</th>
			</tr>
			<c:forEach items="${memberlist }" var="list">
				<tr>
					<td class="data">
						${list.member_id }
					</td>
					<td class="data">
						${list.member_name }
					</td>
					<td class="data">
						${list.member_tel }
					</td>
					<td class="data">
						${list.member_postcode} ${list.member_address} ${list.member_daddress}
					</td>
					<td class="data">
						<fmt:formatDate value="${list.member_birthday }" pattern="yyyy.MM.dd" var="day" />
						${day }
					</td>
					<td class="data">
						${list.member_email }
					</td>
					<td class="data">
						<a href="../member/updateMember.dog?type=1&id=${list.member_id }&update=1&member_type=0">수정</a>
						<a href="#">탈퇴</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<hr>
		<h3>보호소 관리자 목록</h3>
		<table>
			<tr>
				<th>아이디</th>
				<th>핸드폰</th>
				<th>보호소번호</th>
				<th>이메일</th>
				<th>첨부서류</th>
				<th>가입여부</th>
				<th>관리</th>
			</tr>
			<c:forEach items="${smemberlist }" var="slist">
				<tr>
					<td class="data">
						${slist.member_id }
					</td>
					<td class="data">
						${slist.member_tel }
					</td>
					<td class="data">
						${slist.shelter_no}
					</td>
					<td class="data">
						${slist.member_email }
					</td>
					<td class="data">
						<a href="../member/img/${slist.file1 }">${slist.file1 }</a>
					</td>
					<td class="data">
						<c:if test="${slist.member_auth == 1 }">
							<a href="javascript:changeauth('${slist.member_id }', 0)">승인</a>
							<!-- <a href="javascript:changeauth('${slist.member_id }', 1)">거부</a>  -->
						</c:if>
						<c:if test="${slist.member_auth == 0 }">
							승인완료
							<!-- <a href="javascript:changeauth('${slist.member_id }', 0)">승인</a>  -->
							<!-- <a href="javascript:changeauth('${slist.member_id }', 1)">거부</a>  -->
						</c:if>
					</td>
					<td class="data">
						<a href="../member/updateMember.dog?type=1&id=${slist.member_id }&update=2&member_type=1">수정</a>
						<a href="#">탈퇴</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>