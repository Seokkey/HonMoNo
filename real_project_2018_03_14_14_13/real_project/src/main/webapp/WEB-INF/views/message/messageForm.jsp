<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>쪽지 보내기</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	</head>
	
	<body>
		<form id="msgForm" >
		<table>
			<!-- 모든 쪽지에서 공통으로 사용하고 분기에 따라 내용 바뀌게 조건 추가  -->
			<tr>		
				<c:choose>
					<c:when test="${categoryDto.c_num == 1}">
						<td>
							<h1><b>1:1 견적 문의하기</b></h1>
							<input type="hidden" name="b_idx" value="${b_idx}"/>
							<input type="hidden" name="msg_category" value="견적문의"/>
						</td>						
					</c:when>
					<c:when test="${categoryDto.c_num == 2}">
						<td>
							<h1><b>1:1 중고거래 문의하기</b></h1>
						</td>
						<input type="hidden" name="b_idx" value="${b_idx}"/>
						<input type="hidden" name="msg_category" value="중고거래"/>
					</c:when>
					<c:when test="${sessionScope.loginRating == 9}">
						<td>
							<h1><b>공지 전송</b></h1>
						</td>
						<input type="hidden" name="b_idx" value=0/>
						<input type="hidden" name="msg_category" value="0"/>
					</c:when>
					<c:when test='${!empty messageDto.msg_category}'>
						<td>
							<h1><b>${messageDto.msg_category}</b></h1>
						</td>
						<input type="hidden" name="b_idx" value="${b_idx}"/>
						<input type="hidden" name="msg_category" value="${messageDto.msg_category}"/>
					</c:when>
				</c:choose>
			</tr>
			<c:choose>
				<c:when test="${messageDto.msg_category == '신고요청'}">
					<tr>
						<td>받는사람 : <input type="text" readonly="readonly" name="msg_recivenick" value="${messageDto.msg_recivenick}"/></td>
						</tr>
						<tr>
							<td>내용 : <br/>
								<textarea name="msg_content" placeholder="신고사유는 가급적 정확히 기재해 주시기 바랍니다. &#13;&#10; 합당한 신고 사유가 아닐시 이용에 제한이 있으니 주의해 주시기 바랍니다. "></textarea>
				            </td>
						</tr>
						<tr>
							<td>보내는 사람 : <input type="text" readonly="readonly" name="msg_sendnick" value="${messageDto.msg_sendnick}"/></td>				
					</tr>
				</c:when>
				<c:when test="${messageDto.msg_category == '용달신청'}">
					<tr>
						<td>받는사람 : <input type="text" readonly="readonly" name="msg_recivenick" value="${messageDto.msg_recivenick}"/></td>
						</tr>
						<tr>
							<td>내용 : <br/>
								<textarea name="msg_content">
									1.배송 출발 지역 : ex) 서울 구로구 구로동 11번지 
									
									2.배송 도착 지역 : ex) 인천 남동구 학익동 20번지 
					
									3.제품 종류 : ex) 시몬스 라지킹 침대 1조, 장롱 10자 1개, 화장대 5자 2개
									
									
									 
									4.배송희망일 : ex) 2018년 3월 14일	
								</textarea>
				            </td>
						</tr>
						<tr>
							<td>보내는 사람 : <input type="text" readonly="readonly" name="msg_sendnick" value="${messageDto.msg_sendnick}"/></td>				
					</tr>
				</c:when>
				<c:otherwise>			
					<c:choose>
						<c:when test="${u_bors == 'sell'}">
							<tr>
								<td>받는사람 : <input type="text" readonly="readonly" name="msg_recivenick" value="${messageDto.msg_sendnick}"/></td>
							</tr>
							<tr>
								<td>내용 : <br/>
									<textarea name="msg_content" placeholder="1.메시지 내용은 1000자 이내만 가능합니다.&#13;&#10; 2.판매자 계좌로 직접 입금시 사기 피해가 발생하고 있사오니 주의하시기 바랍니다. &#13;&#10;3.직거래시 발생하는 피해는 당 사이트에서 책임지지 않습니다."></textarea>
					            </td>
							</tr>
							<tr>
								<td>보내는 사람 : <input type="text" readonly="readonly" name="msg_sendnick" value="${messageDto.msg_recivenick}"/></td>				
							</tr>
						</c:when>
						
						<c:otherwise>
							<tr>
							<td>받는사람 : <input type="text" readonly="readonly" name="msg_recivenick" value="${messageDto.msg_recivenick}"/></td>
							</tr>
							<tr>
								<td>내용 : <br/>
									<textarea name="msg_content" placeholder="1.메시지 내용은 1000자 이내만 가능합니다.&#13;&#10; 2.판매자 계좌로 직접 입금시 사기 피해가 발생하고 있사오니 주의하시기 바랍니다. &#13;&#10;3.직거래시 발생하는 피해는 당 사이트에서 책임지지 않습니다."></textarea>
					            </td>
							</tr>
							<tr>
								<td>보내는 사람 : <input type="text" readonly="readonly" name="msg_sendnick" value="${messageDto.msg_sendnick}"/></td>				
							</tr>
						</c:otherwise>
					</c:choose>
				</c:otherwise>					
			</c:choose>	
					
			<tr align="right">
			<c:if test="${empty messageDto.msg_category}">
				<td><a href='javascript:safeDealForm()'>안전거래</a></td>
			</c:if>	
				<td><a href='javascript:sendMsg()'>전송</a></td>
			</tr>						
		</table>		
		</form>				
	</body>
	<script>
		if("${b_idx}" != null){
			if('${u_bors}' == 'sell'){
				alert("${messageDto.msg_sendnick} 님과 쪽지가 연결되었습니다.");
			}else{
				alert("${messageDto.msg_recivenick} 님과 쪽지가 연결되었습니다.");
			}												
		}	
	
		function safeDealForm(){
			console.log("${b_idx}");
			console.log("${categoryDto.c_num}");
			console.log("${categoryDto.c_idx}");
			
			if(confirm("확인시 안전거래를 진행합니다.")==true){
				window.opener.top.location.href="./safeDealFormCall?b_idx=${b_idx}&sfd_sellid=${messageDto.msg_recivenick}&sfd_buyid=${messageDto.msg_sendnick}&c_num=${categoryDto.c_num}&c_idx=${categoryDto.c_idx}&safeFormChk=y";
			}
			
		}
		
		//쪽지 전송
		function sendMsg(){
			if($("textarea").val() == "" ){
				alert("메시지를 입력해 주세요.");				
			}else if($("textarea").val().length > 1000 ){
				alert("1000자 이내로 입력해 주십시오.");				
			}else{				
			    var messageDto = $("#msgForm").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
			    console.log("전송할 파라메터"+messageDto);
			    $.ajax({
			        url: './sendMsg',
			        type: 'POST',
			        data:messageDto,
			        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			        dataType: 'json',
			        success: function (data) {
			            alert("메시지가 전송되었습니다.");
			            window.close();
			        },
			        error:function(error){
						alert('전송 실패');
						console.log(error);
					}
			    });
			}							
		}		
		
	</script>
</html>