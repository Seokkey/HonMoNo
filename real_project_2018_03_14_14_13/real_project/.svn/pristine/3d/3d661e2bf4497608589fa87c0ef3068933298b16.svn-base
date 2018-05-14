<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style>
		table, td, th{
            border: 1px solid;
            padding: 5px;
            border-collapse: collapse;
            margin: 8px;
            text-align: center;
        }
	</style>
	
</head>
	<body>
		<br/><br/><br/>
		<jsp:include page="../memberLoginBox.jsp"/>
		<br/>
		
		<h1>도면 리스트</h1>
		
		<table>
		    <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>날짜</th>
		    </tr>
		    <tr>
		        <td>1</td>
		        <td>
		            <a href="#">도면 테스트</a>
                </td>
		        <td>2018-02-01</td>
		    </tr>
		</table>
		<input id="drawingBtn" type="button" value="도면 그리기"/>
		<input id="toMainBtn" type="button" value="메인으로"/>
	</body>
	<script type="text/javascript">
    $("#toMainBtn").click(function() {
		location.href="./"
	});
    
    $("#drawingBtn").click(function() {
		location.href="./planDrawingWrite"
	});
    
	</script>
</html>

