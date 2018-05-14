<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <style>
        
        	#hak{
        			position: absolute;
                top:26%;
                right: 43%;
        	}
        </style>
    </head>
    <body>
        <jsp:include page="../memberLoginBox.jsp"/>
        <jsp:include page="../mdgroupSideBar.jsp"/>
        <br>
        <br>
        <div id="hak">
		<h1>공지사항 글쓰기 폼</h1>
		<form action="./noticeBoardWrite?c_idx=${param.c_idx}&c_num=${param.c_num } " method="post" id="check">
			<table>
				<tr>
					<td>제목 : <input type="text" name="b_subject" id="subject"/></td>				
				</tr>
				<tr>
					<td>내용 : <textarea name="b_content" id="content"  rows="10" cols="30"></textarea>
				</tr>
			
			</table>		
			<input type="button" value="작성 완료" onclick="javascript:noticeBoardWrite()"/>
		</form>
		</div>
		
    </body>
    <script>
    	function noticeBoardWrite(){
    		if($("#subject") == ""){
    			alert("제목을 작성해 주세여")
    		}else if($("#content") == ""){
    			alert("내용을 작성해주세요")
    		}else{
   			   $("#check").submit();
    		}
    	}
    </script>
</html>
