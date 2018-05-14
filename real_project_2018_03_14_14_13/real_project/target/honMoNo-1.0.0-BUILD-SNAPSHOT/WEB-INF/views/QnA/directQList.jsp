<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
		
			#hak{
				position: absolute;
                top:27%;
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
    		
    			<c:choose>
    				<c:when test="${fn:length(directlist) eq'0'}">   
    					
    			<div id="hak"> 					
    					<table>
	    					<h1>1대1 문의 내역</h1>
						    		
							<h1>등록된 게시글이 없습니다.</h1>
    					</table>
    				</div>
    				</c:when>
    				
    				<c:otherwise>
    				<c:choose>
			    		<c:when test="${sessionScope.loginNick != null }">
					    	<div id="hak">
					    	<table>
					    		<h1>1대1 문의 내역</h1>
					    		<tr>
					    			<td>분류</td>
					    			<td>제목</td>
					    			<td>작성자</td>
					    			<td>작성일</td>
					    		</tr>
					    	
						    		<c:forEach items="${ directlist}" var="directlist">
						    			<tr>
							    		 	<td>${directlist.sup_qanda }</td>
							    		 	<c:choose>
							    		 		<c:when test="${ directlist.sup_answer != 'N'}">
							    		 			<td style="margin:3%"><a href="javascript:directQDetail(${ directlist.b_idx})">${directlist.sup_qanda}[답변완료]</a></td>
							    		 		</c:when>
							    		 		<c:otherwise>
							    		 			<td style="margin:3%"><a href="javascript:directQDetail(${ directlist.b_idx})">${directlist.sup_qanda}[답변대기중]</a></td>
							    		 		</c:otherwise>
							    		 	</c:choose>
							    		 	<td style="margin:3%">${directlist.b_nick }</td>
							    		 	<td style="margin:3%">${directlist.b_date }</td>
							    		 	 </tr>
				    		 	</c:forEach>	
				    		 	</table>
			    	</div>	
			    	    	
			    	<br>
			    	<br>
			    	<br>
				    	<div id="pageForm" style=" margin-left: 10%;position:absolute;right:55%;bottom:30%;">				    
							   <c:if test="${startpage >1}">
							    	<a href='./directQList?c_idx=${c_idx}&page=${spage =1}&c_num=${param.c_num}'>[처음]</a>
								</c:if>		   
							        <c:if test="${spage > 1}">
							            <a href='./directQList?c_idx=${c_idx}&page=${spage -1}&c_num=${param.c_num}'>[ 이전 ]</a>
							        </c:if>
							        
							        <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
							            <c:if test="${pageNum == spage}">
							                ${pageNum}&nbsp;
							            </c:if>
							            <c:if test="${pageNum != spage}">
							                <a href='./directQList?c_idx=${c_idx}&page=${pageNum}&c_num=${param.c_num}'>${pageNum}&nbsp;</a>
							            </c:if>
							        </c:forEach>
							        <c:if test="${spage<maxPage }">
							        	<a href='./directQList?c_idx=${c_idx}&page=${spage+1}&c_num=${param.c_num}'>[다음]</a>
							        </c:if>
							        <c:if test="${endPage < maxPage }">
							            <a href='./directQList?c_idx=${c_idx}&page=${endpage}&c_num=${param.c_num}'>[끝]</a>
							        </c:if> 				        
							    </div>
				    	
			    		 	</c:when>
			    		 	<c:otherwise>
			    		 	
			    		 		<h1>로그인 후 이용 가능합니다.</h1>
			    		 	</c:otherwise>
			    		 	
	    			</c:choose>
	    		
    				</c:otherwise>
    			</c:choose>
	    		
	
	</body>
	<script type="text/javascript">
		var rating = "${sessionScope.loginRating}";
		
		function directQDetail(b_idx){
			location.href="./directQDetail?c_idx=${param.c_idx}&c_num=${param.c_num}&b_idx="+b_idx+"";
		}
		$(document).ready(function(){
			if(rating == ""){
				alert("로그인이 필요한 서비스 입니다.");
				$("#toggle-sidebar").trigger("click");
			}
		});
	</script>
</html>