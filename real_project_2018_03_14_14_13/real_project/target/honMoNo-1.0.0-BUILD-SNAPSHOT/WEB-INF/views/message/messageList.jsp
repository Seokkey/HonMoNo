<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<html>
	<head>
	<title>1:1 쪽지 리스트</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style>
		table, td, th{
            border: 1px solid;
            padding: 5px;
            border-collapse: collapse;
            margin: 8px;
            text-align: center;
        }
        #sideBar{
        	float: left;
        }
        #hak{
        	position: absolute;
                top:22%;
                right:40%;
        }
        #hak3{
        	position: absolute;
        	left: 38.5%;
        	bottom:54%;
        
        }
        
        #sideBar{
        border: 1px solid;
        float:left;
        position:absolute;
        bottom:64%;
        left:5%;
        }
	</style>
	
</head>
	<body>
		<jsp:include page="../memberLoginBox.jsp"/>
		<br/>
		
		<div id= sideBar>			
			
				<a href='./messageList?msg_category=0'>공지 알림</a><br>
				<a href='./messageList?msg_category=견적문의'>1:1 견적문의</a><br>
				<a href='./messageList?msg_category=중고거래'>1:1 중고거래</a><br>
				
		</div>
		<br/>
		<br/>
		
		<div id="hak">
		<table>
		<h2>쪽지 리스트</h2>
			<c:choose>			
				<c:when test="${msg_category == '0'}">
				<tr>
			        <th>번호</th>
			        <th>상태</th>
			        <th>쪽지 내용</th>
			        <th>보낸이</th>
			        <th>날짜</th>
		    	</tr>	
			    	<c:choose>
				    	<c:when test="${fn:length(msglist) eq '0'}">
				    		<tr>
				    			<td colspan="5">해당 쪽지가 없습니다.</td>
				    		</tr>				    		
				    	</c:when>
				    	<c:otherwise>
				    		<c:forEach var="msglist" items="${msglist}">
						    	<tr>
							        <td>${msglist.msg_idx}</td>
							        <td>${msglist.msg_category}</td>
							        <td>
							        	<a href="javascript:messageDetailView('${msglist.msg_sendnick}','${msglist.msg_recivenick}',${msglist.b_idx},${msglist.msg_idx})">
							        		${msglist.msg_content}
							        	</a>
							        </td>
							        <td>${msglist.msg_sendnick}</td>
							        <td>${msglist.msg_date}</td>
						    	</tr>
					    	</c:forEach>
				    	</c:otherwise>
			    	</c:choose>		    			    	
				</c:when>
				
				<c:otherwise>
				<tr>
			        <th>대화 상대</th>
			        <th>최근 메시지 전송 시간 (최신 순 정렬)</th>
			        <th>해당글 제목</th>
		    	</tr>
			    	<c:choose>
				    	<c:when test="${fn:length(msglist) eq '0'}">
						    		<tr>
						    			<td colspan="5">해당 쪽지가 없습니다.</td>
						    		</tr>				    		
						</c:when>
						<c:otherwise>
					    	<c:forEach var="msglist" items="${msglist}"> 
						    	<tr>							        
							        <td>
							        	<a href="javascript:messageDetailView('${msglist.msg_sendnick}','${msglist.msg_recivenick}',${msglist.b_idx},${msglist.msg_idx},${msglist.c_num},${msglist.c_idx})">
							        	<c:choose>
								        	<c:when test="${msglist.msg_sendnick eq sessionScope.loginNick}">
								        		${msglist.msg_recivenick}
								        	</c:when>
								        	<c:otherwise>
								        		${msglist.msg_sendnick}
								        	</c:otherwise>
							        	</c:choose>
							        	</a>
							        </td>			        
							        <td>${msglist.msg_date}</td>
							        <c:if test="${msg_category == '견적문의'}">
							        	<td><a href='./estiDetail?b_idx=${msglist.b_idx}&c_num=${msglist.c_num}&c_idx=${msglist.c_idx}' target="_blank"> ${msglist.b_subject}</a> </td>
							        </c:if>
							        <c:if test="${msg_category == '중고거래'}">
							        	<td><a href='./usedDetail?b_idx=${msglist.b_idx}&c_num=${msglist.c_num}&c_idx=${msglist.c_idx}&sendSellmsg=""' target="_blank"> ${msglist.b_subject}</a> </td>
							        </c:if>							        
						    	</tr>
					    	</c:forEach>
				    	</c:otherwise>
			    	</c:choose>
				</c:otherwise>
			</c:choose>		    
		</table>
		</div>
		
		
		<br/>
		<br/>
		<div style="text-align: center;position:absolute;left:46%;bottom:59%;">${paging}11</div>
		<br/>
		<br/>
		
		<div id="hak3">
		<c:choose>
			<c:when test="${msg_category == '0'}">
				<select id = "category">
					<option value="">분류 선택</option> 
					<option value="거래요청">거래요청</option>
					<option value="정정요청">정정요청</option>
					<option value="거래취소">거래취소</option>
					<option value="환불요청">환불요청</option>
					<option value="공지">공지</option>				
				</select>
				<select id = "keyword">
					<option value="">검색 선택</option>				
					<option value="content">쪽지내용</option>								
				</select>				
			</c:when>
						
			<c:otherwise> <!-- 공지가 아닐 때 -->
				<select id = "keyword">
					<option value="">검색 선택</option> 
					<option value="writer">대화상대</option>								
				</select>
			</c:otherwise>
			
		</c:choose>
		
		
		<input type="text" id ="searchtxt" onkeypress="if( event.keyCode==13 ){searchBtn();}"/>
		<a href = "javascript:searchBtn()" id = "searchBtn()"> 검색</a>
		</div>
		<br/>		
	</body>
	<script>
	var msg_category = "${param.msg_category}";
	//메시지 상세보기
	function messageDetailView(msg_sendnick, msg_recivenick, b_idx, msg_idx, c_num, c_idx){		
		var w=window.open('about:blank','','width=500, height=500');
		console.log("msg_sendnick"+msg_sendnick);
		console.log("msg_recivenick"+msg_recivenick);		
		console.log("msg_category"+msg_category);	
		console.log("b_idx"+b_idx);	
			$.ajax({
				type:'post',
				url:'./messageDetailView',
				data:{					
					msg_sendnick : msg_sendnick,
					msg_recivenick : msg_recivenick,
					b_idx : b_idx,
					msg_category : msg_category,
					msg_idx : msg_idx,
					c_num : c_num,
					c_idx : c_idx
				},
				dataType:'json',
				success:function(data){
					console.log("성공시 가져오는 데이터"+data.msg_sendnick+data.msg_category+b_idx);					
					w.location.href ='./messageDetail?msg_sendnick='+data.msg_sendnick+
												'&msg_recivenick='+data.msg_recivenick+
												'&msg_category='+data.msg_category+
												'&msg_idx='+data.msg_idx+
												'&c_num='+data.c_num+
												'&c_idx='+data.c_idx+
												'&b_idx='+b_idx+'';				
				},
				error:function(error){
					alert('실패');
					console.log(error);
				}
				});
		}
	
	
	//검색버튼
	function searchBtn(){			
		console.log("db에 넘어가는 카테고리 이름 : "+msg_category);
		var category = $("#category option:selected").val();
		var keyword = $("#keyword option:selected").val();			
		var searchtxt = $("#searchtxt").val();
		if(msg_category == 0){
			if(category == "" || null && keyword == ""&& searchtxt == ""){
				alert("키워드를 선택해주세요");
			}else if(keyword != "" && searchtxt == ""){
				alert("검색내용을 입력해주세요");
			}else{
				location.href="./messageList?keyword="+keyword+"&searchtxt="+searchtxt+"&category="+category+"&msg_category="+msg_category+"";
			}
		}else{
			if(keyword == "" || null && searchtxt == "" || null){
				alert("키워드를 선택해주세요");
			}else if(keyword != "" && searchtxt == ""){
				alert("검색내용을 입력해주세요");
			}else{
				location.href="./messageList?keyword="+keyword+"&searchtxt="+searchtxt+"&category="+category+"&msg_category="+msg_category+"";				
			}
		}			
	}			
	

       $(document).ready(function(){
           noteChk();
       });
       
       function noteChk(){
           $.ajax({
               
           });
       }       
                //
	</script>
	
</html>