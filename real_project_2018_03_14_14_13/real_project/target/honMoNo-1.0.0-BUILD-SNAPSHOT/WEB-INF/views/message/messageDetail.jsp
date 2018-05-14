<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>	
		</style>	
	</head>
	<body>		
		<c:choose>
			<c:when test="${msg_category == '견적문의' or '중고거래'}">
				<form id="msgForm">
				<table>			
					<tr>		
						<c:choose>
							<c:when test="${msg_category == '견적문의'}">
								<td>
									<h1><b>1:1 견적 문의하기</b></h1>
									<input type="hidden" name="b_idx" value="${msg_b_idx}"/>
									<input type="hidden" name="msg_category" value="견적문의"/>
								</td>						
							</c:when>
							<c:otherwise>
								<td>
									<h1><b>1:1 중고거래 문의하기</b></h1>
								</td>
								<input type="hidden" name="b_idx" value="${msg_b_idx}"/>
								<input type="hidden" name="msg_category" value="중고거래"/>
							</c:otherwise>
						</c:choose>
					</tr>
					
					<tr>
						<td>
							<c:choose>
					        	<c:when test="${msg_sendnick eq sessionScope.loginNick}">
					        		${msg_recivenick} 님 과의 쪽지 목록
					        	</c:when>
					        	<c:otherwise>
					        		${msg_sendnick} 님 과의 쪽지 목록
					        	</c:otherwise>
							</c:choose>
							<input type="hidden" name="msg_sendnick" value="${msg_sendnick}"/>
							<input type="hidden" name="msg_recivenick" value="${msg_recivenick}"/>
						</td>				
					</tr>	
					<br/><br/>	
					
					<c:forEach var="msgDlist" items="${msgDlist}">						
						<c:if test="${msgDlist.msg_sendnick == msg_sendnick}">
							<tr align="left">
								<td style="background-color:orange;">${msgDlist.msg_content}</tr>						
							</tr>
							<tr align="left">
								<td style="font-size: 1;">${msgDlist.msg_date}에 받음</td>
							</tr>
						</c:if>
						<c:if test="${msgDlist.msg_sendnick eq sessionScope.loginNick}">
							<tr align="right">
								<td style="background-color:yellow;">${msgDlist.msg_content}</td>						
							</tr>
							<tr align="right">
								<td style="font-size: 1;">${msgDlist.msg_date} 에 보냄</td>
							</tr>
						</c:if>
					</c:forEach>			
						<tr>
							<td>답장 작성하기 : <br/>
								<textarea name="msg_content" placeholder="1.메시지 내용은 1000자 이내만 가능합니다.&#13;&#10; 2.판매자 계좌로 직접 입금시 사기 피해가 발생하고 있사오니 주의하시기 바랍니다. &#13;&#10;3.직거래시 발생하는 피해는 당 사이트에서 책임지지 않습니다."></textarea>
				            </td>
						</tr>			
					<tr align="right">						
						<c:if test="${msgDlist[0].msg_sfdcheck == 'N'}">
							<td><a href='javascript:safeDealForm()'>안전 거래</a></td>
						</c:if>				
						<td><a href='javascript:sendMsg()'>전송</a></td>
					</tr>						
				</table>		
				</form>
			</c:when>
			<c:otherwise>
			<table>
				<tr>
					<td>	
							<h1><b>${messageDto.msg_category}</b></h1>
					</td>
				</tr>
				<c:if test="${messageDto.msg_sendnick ne sessionScope.loginNick}">
					<tr align="left">
						<td style="background-color:orange;">${messageDto.msg_content}</tr>						
					</tr>
					<tr align="left">
						<td style="font-size: 1;">${messageDto.msg_date}에 받음</td>
					</tr>
				</c:if>
				<c:if test="${messageDto.msg_sendnick eq sessionScope.loginNick}">
					<tr align="right">
						<td style="background-color:yellow;">${messageDto.msg_content}</td>						
					</tr>
					<tr align="right">
						<td style="font-size: 1;">${messageDto.msg_date} 에 보냄</td>
					</tr>
				</c:if>
			</table>					
			</c:otherwise>
		</c:choose>		
	</body>
	<script>
		console.log("받아온 배열 : ${msgDlist}");
		console.log("0번쨰 배열에 담긴 sfdcheck : ${msgDlist[0].msg_sfdcheck}")
		
		function safeDealForm(){
			console.log("${b_idx}");
			
			if(confirm("확인시 안전거래를 진행합니다.")==true){
				window.opener.top.location.href="./safeDealFormCall?b_idx=${msg_b_idx}&sfd_sellid=${msg_recivenick}&sfd_buyid=${msg_sendnick}&c_num=${param.c_num}&c_idx=${param.c_idx}&safeFormChk=y";
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