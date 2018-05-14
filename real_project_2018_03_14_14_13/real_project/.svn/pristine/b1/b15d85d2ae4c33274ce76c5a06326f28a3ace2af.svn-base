<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
			<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			#hak{
				position: absolute;
                top:32%;
                right: 45%;
			}
		
		</style>
	</head>
	<body>
	
	
	 <jsp:include page="../memberLoginBox.jsp"/>
	 <jsp:include page="../mdgroupSideBar.jsp"/> 
    		<br>
    		<br>
    		<br>
    		<br>
    		<br>
    	<div id="hak">
    		<h1>문의내역 보기</h1>
    		
    		<table>
    			<tr>
    				<td>제목 : ${boarddto.b_subject }</td>
    			</tr>
    			<tr>
    				<td>분류 : ${boarddto.sup_qanda }</td>
    			</tr>
    			<tr>
    				<td>질문 : ${boarddto.b_content}</td>
    			</tr>
    			<tr>
    			<c:if test="${sessionScope.loginRating != 9 }">
		    			<c:choose>
		    					<c:when test=" ${boarddto.sup_answer != 'N' }">
		    						<td>답변 : ${boarddto.sup_answer }</td>
		    					</c:when>
		    					<c:otherwise>
		    						<td>답변 :  답변 대기중 입니다.</td>
		    					</c:otherwise>
		    				</c:choose>
    				</c:if>
    			<c:if test="${sessionScope.loginRating == 9 }">
    				<c:choose>
    					<c:when test="${boarddto.sup_answer != 'N' }">
    						<td>답변 : <textarea name="sup_answer" id="answer">${boarddto.sup_answer}</textarea></td>
    					</c:when>
    					<c:otherwise>
	    						<td>답변 하기<textarea name="sup_answer" id="answer"></textarea></td>
    					</c:otherwise>
    				</c:choose>
    				
    			</c:if>
    			</tr>
    		
    		
    		</table>
    			<c:if test="${sessionScope.loginRating == 9 }">
    				<button onclick="javascript:directQUpdate()">수정</button>
    			</c:if>
    		<button onclick="javascript:directQDetail(${boarddto.b_idx})">목록</button>
    	</div>
    	
	</body>
	<script type="text/javascript">
		
		function directQUpdate(){
			var sup_answer= $("#answer").val();
			console.log(sup_answer);
 		 	location.href="./directQUpdate?c_idx=${param.c_idx}&c_num=${param.c_num}&b_idx="+${boarddto.b_idx}+"&sup_answer="+sup_answer+"";
 	 }
		function directQDetail(b_idx){
			location.href="./listCall?c_idx=${param.c_idx}&c_num=${param.c_num}&b_idx="+b_idx+"";
		}
	</script>
</html>



