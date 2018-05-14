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
        }
        textarea{
            resize: none;
        }
        #noteView{
            border: 1px solid white;
        }
        .consumer{
        	color: red;
        }
        .seller{
        	color: blue;
        }
	</style>
	
</head>
	<body>
		<br/><br/><br/>
		<jsp:include page="../memberLoginBox.jsp"/>
		<br/>
		<h1>1:1 견적 상담</h1>

		<br/><br/><br/><br/>
		판매자에게 궁금한점을 물어보시면 답글을 달아드립니다.	
		<br/><br/>
		<h3>(회원아이디) 님과의 1:1 상담</h3>
		<table>
            <tr>
                <th colspan="2">
                    답글
                </th>
            </tr>
            <tr>
                <td colspan="2">
                 	나 :<span class="consumer">거래 요청합니다</span>
                    <span class="consumerDate">2018-02-01 14:44</span>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                 	판매자 : <span class="seller">계약서 작성해주세요.</span>
                    <span class="consumerDate">2018-02-01 14:52</span>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <textarea rows="1" cols="50"></textarea>
                    <input type="button" value="전송"/>
                </td>
            </tr>
		</table>
		<input type="button" value="거래하기"/>
		<input id="toNoteListBtn" type="button" value="리스트로"/>
		<input id="toMainBtn" type="button" value="메인으로"/>
	</body>
	<script>
		
	    $("#toMainBtn").click(function() {
			location.href="./"
		});
	    
	    $("#toNoteListBtn").click(function() {
			location.href="./noteList"
		});
			
	</script>
</html>