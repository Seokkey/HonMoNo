<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>거래 요청 폼</title>
		<style>
		</style>
	</head>
	<body>
		<h1>거래 요청 내역서</h1>
			<form action="./dealInsert" id="dealInsertForm" method="post">
				<input type="hidden" name="b_idx" value="${param.b_idx}"/>
				<input type="hidden" name="c_num" value="${param.c_num}"/>
				<input type="hidden" name="c_idx" value="${param.c_idx}"/>
				<table id="mytable">			
	                <tr>
	                    <th colspan="6">배송 정보</th>
	                </tr>
					<tr>
						<th>이름: </th>
						<td colspan="5">
							<input type="text" name="sfd_name" placeholder="구매자 이름" required/>
							</td>
					</tr>
					<tr>
						<th>배송 희망일: </th>
						<td colspan="5">
							<input type="hidden" name="sfd_dvdate" value="2018-01-01" required/>
							<div id="dealDateContent" class="dealDateContent">
								<select class="evDateSelectAll" id="dealDateYear" onChange="createDate()">
						    		<option value="2018" selected>2018</option>
									<option value="2019">2019</option>
									<option value="2020">2020</option>
									<option value="2021">2021</option>
									<option value="2022">2022</option>
									<option value="2023">2023</option>
						    	</select>
						    	
						    	<select class="dealDateSelectAll" id="dealDateMonth" onChange="createDate()">
						    		<option value="01">1월</option>
						    		<option value="02">2월</option>
						    		<option value="03">3월</option>
						    		<option value="04">4월</option>
						    		<option value="05">5월</option>
						    		<option value="06">6월</option>
						    		<option value="07">7월</option>
						    		<option value="08">8월</option>
						    		<option value="09">9월</option>
						    		<option value="10">10월</option>
						    		<option value="11">11월</option>
						    		<option value="12">12월</option>
						    	</select>
						    	<select class="dealDateSelectAll" id="dealDateDay" onChange="putDate()"></select>
						    	 
							</div>
						</td>
					</tr>
					<tr>
						<th rowspan="4">배송 주소: </th>
						
					<tr>
						<td colspan="5">
							<input class="w3-input" type="text" id="sample6_postcode" name="sfd_address1" readonly="readonly" placeholder="우편번호" required>
							<input class="w3-input" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" required>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<input class="w3-input" type="text" id="sample6_address" name="sfd_address2" placeholder="주소"  required>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<input class="w3-input" type="text" id="sample6_address2" name="sfd_address3" placeholder="상세주소"  required>
						</td>
					</tr>
					
					<tr>
						<th>연락처 1: </th>
						<td colspan="5">
							<input type="text" id="sfdPhone1" name="sfd_phone1" placeholder="'-'는 제외하고 입력해주세요." required/>
						</td>
					</tr>
					<tr>
						<th>연락처 2: </th>
						<td colspan="5">
							<input type="text" id="sfdPhone2" name="sfd_phone2" placeholder="'-'는 제외하고 입력해주세요." required/>
						</td>
					</tr>
					<tr>
						<th colspan="6">구매 상품</th>
					</tr>
					<tr>
						<th>모델명</th><th>규격</th><th>색상</th><th>수량</th><th>금액</th><th>비고</th>
					</tr>
					<tbody></tbody>
					<tr>
						<th>총 결제 금액 : </th>
						<td colspan="5">
							<input type="text" id="sfdSumprice" name="sfd_sumprice" onchange="sfdSumpricePut()" placeholder="숫자만 입력해주세요." required/>
						</td>
					</tr>
					<tr>
						<th colspan="6">결제방법 : 안전거래</th>					
					</tr>
					<tr>
						<th>기타 특약 사항 : </th>
						<td colspan="5">
							<input type="text" name="sfd_etccontract" placeholder="기타 특약 사항이 있을때만 기입하세요."/>
						</td>
					</tr>
					<tr>
						<th colspan="6">거래 확인</th>
					</tr>
					<tr>
						<th>구매자 : </th>
						<td colspan="5">
							<input type="text" name="sfd_buyid" readonly="readonly" value="${param.sfd_buyid}"/>
						</td>				
					</tr>
					<tr>
						<th>판매자 : </th>
						<td colspan="5">
							<input type="text" name="sfd_sellid" readonly="readonly" value="${param.sfd_sellid}"/>
						</td>
					</tr>
					<tr>
						<th>거래일 : </th>
						<td colspan="5">
							<input type="text" name="sfd_dealdate" readonly="readonly"/>
							
						</td>				
					</tr>
					<tr>
						<td  colspan="6">위 내용은 구매자와 판매자간의 협의가 충분히 되었으며 분쟁 발생시 소비자 보호법에 의거 처리한다.<br/></br></td>
					</tr>				
					<tr>
						<th  colspan="6">안전거래 입금처</th>					
					</tr>
					<tr>
						<td  colspan="6">은행명 : 국민은행<br/>예금주 : 혼수상태<br/>계좌번호 : 000-0000-0000<br/> 입금액 : <b><span id="sfdSumpriceSpan"></span></b>원</td>
					</tr>
				</table>
			<br>
			<input type="button" id="dealInsertBtn" value="거래 요청하기">
			<input type="button" id="btn-add-row" value="구매제품 추가하기"/>
			<input type="button" id="btn-delete-row" value="구매제품 삭제하기"/>
		</form>
		
	</body>
	<script>
		$("#dealInsertBtn").click(function(){
			if($("#sfdPhone1").val().indexOf("-") != -1){
				alert("연락처1의 '-' 을 없애주세요.")
			}else if($("#sfdPhone2").val().indexOf("-") != -1){
				alert("연락처2의 '-' 을 없애주세요.")
			}else{
				$("#dealInsertForm").submit();
			}
			
		});
	
		//오늘날짜 거래일에 넣기
 		var date = new Date()
		toDayYear = date.getFullYear();
		toDayMonth = (date.getMonth() + 1);
		toDayDate = date.getDate();
		
		if(toDayMonth<10){
			toDayMonth = "0"+toDayMonth;
		}
		if(toDayDate<10){
			toDayDate = "0"+toDayDate;
		}
		var toDayDate = toDayYear+"-"+toDayMonth+"-"+toDayDate;
		console.log(toDayDate);
		$("input[name='sfd_dealdate']").val(toDayDate);
		
		
		var dealDate = "";
    	
    	//디폴트 1월 일자 셀렉트박스
    	function dealDateDefault(){
    	    var content = "";
    		$("#dealDateDay").html(content);
    	    for(var i = 1; i<=31;i++){
    	    	if(i<10){
    	    		content += "<option value='0"+i+"'>"+i+"일</option>"
    	    	}else{
    	    		content += "<option value='"+i+"'>"+i+"일</option>"
    	    	}
    	    }
    	    $("#dealDateDay").append(content);
    	}
    	
	    //년,월에 맞춰서 일(日)자 만들기
		function createDate(){
	    	
			var lastDay = (new Date($("#dealDateYear").val(), $("#dealDateMonth").val(), 0)).getDate();
	    	console.log(lastDay);
	 
	    	var content1 = "";
		    for(var i = 1; i<=lastDay;i++){
		    	if(i<10){
		    		content1 += "<option value='0"+i+"'>"+i+"일</option>"
		    	}else{
		    		content1 += "<option value='"+i+"'>"+i+"일</option>"
		    	}
		    }
		    $("#dealDateDay").html(content1);
		    $("#dealDateDay").append(content1);
			
		    putDate();
    	    
	    }
    	
	    //히든에 각 날짜 담는 함수
	    function putDate(){
	    	dealDate = $("#dealDateYear").val()+"-"+$("#dealDateMonth").val()+"-"+$("#dealDateDay").val()
	    	
    	    $("input[name='sfd_dvdate']").val(dealDate);
	    }
		
	    //입금액에 총 결제금액 넣는 함수
	    function sfdSumpricePut(){
	    	 $("#sfdSumpriceSpan").html($("#sfdSumprice").val());
	    }
		
		var cnt =0;//네임 배열 숫자 넣을 변수
		//모델 추가 버튼
		$('#btn-add-row').click(function() {
		    content = "";
			content +="<tr><td><input type='hidden' name='sfd_idx' value='"+b_idx+"'/><input type='text' name='list["+cnt+"].si_model'/></td>";
			content +="<td><input type='text' name='list["+cnt+"].si_size'/></td>";
			content +="<td><input type='text' name='list["+cnt+"].si_color'/></td>";
			content +="<td><input type='text' name='list["+cnt+"].si_amount'/></td>";
			content +="<td><input type='text' name='list["+cnt+"].si_price'/></td>";
			content +="<td><input type='text' name='list["+cnt+"].si_note'/></td></tr>";
		    $('#mytable > tbody:eq(1)').append(content);
		    cnt++;
		  });
		  $('#btn-delete-row').click(function() {
			  console.log("클릭");
		    $('#mytable > tbody:eq(1) > tr:last').remove();
		    cnt--;
		    if(cnt<0){
		    	cnt=0;
		    }
		  });
		  
		    $(document).ready(function(){
		    	dealDateDefault();
		    }); 
		  
/* 	    function add_item(){
	        // pre_set 에 있는 내용을 읽어와서 처리..
	        var div = document.createElement('div');
	        div.innerHTML = document.getElementById('pre_set').innerHTML;
	        document.getElementById('field').appendChild(div);
	    }
	 
	    function remove_item(obj){
	        // obj.parentNode 를 이용하여 삭제
	        document.getElementById('field').removeChild(obj.parentNode);
	    }
	    */

	</script>
</html>