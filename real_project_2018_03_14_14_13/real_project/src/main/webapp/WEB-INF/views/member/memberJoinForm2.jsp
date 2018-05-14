<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>  -->
		<script src="http://code.jquery.com/jquery-latest.js"></script>  
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
		
		<title>회원가입 폼</title>
		</head>
		
		<body>
		<jsp:include page="../memberLoginBox.jsp"/>
		<br/><br/>		
			<div class="w3-content w3-container w3-margin-top">
				<div class="w3-container w3-card-4">
					<div class="w3-center w3-large w3-margin-top">
						<h3>혼모노 회원가입</h3>
					</div>
					<div>
						<form id="memberJoinForm" action="./memberInsert?m_rating=3" method="post" >
							<input type="hidden" name="m_agree" value="${m_agree }">
							<p>
								<label>아이디</label> 
								<input class="w3-input" type="text" id="mId" name="m_id" placeholder="이메일 형식으로 작성해주세요." required> 
								<span id="id_check" class="w3-text-green"></span>
							
							</p>
							
						
							
							 <p>
								<label>닉네임</label>
								<input type="text" id="mNick" name="m_nick" class="w3-input" required placeholder="2~8자 이내로 작성해주세요.">
								<span id="nick_check" class="w3-text-green"></span>
							</p> 
							<p>
								<label>비밀번호</label> 
								<input  id="mPass" name="m_pass" type="password" placeholder="영문 숫자를 조합해 8자리 이상 12자리 미만으로 작성해주세요." required class="pass w3-input"  oninput="checkPwd()">
							</p>
							<p>
								<label>비밀번호 확인</label> 
								<input  id="mPass2" name="m_pass2" type="password" required class="pass w3-input"  oninput="checkPwd()">
							</p>
							
							<p>
								<label>사업자 이름</label> 
								<input class="w3-input" id="mName" name="m_name" type="text" required>
							</p>
							
							<p>
								<label>매장 주소</label> 
								
								<input class="w3-input" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"  required><br>
								<input class="w3-input" type="text" id="sample6_postcode" name="m_address1" readonly="readonly" placeholder="우편번호"  required>
								<input class="w3-input" type="text" id="sample6_address" name="m_address2" placeholder="주소"  required>
								<input class="w3-input" type="text" id="sample6_address2" name="m_address3" placeholder="상세주소"  required>
							</p>
							
							<p>
								<label>전화번호</label> 
								<input class="w3-input" id="mPhone" name="m_phone" type="text" required>
							</p>
							
							<p>
								<label>사업자 등록번호</label> 
								<input class="w3-input" type="text" id="msConum" name="ms_conum" placeholder="'-' 제외하고 10자리만 입력해주세요." required> 
								<input class="w3-input" id="ms_conumBtn" type="button" value="중복검사"  required><br>
							</p>
							 <p>
								<label>대표자이름</label>
								<input type="text" id="ms_ceoname" name="ms_ceoname" class="w3-input" required placeholder="2~8자 이내로 작성해주세요.">
								<span id="nick_check" class="w3-text-red"></span>
							</p> 
							<p>
								<label>매장이름</label> 
								<input class="w3-input" id="ms_shopname" name="ms_shopname" type="text" placeholder="" required>
							</p>
							<p>
								<label>매장 연락처</label> 
								<input class="w3-input" id="ms_phone" name="ms_phone" type="text" required>
							</p>
							<p>
								<label>브랜드</label> 
								<input class="w3-input" id="ms_brand" name="ms_brand" type="text" required>
							</p>
							
							<%-- <jsp:include page="memberJoinForm3.jsp"></jsp:include> --%>
							
								<%-- <input type="hidden" name="membernum" value="${membernum}"/> --%>
							<p class="w3-center">
								<button type="submit" id="joinBtn" value="1" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">가입하기</button>
								<button type="button" onclick=" location.href='./'" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소하기</button>
							</p>
							
							
						</form>
					</div>
				</div>
			</div>
		</body>
		<script>
			//비밀번호 확인여부 활성화&비활성화
			function checkPwd() {
			    var inputed = $('.pass').val();
			    var reinputed = $('#mPass2').val();
			    if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){
			        $("#mPass2").css("background-color", "#FFCECE");
			       	return false;
			    }else if (inputed !== reinputed) {
			    	$("#mPass2").css("background-color", "#FFCECE");
					
			    }else if (inputed = reinputed) {
			        $("#mPass2").css("background-color", "#B0F6AC");
			        
			    }
			}
			
			
				$(function(){
					$("#joinForm").submit(function(){
						if($("#mPass").val() !== $("#mPass2").val()){
							alert("비밀번호가 다릅니다.");
							$("#mPass").val("").focus();
							$("#mPass2").val("");
							return false;
						}else if ($("#mPass").val().length < 8 || $("#mPass").val().length > 13) {
							alert("비밀번호는 8자 이상 12자 이하로 설정해야 합니다.");
							$("#mPass").val("").focus();
							return false;
						}else if($.trim($("#mPass").val()) !== $("#mPass").val() || $.trim($("#mNick").val()) !== $("#mNick").val() || $.trim($("#mId").val()) !== $("#mId").val()){
							alert("공백은 입력이 불가능합니다.");
							return false;
						}else if($("#co_check").val().length != 10){
							alert("사업자번호는 '-' 제외하고 10자리만 가능합니다.");
							return false;
						}else if($("#mPhone").val().indexOf("-") != -1){
							alert("전화번호는 '-' 을 제외하고 입력해주세요.");
							return false;
						}
					})
					
					$("#mId").keyup(function() {
				
						 $.ajax({
							url : "./idChk",
							type : "POST",
							data : {
								m_id : $("#mId").val()
								
							},
							success : function(result) {
								if (result == 1) {
									$("#id_check").html("중복된 아이디가 있습니다.");
									$("#joinBtn").attr("disabled", "disabled");
								}  else {
									$("#id_check").html("사용가능한 아이디 입니다.");
									$("#joinBtn").removeAttr("disabled");
								} 
							},
							
						})
					});
					
					$("#mNick").keyup(function(){
						$.ajax({
							url : "./nickChk",
							type : "POST",
							data : {
								m_nick : $("#mNick").val()
							},
							success : function(result) {
								if (result == 1) {
									$("#nick_check").html("중복된 닉네임이 있습니다.");
								} else {
									$("#nick_check").html("사용가능한 닉네임 입니다.");
								}
							},
						})
					});
				})
				
				$("#ms_conumBtn").click(function(){
					if($("#msConum").val().length != 10){
						alert("사업자번호는 10자리만 가능합니다.");
					}else{
						$.ajax({
							type:"post",
							url:"./conumChk",
							data:{
								ms_conum:$("#msConum").val()
							},
							dataType:"json",
							success:function(data){
								console.log(data);
								
								if(data == 0){
									alert("등록 가능한 사업자번호 입니다.");
								}else{
									alert("이미 등록된 사업자 번호가 있습니다.");
								}
								
							},
							error:function(error){
								console.log(error);
							}
						});
					}
				});

				
					//다음 api 스크립트
					function sample6_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var fullAddr = ''; // 최종 주소 변수
			                var extraAddr = ''; // 조합형 주소 변수
			
			                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    fullAddr = data.roadAddress;
			
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    fullAddr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			                if(data.userSelectedType === 'R'){
			                    //법정동명이 있을 경우 추가한다.
			                    if(data.bname !== ''){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있을 경우 추가한다.
			                    if(data.buildingName !== ''){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
			                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
			                document.getElementById('sample6_address').value = fullAddr;
			
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById('sample6_address2').focus();
			            }
			        }).open();
			    }
		</script>
</html>
