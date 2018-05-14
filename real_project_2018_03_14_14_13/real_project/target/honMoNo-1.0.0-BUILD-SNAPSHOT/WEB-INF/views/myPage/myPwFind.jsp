<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style>
		
	</style>
</head>
	<body>
		<br/><br/><br/>
		<jsp:include page="../memberLoginBox.jsp"/>
		<br/>
		
		<h1>비밀번호 찾기</h1>
		<br/>
		비밀번호를 찾고자 하는 아이디를 입력해 주세요.
		<br/><br/><br/>
		<input type="text" name="loginId"/>
		<br/><br/>
		<input type="button" value="다음"/>
	</body>
	<script>
		
	</script>
</html>
