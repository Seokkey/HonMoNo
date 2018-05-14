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
		
		<h1>내 중고 거래 내역</h1>
		
		<table>
		    <tr>
		        <th>분류</th>
		        <th>브랜드</th>
		        <th>카테고리</th>
		        <th>품목명</th>
		        <th>수량</th>
		        <th>가격</th>
		        <th>거래일자</th>
		    </tr>
		    <tr>
		        <td>가구</td>
		        <td>시몬스</td>
		        <td>침대</td>
		        <td>
		            <a href="#">좋은 침대</a>
		        </td>
		        <td>1</td>
		        <td>3,000,000</td>
		        <td>2018-02-01</td>
		    </tr>
            <tr>
                <td>가전</td>
                <td>삼성</td>
                <td>TV</td>
                <td>
                    <a href="#">32인치 TV</a>
                </td>
                <td>TV</td>
                <td>800,000</td>
                <td>2018-02-05</td>
		    </tr>
		</table>
		<input id="toMainBtn" type="button" value="메인으로"/>
	</body>
	<script type="text/javascript">
        
        $(document).ready(function(){
            estimateChk();
        });
        
        function estimateChk(){
            $.ajax({
                
            });
        }
        
        $("#toMainBtn").click(function() {
			location.href="./"
		});
        
        
	</script>
</html>