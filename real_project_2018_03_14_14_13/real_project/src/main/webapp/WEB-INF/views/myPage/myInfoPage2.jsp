<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>마이페이지</title>
</head>
<body>
	<jsp:include page="../memberLoginBox.jsp"/>
	<br/><br/>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>마이 페이지</h3>
			</div>
			<div>
				<form id="myForm" action="./update_mypage?m_rating=2" method="post">
					<p>
						<label>아이디</label> 
						<input class="w3-input" type="text" id="m_id" name="m_id" readonly value="${member.m_id}"> 
					</p>
					<p>
						<label>닉네임</label> 
						<input class="w3-input" type="text" id="m_nick" name="m_nick" readonly value="${member.m_nick}"> 
					</p>
					<p>
						<label>사업자 이름</label> 
						<input class="w3-input" type="text" id="m_name" name="m_name" value="${member.m_name}" required> 
					</p>
					<p>
						<label>매장 주소</label> 
						<input class="w3-input" type="text" id="m_address1" name="m_address1" value="${member.m_address1}" required>
						<input class="w3-input" type="text" id="m_address2" name="m_address2" value="${member.m_address2}" required>
						<input class="w3-input" type="text" id="m_address3" name="m_address3" value="${member.m_address3}" required>  
					</p>
					<p>
						<label>전화번호</label> 
						<input class="w3-input" type="text" id="m_phone" name="m_phone" value="${member.m_phone}" required> 
					</p>
					<p>
						<label>사업자 등록번호</label> 
						<input class="w3-input" type="text" id="ms_conum" name="ms_conum" value="${member.ms_conum}" required> 
					</p>
					<p>
						<label>대표자 이름</label> 
						<input class="w3-input" type="text" id="ms_ceoname" name="ms_ceoname" value="${member.ms_ceoname}" required> 
					</p>
					<p>
						<label>매장 이름</label> 
						<input class="w3-input" type="text" id="ms_shopname" name="ms_shopname" value="${member.ms_shopname}" required> 
					</p>
					<p>
						<label>매장 연락처</label> 
						<input class="w3-input" type="text" id="ms_phone" name="ms_phone" value="${member.ms_phone}" required> 
					</p>
					<p>
						<label>브랜드</label> 
						<input class="w3-input" type="text" id="ms_brand" name="ms_brand" value="${member.ms_brand}" required> 
					</p>
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보 변경</button>
					</p>
				</form>
				<br />
				<form id="pwForm" action="./update_pw" method="post">	
					<input type="hidden" name="m_id" value="${ member.m_id }">
					<p>
						<label>비밀번호</label>
						<input class="w3-input" id="old_pw" name="old_pw" type="password" required>
					</p>
					<p>
						<label>새로운 비밀번호</label> 
						<input class="w3-input" id="mPass" name="m_pass" type="password" required>
					</p>
					<p>
						<label>새로운 비밀번호 확인</label>
						<input class="w3-input" id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
						<button type="button" onclick=javascript:location.href="./" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">뒤로가기</button>
					</p>
				</form>
				<form id ="wdForm" action="./memberDel" method="post">
					<input type="hidden" name="m_nick" readonly value="${sessionScope.loginNick}">
					<p>
						<label>비밀번호</label>
						<input class="w3-input" type="password" name="m_pass" required>
						
					</p>
					<p class="w3-center">
						<input type="button" id="delBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" value="탈퇴하기"/>
					</p>	
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	
	$("#delBtn").click(function(){
		if(confirm("회원탈퇴가 진행됩니다. 수락하시겠습니까?")==true){
			$("#wdForm").submit();
		}
	});
	
	$(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
		
		if($("#pwForm").submit(function(){
			if($("#mPass").val() != $("#pw2").val()){
				console.log($("#mPass").val());
				console.log($("#pw2").val());
				
				alert("비밀번호가 다릅니다.");
				$("#mPass").val("").focus();
				$("#pw2").val("");
				return false;
				
			}else if ($("#mPass").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#mPass").val("").focus();
				return false;
			}else if($.trim($("#mPass").val()) != $("#mPass").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}else{
				return true;
			}
		}));
	});
</script>
</html>
