<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
		
			#hak{
				position: absolute;
                top:27%;
                right: 44%;	
			}
		</style>
	</head>
	<body>
	
	<jsp:include page="../memberLoginBox.jsp"/>
    		
    		<br>
    			<br>
    				<br>
    					<br>
    	
    	
	    	 <div id="hak">
	    	 <h1> Q&A 1 대 1 문의하기</h1>
	    	 <form action="./directQWrite?c_idx=${c_idx }&c_num=${cdto.c_num}" method="post" id="check">
		    	 <ul>
		    	 	<li>제목 : <input type= "text" name="b_subject" id="subject"/></li>
		    	 	<br>
		    	 	<li>분류 : 
			    	 	<select name="sup_qanda" id="qnada">
			    	 		<option value="">분류 선택</option>
						    <option value="거래관련">거래관련</option>
						    <option value="회원관련">회원관련</option>
						    <option value="기타">기타</option>
						</select>
					</li>
					<br>
		    	 	<li>문의 내용 : <textarea name="b_content" id="content"  rows="10" cols="30"></textarea></li>
		    
		    	 	<br>
		    	 	<li><input type="button" value="문의하기" onclick="javascript:directQWrite()"></li>
		    	 </ul>
		    	 </form>
	    	</div>
    
    	
    	
    	<jsp:include page="../mdgroupSideBar.jsp"/> 
	</body>
	<script>
		var nick="${sessionScope.loginNick}";
		
		function directQWrite(){
			if(nick == ""){
				alert("로그인이 필요한 서비스 입니다.");
				$("#toggle-sidebar").trigger("click");
			}else{
			 if($("#subject").val()== "") {
				 alert("제목을 입력해주세여");
			 }else if($("#qnada").val() == ""){
				 alert("분류를 골라주세요");
			 }else if($("#content").val() == ""){
				 alert("문의 내용을 입력해주세여");
			 }else{
				 $("#check").submit();
			 }	
			}
		}
	</script>
</html>