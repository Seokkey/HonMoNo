<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="resources/js/jquery-2.1.1.js"></script>
		<style>
		</style>
	</head>
	<body>
		<jsp:include page="../memberLoginBox.jsp"/>
		<br/><br/>	
		<form action="#" method="post">
			<div id="joinForm">
				아이디 : <input type="email" name="id"/>	<br>
				이메일 형식으로 가입해주세요 <br>
				비밀 번호 : <input type="password" name="password"/>	<br>
				가입자 이름  : <input type = "text" name ="name"/>	<br>
				핸드폰 : <input type="number" name="phonenum"/>	<br>
				주소  : <input type="text" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="sample6_address" placeholder="주소">
						<input type="text" id="sample6_address2" placeholder="상세주소">
						<br>
				이메일 인증  <input type="number" name="emailchk"/> &nbsp; <button>확인</button><br>
				사업자 대표명 <input type="text" name="companyceo"/><br>
				업체 전화번호 <input type="number" name="companynum"/><br>
				사업자 번호 <input type="number" name="ceonum"/>			
			<br>
			<input type="submit" value="가입 완료"/>&nbsp;&nbsp;
			<input type="button" onclick="location.href='#'" value="취소"/>
			</div>
		</form>
	</body>
</html>