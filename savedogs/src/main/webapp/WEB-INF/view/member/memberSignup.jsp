<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js?autoload=false"></script>
<script>
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("#member_pass2").keyup(function() {
			var pass=$("#member_pass").val();
			var pass2=$("#member_pass2").val();
			if(pass != "" || pass2 != "") {
				if(pass == pass2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});

	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                   //document.getElementById("member_daddress").value = extraAddr;
                } else {
                   //document.getElementById("member_daddress").value = '';
                }
                document.getElementById('member_postcode').value = data.zonecode;
                document.getElementById("member_address").value = addr + extraAddr;
                document.getElementById("member_daddress").focus();
            }
        }).open();
	}
</script>
</head>
<body>
	<div style="margin-left: 30%; width:40%;">
	<h2>일반 회원 가입</h2>
	<hr>
	<form:form modelAttribute="member" method="post" action="memberSignup.dog">
		<spring:hasBindErrors name="member">
			<font color="red">
				<%--globalErrors : error.reject(코드값) --%>
				<c:forEach items="${errors.globalErrors }" var="error">
					<spring:message code="${error.code }" />
				</c:forEach>
			</font>
		</spring:hasBindErrors>
		<table style="border-collapse:collapse;">
			<tr height="40px">
				<td>아이디</td>
				<td>
					<form:input path="member_id"/>
					<font color="red">
						<form:errors path="member_id" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>비밀번호</td>
				<td>
					<form:password path="member_pass" />
					<font color="red">
						<form:errors path="member_pass" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>비밀번호 확인</td>
				<td>
					<form:password path="member_pass2" />
					<div id="alert-success" style="font:red;">
						비밀번호가 일치합니다.
					</div>
					<div id="alert-danger" style="font:red;">
						비밀번호가 일치하지 않습니다.
					</div>
				</td>
			</tr>
			<tr height="40px">
				<td>이름</td>
				<td>
					<form:input path="member_name" />
					<font color="red">
						<form:errors path="member_name" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>생년월일</td>
				<td>
					<form:input path="member_birthday" />
					<font color="red">
						<form:errors path="member_birthday" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>우편번호</td>
				<td>
					<form:input path="member_postcode" style="width:20%"/>
					<input type="button" value="우편번호 찾기" onclick="openDaumZipAddress();">
				</td>
				<td>
					<font color="red">
						<form:errors path="member_postcode" />
					</font>
					
				</td>
			</tr>
			<tr height="40px">
				<td>주소</td>
				<td>
					<form:input path="member_address" />
					<font color="red">
						<form:errors path="member_address" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>상세주소</td>
				<td>
					<form:input path="member_daddress" />
					<font color="red">
						<form:errors path="member_daddress" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>전화번호</td>
				<td>
					<form:input path="member_tel" />
					<font color="red">
						<form:errors path="member_tel" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td>이메일</td>
				<td>
					<form:input path="member_email" />
					<font color="red">
						<form:errors path="member_email" />
					</font>
				</td>
			</tr>
			<tr height="40px">
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form:form>
	</div>
</body>
</html>
