<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <style>
        
        #css {
        		margin: 30px 10px;
        		position: relative;
        		top: 119px;
        		left:27%;
        		width: 700px;
        	}
        </style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "./find_pw",
				type : "POST",
				data : {
					m_id : $("#mId").val(),
				},
				success : function(result) {
					alert(result);
					history.go(-1);
				},
			})
		});
	})
</script>
<title>비밀번호 찾기</title>
</head>
<body>
	<jsp:include page="../memberLoginBox.jsp"/>
	<br/><br/><br/>
	<div class="w3-content w3-container w3-margin-top" id="css">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				귀하의 아이디(이메일)을 입력해주세요.
				<p>
					<label>ID</label>
					<input class="w3-input" type="text" id="mId" name="m_id" required>
				</p>
				<!-- <p>
					<label>Email</label>
					<input class="w3-input" type="text" id="email" name="email" required>
				</p> -->
				<p class="w3-center">
					<button type="button" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">찾기</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소하기</button>
				</p>
			</div>
		</div>
	</div>
</body>
</html>
