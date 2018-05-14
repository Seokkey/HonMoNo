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
	<body><!--deliveryList -> adminDeliveryList -->
		<br/><br/><br/>
		<jsp:include page="../memberLoginBox.jsp"/>
		<br/>
		<h1>용달 신청 리스트</h1>
		<table>
            <tr>
                <th>번호</th>
                <th>내용</th>
                <th>아이디</th>
                <th>지역</th>
                <th>신청 날짜</th>
                <th>선택</th>
            </tr>
            <tr>
                <td>1</td>
                <td>용달 신청합니다. 위치는 인...</td>
                <td>tester01</td>
                <td>수도권</td>
                <td>2018-02-02</td>
                <td>
                    <input type="radio" name="deliveryIdx" value=""/>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>용달 부탁드립니다.</td>
                <td>tester02</td>
                <td>경기</td>
                <td>2018-02-03</td>
                <td>
                    <input type="radio" name="deliveryIdx" value=""/>
                </td>
            </tr>                      
		</table>
		<input type="submit" value="수락"/>
		<input id="toMainBtn" type="button" value="메인으로"/>
		
	</body>
	<script>
	    $("#toMainBtn").click(function() {
			location.href="./"
		});
        
	</script>
</html>