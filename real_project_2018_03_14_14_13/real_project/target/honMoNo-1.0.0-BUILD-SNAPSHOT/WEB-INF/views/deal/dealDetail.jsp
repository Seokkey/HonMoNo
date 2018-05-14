<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
		</style>
		<title>거래 요청 상세보기</title>
	</head>
	<body>
		<h1>거래 요청 내역서</h1>
			<table>			
                <tr>
                    <th colspan="6">배송 정보</th>
                </tr>
				<tr>
					<th>이름: </th>
					<td colspan="5">${sfddto.sfd_name}</td>
				</tr>
				<tr>
					<th>배송 희망일: </th>
					<td colspan="5">${sfddto.sfd_dvdate }</td>
				</tr>
				<tr>
					<th rowspan="4">배송 주소: </th>
				<tr>
					<td colspan="5">${sfddto.sfd_address1 }</td>
				</tr>
				<tr>
					<td colspan="5">${sfddto.sfd_address2 }</td>
				</tr>
				<tr>
					<td colspan="5">${sfddto.sfd_address3 }</td>
				</tr>
				<tr>
					<th>연락처 1: </th>
					<td colspan="5">${sfddto.sfd_phone1 }</td>
				</tr>
				<tr>
					<th>연락처 2: </th>
					<td colspan="5">${sfddto.sfd_phone2 }</td>
				</tr>
				<tr>
					<th colspan="6">제품 구매 내역</th>
				</tr>
				<tr>
					<th>모델명</th><th>규격</th><th>색상</th><th>수량</th><th>금액</th><th>비고</th>
				</tr>				
				<c:forEach items="${sfdInfolist }" var="sfdInfo">
					<tr>
						<td>${sfdInfo.si_model }</td>
						<td>${sfdInfo.si_size }</td>
						<td>${sfdInfo.si_color }</td>
						<td>${sfdInfo.si_amount }</td>
						<td>${sfdInfo.si_price }</td>
						<td>${sfdInfo.si_note}</td>					
					</tr>
				</c:forEach>
				<tr>
					<th>총 결제 금액 : </th>
					<td colspan="5">${sfddto.sfd_sumprice}</td>
				</tr>
				<tr>
					<th colspan="6">결제방법 : 안전거래</th>					
				</tr>
				<tr>
					<th>기타 특약 사항 : </th>
					<td colspan="5">${sfddto.sfd_etccontract }</td>
				</tr>
				<tr>
					<th colspan="6">거래 확인</th>
				</tr>
				<tr>
					<th>구매자 : </th>
					<td colspan="5">${sfddto.sfd_buyid}</td>				
				</tr>
				<tr>
					<th>판매자 : </th>
					<td colspan="5">${sfddto.sfd_sellid }</td>
				</tr>
				<tr>
					<th>거래일 : </th>
					<td colspan="5">${sfddto.sfd_dealdate}</td>				
				</tr>
				<tr>
					<td  colspan="6">위 내용은 구매자와 판매자간의 협의가 충분히 되었으며 분쟁 발생시 소비자 보호법에 의거 처리한다.<br/></br></td>
				</tr>				
				<tr>
					<th  colspan="6">안전거래 입금처</th>					
				</tr>
				<tr>
					<td  colspan="6">은행명 : 국민은행<br/>예금주 : 혼수상태<br/>계좌번호 : 000-0000-0000<br/> 입금액 : ${sfddto.sfd_sumprice}</td>
				</tr>			
			</table>
			
			<c:choose>
			
				<c:when test="${sessionScope.loginRating ==1 && sfddto.sfd_state=='거래요청' || sessionScope.loginRating ==1 && sfddto.sfd_state=='정정요청'}">
					<input type="button" value="수정" onclick="dealModifyStart(${sfddto.sfd_idx})"/>
					<input type="button" value="거래취소" onclick="dealCancel(${sfddto.sfd_idx},'${sfddto.sfd_buyid }','${sfddto.sfd_sellid }',${sfddto.b_idx },'${sfddto.sfd_mdgroup }')"/>
				</c:when>
				
				<c:when test="${sessionScope.loginRating ==1 && sfddto.sfd_state=='입금대기'}">
					<input type="button" value="거래취소" onclick="dealCancel(${sfddto.sfd_idx},'${sfddto.sfd_buyid }','${sfddto.sfd_sellid }',${sfddto.b_idx },'${sfddto.sfd_mdgroup }')"/>
				</c:when>
				
				<c:when test="${sessionScope.loginRating ==2 && sfddto.sfd_state=='거래요청'}">
					<input type="button" value="수락" onclick="dealAgree(${sfddto.sfd_idx},'${sfddto.sfd_buyid }','${sfddto.sfd_sellid }',${sfddto.b_idx },'${sfddto.sfd_mdgroup }')"/>
					<input type="button" value="정정요청" onclick="dealModifyCall(${sfddto.sfd_idx},'${sfddto.sfd_buyid }','${sfddto.sfd_sellid }',${sfddto.b_idx },'${sfddto.sfd_mdgroup }')"/>
					<input type="button" value="거래취소" onclick="dealCancel(${sfddto.sfd_idx},'${sfddto.sfd_buyid }','${sfddto.sfd_sellid }',${sfddto.b_idx },'${sfddto.sfd_mdgroup }')"/>
				</c:when>
				
				<c:when test="${sessionScope.loginRating ==1 && sfddto.sfd_state=='입금완료/배송준비중'}">
					<input type="button" value="환불신청" onclick="dealCancelRequest(${sfddto.sfd_idx}, '${sfddto.sfd_buyid}', '${sfddto.sfd_sellid }',${sfddto.b_idx })"/>
					<input type="button" value="구매확정" onclick="dealConfirm(${sfddto.sfd_idx}, '${sfddto.sfd_buyid}', '${sfddto.sfd_sellid }',${sfddto.b_idx },'${sfddto.sfd_mdgroup }')"/>
				</c:when>
				
				<c:when test="${sessionScope.loginRating ==9 && sfddto.sfd_state=='입금완료/배송준비중'}">
					<input type="button" value="환불신청" onclick="dealCancelRequest(${sfddto.sfd_idx}, '${sfddto.sfd_buyid}', '${sfddto.sfd_sellid }',${sfddto.b_idx })"/>
					<input type="button" value="구매확정" onclick="dealConfirm(${sfddto.sfd_idx}, '${sfddto.sfd_buyid}', '${sfddto.sfd_sellid }',${sfddto.b_idx },'${sfddto.sfd_mdgroup }')"/>
				</c:when>
				
				<c:when test="${sessionScope.loginRating ==1 && sfddto.sfd_state=='환불신청'}">
					<input type="button" value="환불취소" onclick="dealCancelCancel(${sfddto.sfd_idx}, '${sfddto.sfd_buyid}', '${sfddto.sfd_sellid }',${sfddto.b_idx },'${sfddto.sfd_mdgroup }')"/>
				</c:when>
				
				<c:when test="${sessionScope.loginRating ==2 && sfddto.sfd_state=='환불신청'}">
					<input type="button" value="환불수락" onclick="dealCancelAgreeSell(${sfddto.sfd_idx}, '${sfddto.sfd_buyid}', '${sfddto.sfd_sellid }', ${sfddto.b_idx },'${sfddto.sfd_mdgroup }')"/>
				</c:when>
				
				<c:when test="${sessionScope.loginRating==9 && sfddto.sfd_state=='입금대기' }">
					<input type="button" value="입금완료" onclick="payChk(${sfddto.sfd_idx}, '${sfddto.sfd_buyid}', '${sfddto.sfd_sellid }', ${sfddto.b_idx },'${sfddto.sfd_mdgroup }')"/>
				</c:when>
				
				<c:when test="${sessionScope.loginRating ==9 && sfddto.sfd_state=='환불신청'}">
					<input type="button" value="환불수락" onclick="dealCancelAgreeAdmin(${sfddto.sfd_idx}, '${sfddto.sfd_buyid}', '${sfddto.sfd_sellid }',${sfddto.b_idx },'${sfddto.sfd_mdgroup }')"/>
					<input type="button" value="환불취소" onclick="dealCancelCancel(${sfddto.sfd_idx}, '${sfddto.sfd_buyid}', '${sfddto.sfd_sellid }',${sfddto.b_idx },'${sfddto.sfd_mdgroup }')"/>
				</c:when>
				
			</c:choose>
			
	</body>
	<script>
		var sfd_idx = "${sfddto.sfd_idx}";
		
		//판매자가 상태를 정정요청으로 변경
		function dealModifyCall(sfd_idx, sfd_buyid, sfd_sellid, b_idx, sfd_mdgroup){
			
			if(confirm("구매자에게 정정요청을 하시겠습니까? 확인을 누르면 쪽지창이 활성화 됩니다.")==true){
				alert("정정요청이 완료되었습니다.");
				dealModifyMessageDetail(sfd_sellid, b_idx, sfd_mdgroup, sfd_buyid);
				location.href="./dealModifyCall?sfd_idx="+sfd_idx+"&sfd_buyid="+sfd_buyid+"&sfd_sellid="+sfd_sellid+"&b_idx="+b_idx+"&sfd_mdgroup="+sfd_mdgroup+"";
				
			}
			
		}
		
		//메시지 상세보기
		function dealModifyMessageDetail(msg_sendnick, b_idx, sfd_mdgroup,msg_recivenick){		
			var w=window.open('about:blank','','width=500, height=500');
			
				$.ajax({
					type:'post',
					url:'./dealModifyMessageDetail',
					data:{					
						msg_sendnick : msg_sendnick,
						b_idx : b_idx,
						msg_category : sfd_mdgroup,
						msg_recivenick:msg_recivenick
					},
					dataType:'json',
					success:function(data){
						console.log("성공시 가져오는 데이터"+data.msg_sendnick+data.msg_category+b_idx);					
						w.location.href ='./messageDetail?msg_sendnick='+data.msg_sendnick+
													'&msg_category='+data.msg_category+
													'&b_idx='+b_idx+'&msg_recivenick='+msg_recivenick+'';					
					},
					error:function(error){
						alert('실패');
						console.log(error);
					}
					});
			}
		
		//계약서 수정폼으로 이동
		function dealModifyStart(sfd_idx){
			
			$.ajax({
				type:"get",
            	url:"./dealModifyStart",
            	data:{
            		"sfd_idx":sfd_idx
            	},
            	dataType:"html",
            	success:function(data){
            		console.log(data);
            		
            		$("#contents_layer").html(data);
            		
            	},
            	error:function(error){
            		console.log(error);
            	}
			});
			
		}
		
		//판매자가 상태를 입금대기로 변경
		function dealAgree(sfd_idx, sfd_buyid, sfd_sellid, b_idx, sfd_mdgroup){
			
			if(confirm("수락시 수정이 불가능 합니다. 계속 진행하시겠습니까?")==true){
				alert("거래가 수락되었습니다.");
				location.href="./dealAgree?sfd_idx="+sfd_idx+"&sfd_buyid="+sfd_buyid+"&sfd_sellid="+sfd_sellid+"&b_idx="+b_idx+"&sfd_mdgroup="+sfd_mdgroup+"";
			}
		}
		
		//구매자||판매자가 거래취소를 눌러 상태를 취소된 거래로 변경
		function dealCancel(sfd_idx, sfd_buyid, sfd_sellid, b_idx, sfd_mdgroup){
			if(confirm("취소시 되돌릴수 없습니다. 계속 진행하시겠습니까?")==true){
				alert("최소 되었습니다.");
				location.href="./dealCancel?sfd_idx="+sfd_idx+"&sfd_buyid="+sfd_buyid+"&sfd_sellid="+sfd_sellid+"&b_idx="+b_idx+"&sfd_mdgroup="+sfd_mdgroup+"";
			}
		}
		
		//판매자가 환불 수락을 누름
		function dealCancelAgreeSell(sfd_idx, sfd_buyid, sfd_sellid, b_idx, sfd_mdgroup){
			if(confirm("환불 수락시 되돌릴수 없으며 관리자에게 환불요청이 갑니다. 계속 진행하시겠습니까?")==true){
				alert("환불 수락 되었습니다.");
				location.href="./dealCancelAgreeSell?sfd_idx="+sfd_idx+"&sfd_buyid="+sfd_buyid+"&sfd_sellid="+sfd_sellid+"&b_idx="+b_idx+"&sfd_mdgroup="+sfd_mdgroup+"";
			}
		}
		
		//관리자가 환불 수락을 누름
		function dealCancelAgreeAdmin(sfd_idx, sfd_buyid, sfd_sellid, b_idx, sfd_mdgroup){
			if(confirm("환불 수락시 되돌릴수 없습니다. 계속 진행하시겠습니까?")==true){
				alert("환불 되었습니다.");
				location.href="./dealCancelAgreeAdmin?sfd_idx="+sfd_idx+"&sfd_buyid="+sfd_buyid+"&sfd_sellid="+sfd_sellid+"&b_idx="+b_idx+"&sfd_mdgroup="+sfd_mdgroup+"";
			}
		}
		
		//관리자가 소비자의 입금을 확인
		function payChk(sfd_idx, sfd_buyid, sfd_sellid, b_idx, sfd_mdgroup){
			if(confirm("입금완료 처리시 판매자에게 쪽지로 알림이 갑니다. 계속 진행하시겠습니까?")==true){
				location.href="./payChk?sfd_idx="+sfd_idx+"&sfd_buyid="+sfd_buyid+"&sfd_sellid="+sfd_sellid+"&b_idx="+b_idx+"&sfd_mdgroup="+sfd_mdgroup+"";
			}
		}
		
		//소비자||구매자가 환불버튼을 누름
		function dealCancelRequest(sfd_idx, sfd_buyid, sfd_sellid, b_idx){
			if(confirm("환불이 진행됩니다. 계속 진행하시겠습니까?")==true){
				location.href="./dealCancelRequest?sfd_idx="+sfd_idx+"&sfd_buyid="+sfd_buyid+"&sfd_sellid="+sfd_sellid+"&b_idx="+b_idx+"";
			}
		}
		//구매자||관리자가 구매확정 버튼을 누름
		function dealConfirm(sfd_idx, sfd_buyid, sfd_sellid, b_idx, sfd_mdgroup){
			if(confirm("구매확정이 완료됩니다. 계속 진행하시겠습니까?")==true){
				location.href="./dealConfirm?sfd_idx="+sfd_idx+"&sfd_buyid="+sfd_buyid+"&sfd_sellid="+sfd_sellid+"&b_idx="+b_idx+"&sfd_mdgroup="+sfd_mdgroup+"";
			}
		}
		
		//소비자||관리자가 환불을 취소
		function dealCancelCancel(sfd_idx, sfd_buyid, sfd_sellid, b_idx, sfd_mdgroup){
			if(confirm("환불취소시 입금완료/배송준비중 상태로 되돌아갑니다. 계속 진행하시겠습니까?")==true){
				location.href="./dealCancelCancel?sfd_idx="+sfd_idx+"&sfd_buyid="+sfd_buyid+"&sfd_sellid="+sfd_sellid+"&b_idx="+b_idx+"&sfd_mdgroup="+sfd_mdgroup+"";
			}
		}
		
	</script>
</html>