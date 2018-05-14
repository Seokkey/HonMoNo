<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
		</style>
	</head>
	<body>
		<form action="./noticeBoardUpdate?c_idx=${param.c_idx}&c_num=${param.c_num }&b_idx=${boarddto.b_idx } " method="post" id="check">
			<table>
				<tr>
					<td>제목 : <input type="text" name="b_subject" id="subject" value="${boarddto.b_subject }"/></td>				
				</tr>
				<tr>
					<td>내용 : <textarea name="b_content" id="content"  rows="10" cols="30">${boarddto.b_content }</textarea>
				</tr>
			
			</table>		
			<input type="button" value="수정 완료" onclick="javascript:noticeBoardUpdate()"/>
		</form>
		<button onclick="location.href='./listCall?c_idx=${param.c_idx}&c_num=${param.c_num}'">취소</button>
	</body>
	<script>
		function noticeBoardUpdate(){
			$("#check").submit();
		}
	
	</script>
</html>