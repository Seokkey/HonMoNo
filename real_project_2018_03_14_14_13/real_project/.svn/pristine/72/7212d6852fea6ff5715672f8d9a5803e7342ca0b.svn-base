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
        #drawing{
            border: 1px solid;
            height: 500px;
            width: 600px;
        }
	</style>
	
</head>
	<body>
		<br/><br/><br/>
		<jsp:include page="../memberLoginBox.jsp"/>
		<br/>
		
		<h1>도면 확인</h1>
		
		<table>
		    <tr>
		        <th>번호</th>
		        <td>1</td>
		    </tr>
		    
		    <tr>
		        <th>제목</th>
		        <td>도면 테스트</td>
		    </tr>
		    <tr>
		        <td colspan="2">
		            <div id="drawing">
		                도면이 여기에 그려짐
		            </div>
		        </td>
		    </tr>
		    <tr>
		        <th>날짜</th>
		        <td>2018-02-01 15:26</td>
		    </tr>
		</table>
        <input type="button" value="수정"/>
        <input type="button" value="삭제"/>
        <input id="toPlanDrawingListBtn" type="button" value="취소"/>
        <input id="toMainBtn" type="button" value="메인으로"/>
	</body>
	<script>
	    $("#toMainBtn").click(function() {
			location.href="./"
		});
	    
	    $("#toPlanDrawingListBtn").click(function() {
			location.href="./planDrawingList"
		});
	    
	</script>
</html>