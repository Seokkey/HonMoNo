<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
		section{
			width: 50%;
		}
		.arti1{
			width: 140%;
			height: 100%;
			/* border: 1px solid black; */
		}
		.arti2{
			width: 18%;
			height: 40%;
			/* border: 1px solid black; */
			display: inline-block;
			float: left;
		}
		.arti3{
			width: 50%;
			height: 50%;
		/* 	border: 1px solid black; */
		}
		
		.arti3 img{
			width: 100%;
			height: auto;
		}
		#hak{
			position: absolute;
               top:31%;
               right: 40%;
		}
        </style>
    </head>
    <body>
    	<jsp:include page="../memberLoginBox.jsp"/>
    	<jsp:include page="../mdgroupSideBar.jsp"/> 
    	
    <div id="hak" style=" margin-left: 20%;">	
		<p>브랜드 로고자리</p>
		<br />
		<br />
		<br />
		<div >
			<div class="arti1">
				<c:forEach items="${shopList }" var="shopList">
					<div class="arti2">
					
						<div  >
							<a href="./shopDetail?b_idx=${shopList.b_idx}&c_idx=${c_idx}&c_num=${c_num}">${shopList.sh_brand }</a>
						</div>
						
						<div class="arti3">					
							<c:forEach items="${photoList }" var="photoList">
								<c:if test="${shopList.b_idx == photoList.b_idx }">
										<a href="./shopDetail?b_idx=${shopList.b_idx}&c_idx=${c_idx}&c_num=${c_num}"><img class="image" src="${photoList.p_path}${photoList.p_newname}"/></a>
								</c:if>		
							</c:forEach>										
						</div>
						
						<div  style="width: 100%">
							<div>${shopList.sh_address}</div>
						</div>
						
					</div>	
				</c:forEach>	
			</div>		
			</div>
		</div>
		<br/>
		<br>
		<br>
		<br>	
		<br>	
	<div  style=" margin-left: 40%;">
      <div id="pageForm">
				    
	   <c:if test="${startpage >1}">
	    	<a href='./listCall?c_idx=${c_idx}&keyword=${searchlist.keyword}&search=${searchlist.search}&page=${spage =1}&c_num=${param.c_num}'>[처음]</a>
		</c:if>		   
	        <c:if test="${spage > 1}">
	            <a href='./listCall?c_idx=${c_idx}&keyword=${searchlist.keyword}&search=${searchlist.search}&page=${spage -1}&c_num=${param.c_num}'>[ 이전 ]</a>
	        </c:if>
	        
	        <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
	            <c:if test="${pageNum == spage}">
	                ${pageNum}&nbsp;
	            </c:if>
	            <c:if test="${pageNum != spage}">
	                <a href='./listCall?c_idx=${c_idx}&keyword=${searchlist.keyword}&search=${searchlist.search}&page=${pageNum}&c_num=${param.c_num}'>${pageNum}&nbsp;</a>
	            </c:if>
	        </c:forEach>
	        <c:if test="${spage<maxPage }">
	        	<a href='./listCall?c_idx=${c_idx}&keyword=${searchlist.keyword}&search=${searchlist.search}&page=${spage+1}&c_num=${param.c_num}'>[다음]</a>
	        </c:if>
	        <c:if test="${endPage < maxPage }">
	            <a href='./listCall?c_idx=${c_idx}&keyword=${searchlist.keyword}&search=${searchlist.search}&page=${endpage}&c_num=${param.c_num}'>[끝]</a>
	        </c:if> 				        
	    </div>
		<br/>
		<br/>
		<span style="">
			<!-- <input type="button" id = "meetSearchBtn" value = "검색"> -->
			<select name="search" id = "search">
	  			<option value="address">주소</option>
			</select>
			<input type="text" id = "keyword"/>
			<a href = "javascript:searchBtn()" id = "searchBtn"> 검색</a>
			 <a href = "javascript:shopWriteForm()"> 글쓰기</a>	
		</span>
		</div>
	</body>
	<script>
	console.log("${photodto}")
	var b_nick="${sessionScope.loginNick}";
	
	function searchBtn(){			
		
		var search = $("#search option:selected").val();
		var keyword = $("#keyword").val();
		if(search == "" && keyword != ""){
			alert("검색어를 입력해주세요");		
		}else{
			location.href="./listCall?c_idx="+${c_idx}+"&c_num="+c_num+"&area="+area+"&brand="+brand+"&search="+search+"&keyword="+keyword+"";
		}
	}
	/*글쓰기  */
	function shopWriteForm(){
		console.log(c_num);
		console.log("${c_idx}");
		if(b_nick == ""){
			alert("로그인이 필요한 서비스 입니다.");
			$("#toggle-sidebar").trigger("click");
		}else{
				 location.href="./shopWriteForm?c_idx="+${c_idx}+"&c_num="+c_num+""; 					
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