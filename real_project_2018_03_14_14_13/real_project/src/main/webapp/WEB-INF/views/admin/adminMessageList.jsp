<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<html>
	<head>
	<title>쪽지 리스트</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style>
		table, td, th{
            border: 1px solid;
            padding: 5px;
            border-collapse: collapse;
            margin: 8px;
            text-align: center;
        }
        .subject {
		  overflow: hidden; 
		  text-overflow: ellipsis;
		  white-space: nowrap; 
		  width: 200px;
		  height: 20px;
		}
        #hak{
        	position: absolute;
                top:20%;
                margin-left:37%;
        }
        
        #hak3{
        	position: absolute;
        	margin-left: 30%;
        	bottom:45%;
        
        }
	</style>
	
</head>
	<body>
		<jsp:include page="../memberLoginBox.jsp"/>
		<br/>
		<div id="hak">
			<h1><b><a href="./messageList?msg_category=0">쪽지 리스트</a></b></h1>
		</div>
		<br>
		<br>
		<br>
		<div id="hak3">
		<table>			
			<tr>
		        <th>번호</th>
		        <th>상태</th>
		        <th>쪽지 내용</th>
		        <th>보낸이</th>
		        <th>받는이</th>
		        <th>날짜(최신 순)</th>
		        <th>해당 글 상세보기</th>
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
						        <td> <div class="subject">
						        	<a href="javascript:messageDetailView('${msglist.msg_sendnick}','${msglist.msg_recivenick}',${msglist.b_idx},${msglist.msg_idx})">
						        		${msglist.msg_content}
						        	</a>
						        	</div>
						        </td>
						        <td>${msglist.msg_sendnick}</td>
						        <td>${msglist.msg_recivenick}</td>
						        <td>${msglist.msg_date}</td>						        
						        <c:choose>
							        <c:when test="${msglist.c_num == 1}">
							        	<td><div class="subject"><a href='./estiDetail?b_idx=${msglist.b_idx}&c_num=${msglist.c_num}&c_idx=${msglist.c_idx}' target="_blank"> ${msglist.b_subject}</a></div></td>
							        </c:when>
							        <c:when test="${msglist.c_num == 2}">
							        	<td><div class="subject"><a href='./usedDetail?b_idx=${msglist.b_idx}&c_num=${msglist.c_num}&c_idx=${msglist.c_idx}&sendSellmsg=""' target="_blank"> ${msglist.b_subject}</a></div></td>
							        </c:when>
							        <c:otherwise>
							        	<td>연동 글 없음</td>
							        </c:otherwise>
							    </c:choose>   
					    	</tr>
				    	</c:forEach>
			    	</c:otherwise>
		    	</c:choose>	
		</table>
		
		<div style="margin-left: 10%">
		<br/>
		<br/>
		${paging}
		<br/>
		<br/>
		
		<select id = "category">
			<option value="">분류 선택</option> 
			<option value="신고요청">신고요청</option>
			<option value="용달신청">용달신청</option>
			<option value="거래취소">거래취소</option>
			<option value="환불요청">환불요청</option>
			<option value="공지">공지</option>				
		</select>
		<select id = "keyword">
			<option value="">검색 선택</option>				
			<option value="writer">보낸이</option>								
		</select>				
			
		
		
		<input type="text" id ="searchtxt" onkeypress="if( event.keyCode==13 ){searchBtn();}"/>
		<a href = "javascript:searchBtn()" id = "searchBtn()"> 검색</a>
		</div>
		<br/>	
		</div>	
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
		if(category == "" || null && keyword == "" || null && searchtxt == "" || null){
			alert("키워드를 선택해주세요");
		}else if(keyword != "" && searchtxt == ""){
			alert("검색내용을 입력해주세요");
		}else{
			location.href="./messageList?keyword="+keyword+"&searchtxt="+searchtxt+"&category="+category+"&msg_category="+msg_category+"";
		}	
	}	
                
	</script>
	
</html>