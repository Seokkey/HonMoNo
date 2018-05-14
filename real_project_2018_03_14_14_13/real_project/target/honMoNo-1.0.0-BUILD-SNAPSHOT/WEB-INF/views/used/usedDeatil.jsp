<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
			#hak{
					position: absolute;
                	top:35%;
               	 	right:42%;
			}
		
		</style>
		<title>중고 거래 상세보기</title>
	</head>
	<body>	
	 	<jsp:include page="../memberLoginBox.jsp"/>
    	<jsp:include page="../mdgroupSideBar.jsp"/> 
    	
    	<br>
    	<br>
    	<div id="hak">
    	<h1><b>중고거래 상세보기</b></h1>
    	<table>
    		<tr>
		   		<td>작성자</td>
		   		<td>${boarddto.b_nick}</td>
		   	</tr>	
		   	<tr>
		   		<td>브랜드</td>
		   		<td>${boarddto.u_brand}</td>
		   	</tr>
		   	<tr>
		   		<td>지역</td>
		   		<td>${boarddto.u_area}</td>
		   	</tr>
		   	<tr>
		   		<td>제품</td>
		   		<td>${boarddto.u_product}</td>
		   	</tr>		   
		   	<tr>		   		
			   	<c:if test="${boarddto.u_safety == 'safe'}">
			   			<td colspan="2">안전거래 신청 게시글 입니다</td>
		   		</c:if>
		   	</tr>
		   	<tr>	
		   		<td>제목</td>
		   		<td>${boarddto.b_subject}</td>
		   	</tr>
	   		<tr>
	   			<td>내용</td>
	   			<td>${boarddto.b_content}</td>
	   		</tr>
  			<tr>
  				
   			<td>제품 사진</td>
               	<c:forEach  items="${usedpholist}" var="usedpholist">
               	
                	<c:if test="${usedpholist.p_newname == null}">
                		<td>제품 사진이 없습니다.</td>
	                </c:if>
	                <td>
	                <c:if test="${usedpholist.p_newname != null}">		                
		                
		                		<img class="image" src="${usedpholist.p_path}${usedpholist.p_newname}"/>
	              
                	</c:if>
                	  	</td>
               	</c:forEach> 
   			</tr>				 
   			<c:if test="${boarddto.b_nick == sessionScope.loginNick }">   			
   			<tr>
   				<td><button onclick="javascript:delivery(${boarddto.b_idx})">용달 신청하기</button></td>
		   	</tr>
		   	</c:if>			   	
    	</table>
    		<br>
    	<br>
    	<table>
    		<tr>				
				<td align="right">
				<c:if test="${sessionScope.loginNick ==  boarddto.b_nick}">
					<button onclick="location.href='javascript:usedUpdateForm()'">수정</button>
					
				</c:if>
				<c:choose>
					<c:when test="${sessionScope.loginNick ==  boarddto.b_nick}">
						<button onclick="location.href='javascript:usedDel()'">삭제</button>
					</c:when>
					<c:when test="${sessionScope. loginRating == 9}">
						<button onclick="location.href='javascript:usedDel()'">삭제</button>
					</c:when>
				</c:choose>
				<c:if test="${sessionScope.loginNick !=  boarddto.b_nick}">
					<button onclick="report(${boarddto.b_idx})">신고</button>
				</c:if>	
					<button onclick="location.href='./listCall?c_idx=${param.c_idx}&c_num=${param.c_num}'">목록</button>
				</td>
			</tr> 
    	</table>
    	<br>
    	<br>
    	<table><!-- 댓글 작성 테이블  -->
			<tr>
				<td><textarea id="comment" placeholder="댓글을 등록 해주세요. (2000자 이내)"></textarea></td>
				<td><button onclick="replyInsert(${boarddto.b_idx})">댓글 등록</button></td> <!--로그인 검사 -->
			</tr>
		</table>
		<br>
		<br>
    	<table id="rTable"><!-- 댓글 불러오기 테이블  -->			
			<c:forEach var="usedreplylist" items="${usedreplylist}">
				<tr>
					<td>${usedreplylist.r_nick}</td>
					<td>${usedreplylist.r_content}</td>
					<td>${usedreplylist.r_date}</td>				
					<c:if test="${usedreplylist.r_nick == sessionScope.loginNick }">
							<td><a href="javascript:replyDel(${usedreplylist.r_idx})">삭제</a></td>
					</c:if>
					<c:if test="${boarddto.b_nick == sessionScope.loginNick }">
						<c:if test="${boarddto.u_safety == 'safe'}">
							<c:if test="${usedreplylist.r_nick != boarddto.b_nick }">
								<c:choose>
								<c:when test="${boarddto.u_bors == 'buy'}">
									<td><a href="javascript:dealChoice('${usedreplylist.r_nick}')">안전거래</a></td>
								</c:when>
								<c:otherwise>
									<td><a href="javascript:sendSellmsg('${usedreplylist.r_nick}')">안전거래</a></td>
								</c:otherwise>
								</c:choose>
							</c:if>
						</c:if>	
					</c:if>
				</tr>
			</c:forEach>			
		</table>
			<br>
    	<br>
		</div>
	</body>
	<script>		
		console.log("${usedreplylist}");
		console.log("${usedpholist}");
		console.log("${boarddto}");
		console.log("${usedpholist[0].p_path}${usedpholist[0].p_newname}");
		
		var nick="${sessionScope.loginNick}"; //세션 닉네임
		var rating = "${sessionScope.loginRating}"; //세션 레이팅	
		
		//용달 신청하기
		function delivery(b_idx){
			var d=window.open('about:blank','','width=500, height=500');		
			if (confirm("용달 서비스를 신청하겠습니까? \n (※양식에 맞춰 작성해주시기 바랍니다.※)") == true){
				var c_idx = "${param.c_idx}";
				var c_num = "${param.c_num}";			
				$.ajax({
					type:'post',
					url:'./reportForm',
					data:{					
						b_idx : b_idx,
						c_idx : c_idx,
						c_num : c_num					
					},
					dataType:'json',
					success:function(data){
						console.log(data);					
						d.location.href = './messageForm?msg_recivenick=관리자&msg_sendnick='+nick+
													'&c_idx='+data.c_idx+
													'&msg_category=용달신청&b_idx='+data.b_idx+'';
					},
					error:function(error){
						alert('채택 실패');
						console.log(error);
					}
				});
			}else{//취소
			    return;
			}
		}
		
		//신고하기
		function report(b_idx){
			var r=window.open('about:blank','','width=500, height=500');		
			if (confirm("해당 글을 신고하시겠습니까? \n (※신고시 신고사유 작성해주시기 바랍니다.※)") == true){
				var c_idx = "${param.c_idx}";
				var c_num = "${param.c_num}";			
				$.ajax({
					type:'post',
					url:'./reportForm',
					data:{					
						b_idx : b_idx,
						c_idx : c_idx,
						c_num : c_num					
					},
					dataType:'json',
					success:function(data){
						console.log(data);					
						r.location.href = './messageForm?msg_recivenick=관리자&msg_sendnick='+nick+
													'&c_idx='+data.c_idx+
													'&msg_category=신고요청&b_idx='+data.b_idx+'';
					},
					error:function(error){
						alert('채택 실패');
						console.log(error);
					}
				});
			}else{//취소
			    return;
			}	
				
		}
		
		//메세지 보내기		
		function sendSellmsg(r_nick){
			if (confirm(r_nick+"님께 거래요청 메시지를 보내시겠습니까?") == true){  
				location.href='./sendSellmsg?msg_recivenick='+r_nick+
					'&c_num=${param.c_num}&msg_sendnick=${boarddto.b_nick}&c_idx=${param.c_idx}&b_idx=${boarddto.b_idx}';	
			}
		}
		
		if('${sendSellmsg}' == ""){			
			
		}else{
			alert('${sendSellmsg}');
			/* location.href='./usedDetail?b_idx=${boarddto.b_idx}&c_num=${param.c_num}&c_idx=${param.c_idx}'; */
		}
			
		
		//채택하기
		function dealChoice(r_nick){
		var w=window.open('about:blank','','width=500, height=500');
		console.log("알닉~"+r_nick);
		if (confirm(r_nick+"님과 거래하시겠습니까?") == true){    //확인
			var b_idx = "${boarddto.b_idx}";
			var c_idx = "${param.c_idx}";
			var c_num = "${param.c_num}";
			$.ajax({
				type:'post',
				url:'./estiChoose',
				data:{					
					b_idx : b_idx,
					c_idx : c_idx,
					c_num : c_num,
					em_choosedid : r_nick
				},
				dataType:'json',
				success:function(data){
					console.log(data);					
					
						w.location.href = './messageForm?msg_recivenick='+data.boardDto.em_choosedid+
						'&c_num='+data.categoryDto.c_num+'&msg_sendnick='+nick+
						'&c_idx='+data.categoryDto.c_idx+
						'&u_bors=${boarddto.u_bors}&b_idx='+data.boardDto.b_idx+'';						
										
				},
				error:function(error){
					alert('거래 실패');
					console.log(error);
				}
				});
		}else{//취소
		    return;
		}
	}
		//댓글 삭제
		function replyDel(r_idx){
			$.ajax({
				url:"replyDel",
				type:"get",
				data:{r_idx:r_idx,b_idx:"${boarddto.b_idx}"},
				success:function(data){
					window.location.reload();
					/* var reply='';
					for(var i=0;i<data.reply.length;i++){					
						reply+='<tr>'
							if(nick !=0){
								 +'<td class="choose" ><button onclick=location.href="javascript:dealChoice('+data.reply[i].r_nick+')">채택하기</button></td></tr>'
							}else if(nick == 0){
							 +'<td class="choose" >로그인시 채택 할수 있습니다.</td></tr>'
							}
							else if(data.reply[i].r_nick == nick){
								+'<td><a href="javascript:replyDel('+data.reply[i].r_idx+')">삭제</a></td></tr>'				
							};
					} */
				},				
				error:function(e){
					alert('삭제실패')
					}
				
			})
			
			
		}
		//게시글 수정
		function usedUpdateForm(){
			location.href="./usedUpdateForm?c_idx="+${param.c_idx}+"&c_num="+${param.c_num}+"&b_idx="+${boarddto.b_idx}+"";
		}
		//게시글 삭제
		function usedDel(){
			location.href="./usedDel?c_idx="+${param.c_idx}+"&c_num="+${param.c_num}+"&b_idx="+${boarddto.b_idx}+"";
		}
		
		function replyInsert(b_idx){ //댓글 유효성검사, 댓글 삽입		
		
			var r_content= $('#comment').val(); //댓글 내용	
			if(nick == ""){
				alert("로그인이 필요한 서비스 입니다.");
				$("#toggle-sidebar").trigger("click");
			}else{					
					console.log(r_content);
					if(comment.length<1){
						alert("댓글을 입력해 주세요.");
					}else if(comment.length>2000){
						alert("2000자 이내로 입력해 주세요.");
					}else{
						$.ajax({
						url:'./usedReplyWrite',
						data:{b_idx:b_idx,
							  r_content:r_content,
							  r_nick:nick
						},
						dataType:'json',
						success:function(data){
							window.location.reload();
							
						},
						error:function(error){
							alert('댓글 삽입 실패');
							console.log(error);
						}
						});													
				}		
			}
		}	
	</script>
</html>