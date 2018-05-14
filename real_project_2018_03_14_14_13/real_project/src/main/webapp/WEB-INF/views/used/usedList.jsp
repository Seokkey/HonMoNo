<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
	
	<title>중고 거래 리스트</title>
	<style>
           table,th,td{                
               border-collapse: collapse;
               padding: 5px;
               text-align: center;
           }
          
          #hak{
          		position: absolute;
                top:31%;
                right:34%;
          	
          }
          
          
       </style>
   
   <body>   
	<jsp:include page="../memberLoginBox.jsp"/>
   	<jsp:include page="../mdgroupSideBar.jsp"/> 
   	
   	<div id="hak">
   	<c:choose>
   		<c:when test="${faEx == 0}">    	
			<h1>${boardName}</h1> <input type="button" onclick="javascript:favoriteBbs(this)" value="☆(관심게시판 등록)" id="${faEx}"/>
   		</c:when>
   		<c:otherwise>
   			<h1>${boardName}</h1> <input type="button" onclick="javascript:favoriteBbs(this)" value="★(관심게시판 해제)" id="${faEx}"/>
   		</c:otherwise>   	
   	</c:choose>
   
						
      <table>
			<tr>
				<!-- <td width="10%">선택</td> -->
				<td> 글번호</td>
				<td> 브랜드</td>
				<td> 제목</td>
				<td> 지역</td>	
				<td> 작성일</td>			
				<td> 작성자</td>	
			</tr>	
		<c:forEach items="${usedboardList}" var="usedboardList" >				
           <tr>
               <td>${usedboardList.b_idx}</td>
               <td>${usedboardList.u_brand}</td>
               <c:choose>
               	<c:when test="${ usedboardList.u_bors == 'buy'}">
               		<td><a href="./usedDetail?b_idx=${usedboardList.b_idx}&c_idx=${c_idx}&c_num=${c_num}">${usedboardList.b_subject}&nbsp;[${usedboardList.rcount}][삽니다]</a></td>
               	</c:when>
                <c:when test="${ usedboardList.u_bors == 'sell' }">
               	 	<td><a href="./usedDetail?b_idx=${usedboardList.b_idx}&c_idx=${c_idx}&c_num=${c_num}">${usedboardList.b_subject}&nbsp;[${usedboardList.rcount}][팝니다]</a></td>
                </c:when>
                <c:otherwise>
                	<td>거래가 완료된 게시글입니다.</td>
                </c:otherwise>
               </c:choose>
              
               <td>${usedboardList.u_area}</td>
               <td>${usedboardList.b_date}</td>
               <td>${usedboardList.b_nick}</td>			                
           </tr>				        			      		               	                
		 </c:forEach>	
	 </table>
			
			
	<br>							
	    <div id="pageForm" style=" text-align: center;">
	    
	   <c:if test="${startpage >1}">
	    	<a href='./listCall?c_idx=${c_idx}&keyword=${searchlist.keyword}&area=${searchlist.area}&brand=${searchlist.brand}&search=${searchlist.search}&page=${spage =1}&c_num=${param.c_num}'>[처음]</a>
		</c:if>		   
	        <c:if test="${spage > 1}">
	            <a href='./listCall?c_idx=${c_idx}&keyword=${searchlist.keyword}&area=${searchlist.area}&brand=${searchlist.brand}&search=${searchlist.search}&page=${spage -1}&c_num=${param.c_num}'>[ 이전 ]</a>
	        </c:if>
	        
	        <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
	            <c:if test="${pageNum == spage}">
	                ${pageNum}&nbsp;
	            </c:if>
	            <c:if test="${pageNum != spage}">
	                <a href='./listCall?c_idx=${c_idx}&keyword=${searchlist.keyword}&area=${searchlist.area}&brand=${searchlist.brand}&search=${searchlist.search}&page=${pageNum}&c_num=${param.c_num}'>${pageNum}&nbsp;</a>
	            </c:if>
	        </c:forEach>
	        <c:if test="${spage<maxPage }">
	        	<a href='./listCall?c_idx=${c_idx}&keyword=${searchlist.keyword}&area=${searchlist.area}&brand=${searchlist.brand}&search=${searchlist.search}&page=${spage+1}&c_num=${param.c_num}'>[다음]</a>
	        </c:if>
	        <c:if test="${endPage < maxPage }">
	            <a href='./listCall?c_idx=${c_idx}&keyword=${searchlist.keyword}&area=${searchlist.area}&brand=${searchlist.brand}&search=${searchlist.search}&page=${endpage}&c_num=${param.c_num}'>[끝]</a>
	        </c:if> 				        
	    </div>
		<br>
		
		&nbsp;&nbsp;				
	
		<select name="area" id="area">
			<option value="">지역 선택</option>
		    <option value="서울">서울</option>
		    <option value="인천">인천</option>
		    <option value="경기">경기</option>
		    <option value="광주">광주</option>
		    <option value="대전">대전</option>
		    <option value="대구">대구</option>
		    <option value="부산">부산</option>
		    <option value="울산">울산</option>
		    <option value="강원도">강원도</option>					    
		    <option value="충북">충북</option>
		    <option value="충남">충남</option>
		    <option value="경북">경북</option>
		    <option value="경남">경남</option>
		    <option value="전북">전북</option>
		    <option value="전남">전남</option>
		    <option value="제주">제주</option>
		    <option value="기타">기타</option>
		</select>
			
		<select name="brand" id="brand">
			<option value="">브랜드 선택</option>
		    <option value="시몬스">시몬스</option>
		    <option value="에이스">에이스</option>
		    <option value="템퍼">템퍼</option>
		    <option value="한샘">한샘</option>
		    <option value="리바트">리바트</option>
		    <option value="에몬스">에몬스</option>
		    <option value="기타브랜드">기타 브랜드</option>
		</select>	
		<select name = "search" id="search">
			<option value="">키워드 선택</option> 
			<option value="writer">작성자</option>
			<option value="sub">제목</option>
  			<option value="subcon">제목 + 내용</option>
		</select>
		<input type="text" id = "keyword" onkeypress="if( event.keyCode==13 ){searchBtn();}"/>
		<a href = "javascript:searchBtn()" id = "searchBtn"> 검색</a>
		 <a href = "javascript:usedWriteForm()"> 글쓰기</a>	
	 
			
	</div>	 
</body>

<script>
	var b_nick="${sessionScope.loginNick}";
  	var c_num="${c_num}"; 
	console.log("${usedboardList}");
	function searchBtn(){			
		var area = $("#area option:selected").val();
		var brand = $("#brand option:selected").val();
		var search = $("#search option:selected").val();
		var keyword = $("#keyword").val();
		if(search == "" && keyword != ""){
			alert("키워드를 선택해주세요");		
		}else{
			location.href="./listCall?c_idx="+${c_idx}+"&c_num="+c_num+"&area="+area+"&brand="+brand+"&search="+search+"&keyword="+keyword+"";
		}
	}
	/*글쓰기  */
	function usedWriteForm(){
		console.log(c_num);
		console.log("${c_idx}");
		if(b_nick == ""){
			alert("로그인이 필요한 서비스 입니다.");
			$("#toggle-sidebar").trigger("click");
		}else{
				 location.href="./usedWriteForm?c_idx="+${c_idx}+"&c_num="+c_num+""; 
					
		}				
	}
	/* 즐겨찾기 추가 삭제 => catecontroller */
	function favoriteBbs(d){
		console.log(d);
		console.log(d.getAttribute('id'));
		if(b_nick == ""){
			alert("로그인이 필요한 서비스 입니다.");
			$("#toggle-sidebar").trigger("click");
		}else{
			var faId = d.getAttribute('id');
			console.log(faId==0);
			if(faId == 0){
				$.ajax({
					url:'faAdd',
					type:'get',
					data:{c_idx:"${c_idx}"},
					dataType:'json',
					success:function(data){						
						console.log(data);
						alert(data.msg);
						location.reload();
					},
					error:function(e){
						console.log(error);
					}			
				});	
			}else{
				$.ajax({
					url:'faDel',
					type:'get',
					data:{c_idx:"${c_idx}"},
					dataType:'json',
					success:function(data){						
						console.log(data);
						alert(data.msg);
						location.reload();
					},
					error:function(e){
						console.log(error);
					}			
				});
			}	
		}						
	}
	
	</script>
</html>