<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		<h1>거래내역 게시판</h1>
		<br/>
		<table>
		    <tr>
		        <th>분류</th>
		        <th>브랜드</th>
		        <th>제품</th>
		        <th>거래자</th>
		        <th>배송일</th>
		        <th>진행상태/상세보기</th>
		    </tr>
		    <tr>
		        <td>[중고]</td>
		        <td>시몬스</td>
		        <td>
		        	<a href="#">멋진 침대</a>
		        </td>
		        <td>
		            tester01
		        </td>
		        <td>2018-02-08</td>
		        <td>
		        	<span>거래요청</span>
		        	<br/>
		        	<input type="button" value="상세보기"/>
		        </td>
		    </tr>
            <tr>
		        <td>[견적]</td>
		        <td>에이스</td>
		        <td>
		        	<a href="#">진짜 좋은 침대</a>
		        </td>
		        <td>
		            tester02
		        </td>
		        <td>2018-02-10</td>
		        <td>
		        	<span>입금완료/배송준비중</span>
		        	<br/>
		        	<input type="button" value="상세보기"/>
		        </td>
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