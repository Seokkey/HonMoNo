<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
			<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
			.accordion {
			    background-color: #eee;
			    color: #444;
			    cursor: pointer;
			    padding: 18px;
			    width: 100%;
			    border: none;
			    text-align: left;
			    outline: none;
			    font-size: 15px;
			    transition: 0.4s;
			}
			
			.active, .accordion:hover {
			    background-color: #ccc; 
			}
			
			.panel {
			    padding: 0 18px;
			    display: none;
			    background-color: white;
			    overflow: hidden;
			}
		</style>
	</head>
	<body>
		 <jsp:include page="../memberLoginBox.jsp"/>
    		
    		
    	<br>
    	<br>
    	<br>
    	<br>
    	<br>
    	<div style="position : absolute; left:23%;top:24%;">
    		<h1>자주 묻는 질문</h1>
    		
    		<%-- <c:forEach items="${ qnaList}" var="qnaList"> --%>
    			
    			
	    		<button class="accordion">
	    		Q:회원탈퇴가 잘 되지 않습니다 어떻게하면 탈퇴가 가능한가요?
	    	 <%-- ${qnaList.b_subject }
	    		<c:if test="${sessionScope.loginRating == 9}">
	    			<a href="">수정</a>
	    		</c:if> --%>
	    		</button>
				<div class="panel">
				  <p><%-- ${qnaList.b_content } --%></p> 
				A:회원가입 탈퇴에 관한 문의는 고객문의 전화번호로 연락하시길 바랍니다.
				</div>
			<%-- </c:forEach> --%>
			
			<button class="accordion">
				Q:회원탈퇴가 잘 되지 않습니다 어떻게하면 탈퇴가 가능한가요?
			</button>
			<div class="panel">
				A:회원가입 탈퇴에 관한 문의는 고객문의 전화번호로 연락하시길 바랍니다.
			</div>
			
    		<c:if test="${sessionScope.loginRating == 9}">
    			<button onclick="javascript:qnaWriteForm()">질문 작성하기</button>
    			<input type="button" onclick="location.href='./listCall?c_idx=20&c_num=${param.c_num}'" value="취소"/>
    		</c:if>
    		
    	</div>
    	

    	
    	<jsp:include page="../mdgroupSideBar.jsp"/> 
	</body>
	<script type="text/javascript">
		function qnaWriteForm(){
			location.href="./qnaWriteForm?c_idx=20&c_num=${param.c_num}";
		}
	
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
		    acc[i].addEventListener("click", function() {
		        this.classList.toggle("active");
		        var panel = this.nextElementSibling;
		        if (panel.style.display === "block") {
		            panel.style.display = "none";
		        } else {
		            panel.style.display = "block";
		        }
		    });
		}
	</script>
</html>