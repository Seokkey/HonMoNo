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
        #sidaBarTop{
        	background-color: green;
        }
        #sideBar{
        	float: left;
        }
	</style>
	
</head>
	<body>
		<br/><br/><br/>
		<jsp:include page="../memberLoginBox.jsp"/>
		<br/>
		
		<h1>관리자 쪽지</h1>
		<br/><br/>
		<%-- <c:choose>
				<c:when test="${sessionScope.loginRating eq 9 }">
				<ul>
					<li><a href='javascript:searchBtn(0)'>공지 알림</a></li>
					<li><a href='javascript:searchBtn(3)'>환불요청</a></li> 
					<li><a href='javascript:searchBtn(4)'>신고요청</a></li>
					<li><a href='javascript:searchBtn(5)'>용달신청</a></li>
				</ul>
				</c:when>
				<c:otherwise> --%>
		include side바
		ex)	
		<div id="sideBar">
			<table>
			<tr>
				<th id="sidaBarTop">쪽지 보내기</th>
			</tr>
			<tr>
				<td>쪽지 보내기</td>
			</tr>
			<tr>
				<th><a href="./noteListAdmin">쪽지 리스트</a></th>
			</tr>	
			</table>
		</div>
		<table>
		    <tr>
		        <th>번호</th>
		        <th>회원 아이디</th>
		        <th>보낼사람 선택</th>
		    </tr>
		    <tr>
		        <td>1</td>
		        <td id="userId1">tester01</td>
		        <td>
		            <input type="checkbox" name="userId" value="$('#userId1').html()"/>
		        </td>
		    </tr>
            <tr>
		        <td>2</td>
		        <td id="userId2">tester02</td>
		        <td>
		            <input type="checkbox" name="userId" value="$('#userId2').html()"/>
		        </td>
		    </tr>
		    <tr>
		        <td>3</td>
		        <td id="userId3">tester03</td>
		        <td>
		            <input type="checkbox" name="userId" value="$('#userId3').html()"/>
		        </td>
		    </tr>
            <tr>
		        <td>4</td>
		        <td id="userId4">tester04</td>
		        <td>
		            <input type="checkbox" name="userId" value="$('#userId4').html()"/>
		        </td>
		    </tr>
		</table>
		<input type="button" value="확인"/>
		<input id="toMainBtn" type="button" value="메인으로"/>
	</body>
	<script>
        
	    $("#toMainBtn").click(function() {
			location.href="./"
		});
	
        $(document).ready(function(){
            noteChk();
        });
        
        function noteChk(){
            $.ajax({
                
            });
        }
	</script>
</html>
