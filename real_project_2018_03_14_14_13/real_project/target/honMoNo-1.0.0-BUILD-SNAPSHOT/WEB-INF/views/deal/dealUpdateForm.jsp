<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
		</style>
		<title>거래 요청 상세보기</title>
	</head>
	<body>
		<h1>거래 요청 내역서</h1>
			<form id="dealUpdate" action="./dealUpdate" method="post">
				<table>			
					<input type="hidden" name="sfd_idx" value="${sfddto.sfd_idx}"/>
					<input type="hidden" name="sfd_mdgroup" value="${sfddto.sfd_mdgroup}"/>
					<input type="hidden" name="si_idx" value="${sfddto.si_idx}"/>
	                <tr>
	                    <th colspan="6">배송 정보</th>
	                </tr>
					<tr>
						<th>이름: </th>
						<td colspan="5">
							<input type="text" name="sfd_name" value="${sfddto.sfd_name}"/>
						</td>
					</tr>
					<tr>
						<th>배송 희망일: </th>
						<td colspan="5">
							<input type="text" name="sfd_dvdate" value="${sfddto.sfd_dvdate }"/>
						</td>
					</tr>
					<tr>
						<th rowspan="4">배송 주소: </th>
					<tr>
						<td colspan="5">
							<input type="text" name="sfd_address1" value="${sfddto.sfd_address1 }"/>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<input type="text" name="sfd_address2" value="${sfddto.sfd_address2 }"/>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<input type="text" name="sfd_address3" value="${sfddto.sfd_address3 }"/>
						</td>
					</tr>
					<tr>
						<th>연락처 1: </th>
						<td colspan="5">
							<input type="text" name="sfd_phone1" value="${sfddto.sfd_phone1 }"/>
						</td>
					</tr>
					<tr>
						<th>연락처 2: </th>
						<td colspan="5">
							<input type="text" name="sfd_phone2" value="${sfddto.sfd_phone2 }"/>
						</td>
					</tr>
					<tr>
						<th colspan="6">제품 구매 내역</th>
					</tr>
					<tr>
						<th>모델명</th><th>규격</th><th>색상</th><th>수량</th><th>금액</th><th>비고</th>
					</tr>
					<c:forEach var="sfdInfo" items="${sfdInfolist}" varStatus="status">
						<input type="hidden" name="list[${status.index }].si_idx" value="${sfdInfo.si_idx }"/>
						<tr>
							<td>
								<input type="text" name="list[${status.index }].si_model" value="${sfdInfo.si_model }"/>
							</td>
 							<td>
								<input type="text" name="list[${status.index }].si_size" value="${sfdInfo.si_size }"/>
							</td>
							<td>
								<input type="text" name="list[${status.index }].si_color" value="${sfdInfo.si_color }"/>
							</td>
							<td>
								<input type="text" name="list[${status.index }].si_amount" value="${sfdInfo.si_amount }"/>
							</td>
							<td>
								<input type="text" name="list[${status.index }].si_price" value="${sfdInfo.si_price }"/>
							</td>
							<td>
								<input type="text" name="list[${status.index }].si_note" value="${sfdInfo.si_note}"/>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<th>총 결제 금액 : </th>
						<td colspan="5">
							<input type="text" id="sfdSumprice" name="sfd_sumprice" value="${sfddto.sfd_sumprice}" onchange="sfdSumpricePut()"/>
						</td>
					</tr>
					<tr>
						<th colspan="6">결제방법 : 안전거래</th>					
					</tr>
					<tr>
						<th>기타 특약 사항 : </th>
						<td colspan="5">
							<input type="text" name="sfd_etccontract" value="${sfddto.sfd_etccontract }"/>
						</td>
					</tr>
					<tr>
						<th colspan="6">거래 확인</th>
					</tr>
					<tr>
						<th>구매자 : </th>
						<td colspan="5">
							<input type="text" name="sfd_buyid" value="${sfddto.sfd_buyid}"/>
						</td>				
					</tr>
					<tr>
						<th>판매자 : </th>
						<td colspan="5">
							<input type="text" name="sfd_sellid" value="${sfddto.sfd_sellid }"/>
						</td>
					</tr>
					<tr>
						<th>거래일 : </th>
						<td colspan="5">
							<input type="text" name="sfd_dealdate" value="${sfddto.sfd_dealdate}"/>
						</td>				
					</tr>
					<tr>
						<td  colspan="6">위 내용은 구매자와 판매자간의 협의가 충분히 되었으며 분쟁 발생시 소비자 보호법에 의거 처리한다.<br/></br></td>
					</tr>				
					<tr>
						<th  colspan="6">안전거래 입금처</th>					
					</tr>
					<tr>
						<td  colspan="6">은행명 : 국민은행<br/>예금주 : 혼수상태<br/>계좌번호 : 000-0000-0000<br/> 입금액 :  <b><span id="sfdSumpriceSpan">${sfddto.sfd_sumprice}</span></b>원</td>
					</tr>			
				</table>
				
				<input type="button" value="확인" onclick="dealUpdate()"/>
				<input type="button" value="취소" onclick="detailPopUp(${sfddto.sfd_idx},${sfddto.b_idx})"/>
	</body>
	<script>
		var sfd_idx = "${sfddto.sfd_idx}"
		
	    //입금액에 총 결제금액 넣는 함수
	    function sfdSumpricePut(){
	    	 $("#sfdSumpriceSpan").html($("#sfdSumprice").val());
	    }
		
		//수정 확인버튼 누름
		function dealUpdate(){
			alert("수정한 내용이 판매자에게 전달됩니다.");
			$("#dealUpdate").submit();
		}
		
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
		
	</script>
</html>