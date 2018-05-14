<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
		</style>
	</head>
	<body>
				 <jsp:include page="../memberLoginBox.jsp"/>
				 <br>
				 <br>
				 <br>
				 <br>
				  <form action="./qnaWrite?c_idx=${c_idx }&c_num=${c_num}"  method="post" id="check" >
			 	 <table>
					<tr>
						<td>	질문 : <input type="text" name="b_subject" id="subject"></td>				
					</tr>
					<tr>
						<td>	답변 : <textarea name="b_content" id="content"  rows="10" cols="30"></textarea></td>
					</tr>	
				 </table>
				 	 </form>
				 <input type="button" onclick="javascript:qnaWrite()" value="작성 완료"/>
				 <input type="button" onclick="location.href='./listCall?c_idx=${param.c_idx}&c_num=${param.c_num}'" value="취소"/>
				 <jsp:include page="../mdgroupSideBar.jsp"/> 				 	
	</body>
	<script type="text/javascript">
		function qnaWrite(){
			if($("#subject").val() == ""){
				alert("제목 입력해줘요");
			}else if(($("#content").val() == "")){
				alert("답변을 입력해주세요");
			}else{
				 $("#check").submit();
			}
		}
	</script>
</html>