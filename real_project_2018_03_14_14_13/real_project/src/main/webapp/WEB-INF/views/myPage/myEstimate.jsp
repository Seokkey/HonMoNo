<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
	<style>
		table, td, th{
            border: 1px solid;
            padding: 5px;
            border-collapse: collapse;
            margin: 8px;
            text-align: center;
        }
        #articleView_layer {
			   display:none;position:fixed;
			   position:absolute;top:0;left:0;
			   width:100%;height:100%;
		    }
			#articleView_layer.open {
		  		display:block;color:red;
			}
		  	#articleView_layer #bg_layer {
		      position:absolute;top:0;left:0;
		      width:100%;height:100%;background:#000;
		      opacity:.5;filter:alpha(opacity=50);z-index:100;
			}
		  	#contents_layer { 
			  	position:absolute;top:20%;left:40%;
			    width:700px;height:700px;margin:-150px 0 0 -194px;
			    padding:28px 28px 0 28px;border:2px solid #555;
			    background:#fff;font-size:12px;z-index:200;
			    color:#767676;line-height:normal;white-space:normal;
			    overflow:scroll;
		    }
		    
		    #hak1{
		    	position: absolute;
		    	left: 37%;
		    	bottom: 50%;
		    	
		    
		    }
	</style>
	
</head>
	<body>
		<br/><br/><br/>
		<jsp:include page="../memberLoginBox.jsp"/>
		
		<br/>
		<br/>
		
		
		<!-- light box Div -->
		<div id="articleView_layer">
			<div id="bg_layer"></div>
			<div id="contents_layer"></div>
		</div>
		<div id="hak1">
		<h1>내 거래내역</h1>
		<table>
		    <tr>
		        <th>분류</th>
		        <th>브랜드</th>
		        <th>제품</th>
		        <th>거래자</th>
		        <th>배송 희망일</th>
		        <th>진행상태/상세보기</th>
		    </tr>
		    <tbody id="SafeDeal"></tbody>
		</table>
		<input id="toMainBtn" type="button" value="메인으로"/>
		</div>
	</body>
	<script>
		var blank="";
		var safeFormChk = "${param.safeFormChk}";
		var sfd_sellid = "${param.sfd_sellid}";
		var sfd_buyid = "${param.sfd_buyid}";
		var c_idx="${categorydto.c_idx}"
		var c_num="${categorydto.c_num}"
		var b_idx = "${param.b_idx}"
		console.log(b_idx);
		
		//안전거래 폼 팝업 체크
		if(safeFormChk =="y"){
			safeDealFormPopUp(sfd_sellid, sfd_buyid, c_idx, c_num, b_idx);
		}else{
			console.log("n");
		}
		
		function safeDealFormPopUp(sfd_sellid, sfd_buyid, c_idx, c_num, b_idx){
			
			$("#articleView_layer").addClass("open");
	        	
        	$.ajax({
            	type:"post",
            	url:"./safeDealFormPopUp",
            	data:{
            		"sfd_sellid":sfd_sellid,
            		"sfd_buyid":sfd_buyid,
            		"b_idx":b_idx,
            		"c_idx":c_idx,
            		"c_num":c_num
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
		
		//리스트 데이터 호출하는 함수
        function estimateChk(){
            $.ajax({
            	type:"get",
            	url:"./myTradeList",
            	dataType:"json",
            	success:function(data){
            		console.log(data);
            		
            		makeSDealList(data);
            		
            	},
            	error:function(error){
            		console.log(error);
            	}
            });
        }
        
        function makeSDealList(data){
        	
			var contents ="";//리스트 모양을 담을 변수
			
			if(data.tlist.length>0){//안전거래 리스트가 있을 때
				var sfd_mdgroupNum =0;
				for(var i=0;i<data.tlist.length;i++){
					if(data.tlist[i].sfd_mdgroup=='견적문의'){
						sfd_mdgroupNum=1;
					}else{
						sfd_mdgroupNum=2;
					}
					
					
					contents += "<tr id='rmv"+i+"'>";
					contents += "<td>"+data.tlist[i].sfd_mdgroup+"</td>";
					contents += "<td>"+data.tlist[i].sfd_brand+"</td>";
					contents += "<td>"+data.tlist[i].sfd_product+"</td>";
					contents += "<td>"+data.tlist[i].sfd_sellid+"</td>";
					contents += "<td>"+data.tlist[i].sfd_dvdate+"</td>";
					contents += "<td>"+data.tlist[i].sfd_state+"<br/><input type='button' value='상세보기' onclick='detailPopUp("+data.tlist[i].sfd_idx+","+data.tlist[i].b_idx+","+sfd_mdgroupNum+")'/></td>";
				}
			
			}else{//회원 리스트가 없을 때
				contents = "<tr><td colspan='6'>내 거래내역이 없습니다.</td></tr>";
			}
			$("#SafeDeal").html(blank);
			$("#SafeDeal").append(contents);
        }
        
      //lightBox 해제
 /*     	var layerWindow = $("#articleView_layer");
    	layerWindow.find("#bg_layer").on("mousedown", function(e){
    		console.log(e);
    		layerWindow.removeClass("open");
    		location.reload();
    		return;
    	}); 
    	 
		function popClose(){
			$("#articleView_layer").removeClass("open");
			window.location.reload();
		}
		*/
		
 		$("#bg_layer").click(function (){
			$("#articleView_layer").removeClass("open");
			if(safeFormChk =="y"){
				location.href="./myEstimate";
			}
		}); 
    	
        
        function detailPopUp(sfd_idx, b_idx, sfd_mdgroupNum){
        	$("#articleView_layer").addClass("open");
        	var sfd_mdgroup ="";
        	if(sfd_mdgroupNum==1){
        		sfd_mdgroup="견적문의";
        	}else{
        		sfd_mdgroup="중고거래";
        	}
        	
        	$.ajax({
            	type:"post",
            	url:"./detailPopUp",
            	data:{
            		"sfd_idx":sfd_idx,
            		"b_idx":b_idx,
            		"sfd_mdgroup":sfd_mdgroup
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
        
        $("#toMainBtn").click(function() {
			location.href="./"
		});
        
        $(document).ready(function(){
            estimateChk();
            //safeFormChkk();
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
