<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style>
        #middle{
            
        }
	</style>
</head>
	<body>
		<br/><br/><br/>
		<jsp:include page="../memberLoginBox.jsp"/>
		<br/>
		<h1>게시판 카테고리 수정</h1>
		
		
    <span id="middle1">
        <a href="#">가구</a>
    </span>
    <span>
        <a href="#">수정</a>
    </span>
    <span>
        <a href="#">삭제</a>
    </span><br/>
		
	└<span id="small11">시몬스</span>
    <span>
        <a href="#">수정</a>
    </span>
    <span>
        <a href="#">삭제</a>
    </span><br/>
    	└<span id="small12">에이스</span>
    <span>
        <a href="#">수정</a>
    </span>
    <span>
        <a href="#">삭제</a>
    </span><br/>
    
    <span id="middle2">
        <a href="#">가전</a>
    </span>
    <span>
        <a href="#">수정</a>
    </span>
    <span>
        <a href="#">삭제</a>
    </span><br/>
		
	└<span id="small21">삼성</span>
    <span>
        <a href="#">수정</a>
    </span>
    <span>
        <a href="#">삭제</a>
    </span><br/>
    	└<span id="small22">엘지</span>
    <span>
        <a href="#">수정</a>
    </span>
    <span>
        <a href="#">삭제</a>
    </span><br/>
    
    <br/><br/>
    <input id="toMainBtn" type="button" value="메인으로"/>
    <input type="button" value="중분류 추가"/>
    <input type="button" value="소분류 추가"/>
	</body>
	<script>
	    $("#toMainBtn").click(function() {
			location.href="./"
		});
        
	    
	    
	</script>
</html>