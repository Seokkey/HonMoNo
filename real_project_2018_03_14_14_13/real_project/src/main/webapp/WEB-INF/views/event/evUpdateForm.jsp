<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<style>
		</style>
	</head>
	<body>
	<form id="evForm" action="./evUpdate?c_idx=${param.c_idx }&c_num=${param.c_num}&b_idx=${boarddto.b_idx}" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						제목 :  <input type="text" name="b_subject" value="${boarddto.b_subject }"/>
					</td>
				</tr>
				<tr>
					<td>
					기간 : 
						<input type="hidden" id="evStart" name="ev_start" value="${boarddto.ev_start }"/>
					<input type="hidden" id="evEnd" name="ev_end" value="${boarddto.ev_end }"/>
					<div id="evDateContent" class="evDateContentAll">
						<select class="evDateSelectAll" id="evDateYear1" onChange="createDate(1)">
				    		<option id="ys2018" value="2018">2018</option>
							<option id="ys2019" value="2019">2019</option>
							<option id="ys2020" value="2020">2020</option>
							<option id="ys2021" value="2021">2021</option>
							<option id="ys2022" value="2022">2022</option>
							<option id="ys2023" value="2023">2023</option>
				    	</select>
				    	
				    	<select class="evDateSelectAll" id=evDateMonth1 onChange="createDate(1)">
				    		<option id="ms01" value="01">1월</option>
				    		<option id="ms02" value="02">2월</option>
				    		<option id="ms03" value="03">3월</option>
				    		<option id="ms04" value="04">4월</option>
				    		<option id="ms05" value="05">5월</option>
				    		<option id="ms06" value="06">6월</option>
				    		<option id="ms07" value="07">7월</option>
				    		<option id="ms08" value="08">8월</option>
				    		<option id="ms09" value="09">9월</option>
				    		<option id="ms10" value="10">10월</option>
				    		<option id="ms11" value="11">11월</option>
				    		<option id="ms12" value="12">12월</option>
				    	</select>
				    	<select class="evDateSelectAll" id=evDateDay1 onChange="putDate()"></select>
				    	 ~ 
				    	<select class="evDateSelectAll" id="evDateYear2" onChange="createDate(2)">
				    		<option id="ye2018" value="2018">2018</option>
							<option id="ye2019" value="2019">2019</option>
							<option id="ye2020" value="2020">2020</option>
							<option id="ye2021" value="2021">2021</option>
							<option id="ye2022" value="2022">2022</option>
							<option id="ye2023" value="2023">2023</option>
				    	</select>
				    	
				    	<select class="evDateSelectAll" id=evDateMonth2 onChange="createDate(2)">
				    		<option id="me01" value="01">1월</option>
				    		<option id="me02" value="02">2월</option>
				    		<option id="me03" value="03">3월</option>
				    		<option id="me04" value="04">4월</option>
				    		<option id="me05" value="05">5월</option>
				    		<option id="me06" value="06">6월</option>
				    		<option id="me07" value="07">7월</option>
				    		<option id="me08" value="08">8월</option>
				    		<option id="me09" value="09">9월</option>
				    		<option id="me10" value="10">10월</option>
				    		<option id="me11" value="11">11월</option>
				    		<option id="me12" value="12">12월</option>
				    	</select>
				    	<select class="evDateSelectAll" id=evDateDay2 onChange="putDate()"></select>
					</div>
					</td>
				</tr>
		<tr>
				<td>매장 대표 사진 : 
					
					<div>
				        <h2><b>대표 이미지 미리보기</b></h2>
				        <p class="title">다중 이미지 업로드</p>
				        <input type="file" id="input_img"  accept=".jpg,.png,.gif,.tif,.tiff" name="imgfile" onchange="fileCheck(this)" />
				        <input type="hidden" id="fileChk" name="filechk" value="1"/>
				        <input type="button" value="취소" onclick="javascript:cancel(1)" id="imgclean"/>
				    </div>
				 
				    <div>
				        <div id="imgs_wrap1">
				            <c:forEach items="${photo }" var="photo">
								<c:if test="${photo.p_thum == 'Y' }">
									<div  class="mySlides fade">
										<img class="image" height="30%" src="${photo.p_path}${photo.p_newname}" width="40%"/>
									</div>
								</c:if>
							</c:forEach>
				        </div>
				    </div>
			
				</td>			
			</tr>
			
			<tr>
				<td>매장 내부 사진 :						
					<div>
				        <h2><b>이미지 미리보기</b></h2>
				        <p class="title">다중 이미지 업로드</p>
				        <input type="file" id="input_imgs" multiple accept=".jpg,.png,.gif,.tif,.tiff" name="imgfile1" onchange="fileCheck1(this)" />
				        <input type="hidden" id="fileChks" name="filechks" value="3"/>
				        <input type="button" value="취소" onclick="javascript:cancel(2)" id="imgclean2"/>
				    </div>
	    		
				    <div>
				        <div id="imgs_wrap2">
				             <c:forEach items="${photo }" var="photo">
								<c:if test="${photo.p_thum == 'N' }">
									<div  class="mySlides fade">
										<img class="image" height="30%" src="${photo.p_path}${photo.p_newname}" width="40%"/>
									</div>
								</c:if>
							</c:forEach>
				        </div>
				    </div>
				</td>						
			</tr>
			<tr>
				<td>내용 :  <textarea rows="10" cols="30" name="b_content" >${boarddto.b_content}</textarea></td>
			</tr>
			</table>
		</form>
		<input type="button" value="확인" onclick="evUpdateCheck()"/>
	</body>
	<script>
    
	//디폴트 1월 일자 셀렉트박스
	function defaultCreateDate(){
		
		var evStart = $("#evStart").val();
		console.log("evStart : "+evStart);
		var evEnd = $("#evEnd").val();
		console.log("evEnd : "+evEnd);
		
		var evStartArr = evStart.split("-");
		var evEndArr = evEnd.split("-");
		
		var evStartYear = evStartArr[0];
		console.log("evStartYear : "+evStartYear);
		var evStartMonth = evStartArr[1];
		console.log("evStartMonth : "+evStartMonth);
		var evStartDay = evStartArr[2];
		console.log("evStartDay : "+evStartDay);
		
		var evEndYear = evEndArr[0];
		var evEndMonth = evEndArr[1];
		var evEndDay = evEndArr[2];
		
		//년,월 셀렉트
		$("#ys"+evStartYear+"").attr("selected", "selected");
		$("#ms"+evStartMonth+"").attr("selected", "selected");
		$("#ye"+evEndYear+"").attr("selected", "selected");
		$("#me"+evEndMonth+"").attr("selected", "selected");
    	
		var d = new Date();
    	
    	var lastDay1 = (new Date(evStartYear, evStartMonth, 0)).getDate();
    	console.log("lastDay1 : "+lastDay1);
    	var lastDay2 = (new Date(evEndYear, evEndMonth, 0)).getDate();
    	console.log("lastDay2 : "+lastDay2);
 
    	var content1 = "";
	    for(var i = 1; i<=lastDay1;i++){
	    	if(i<10){
	    		content1 += "<option id='ds0"+i+"' value='0"+i+"'>"+i+"일</option>"
	    	}else{
	    		content1 += "<option id='ds"+i+"' value='"+i+"'>"+i+"일</option>"
	    	}
	    }
	    $("#evDateDay1").html(content1);
	    $("#evDateDay1").append(content1);
		$("#ds"+evStartDay+"").attr("selected", "selected");
	    
	    var content2 = "";
	    for(var i = 1; i<=lastDay2;i++){
	    	if(i<10){
	    		content2 += "<option id='de0"+i+"' value='0"+i+"'>"+i+"일</option>"
	    	}else{
	    		content2 += "<option id='de"+i+"' value='"+i+"'>"+i+"일</option>"
	    	}
	    }
		$("#evDateDay2").html(content2);
	    $("#evDateDay2").append(content2);
	    $("#de"+evEndDay+"").attr("selected", "selected");
		
	    putDate();
	    
    }
	
    //년,월에 맞춰서 일(日)자 만들기
	function createDate(num){
    	
		var d = new Date();
    	
    	var lastDay1 = (new Date($("#evDateYear1").val(), $("#evDateMonth1").val(), 0)).getDate();
    	var lastDay2 = (new Date($("#evDateYear2").val(), $("#evDateMonth2").val(), 0)).getDate();
    	console.log(lastDay1);
    	console.log(lastDay2);
    	
    	if(num==1){
	    	var content1 = "";
		    for(var i = 1; i<=lastDay1;i++){
		    	if(i<10){
		    		content1 += "<option value='0"+i+"'>"+i+"일</option>"
		    	}else{
		    		content1 += "<option value='"+i+"'>"+i+"일</option>"
		    	}
		    }
		    $("#evDateDay1").html(content1);
		    $("#evDateDay1").append(content1);
    	}else{
		    var content2 = "";
		    for(var i = 1; i<=lastDay2;i++){
		    	if(i<10){
		    		content2 += "<option value='0"+i+"'>"+i+"일</option>"
		    	}else{
		    		content2 += "<option value='"+i+"'>"+i+"일</option>"
		    	}
		    }
    		$("#evDateDay2").html(content2);
    	    $("#evDateDay2").append(content2);
    	}
		
	    putDate();
	    
    }
	
    //히든에 각 날짜 담는 함수
    function putDate(){
	    evStartDate = $("#evDateYear1").val()+"-"+$("#evDateMonth1").val()+"-"+$("#evDateDay1").val()
	    evEndDate = $("#evDateYear2").val()+"-"+$("#evDateMonth2").val()+"-"+$("#evDateDay2").val()
    	
	    $("input[name='ev_start']").val(evStartDate);
	    $("input[name='ev_end']").val(evEndDate);
    }
    
	
    //이미지 파일을 첨부 했는지 안했는지 판단하는 함수
   function fileCheck(elem){
	console.log(elem.value);
	if(elem.value == ""){
		console.log("없어");
		$("#fileChk").val(2);//파일 첨부 안함
	}else{
		console.log("있어");
		$("#fileChk").val(4);//파일 첨부 함
	}
	console.log($("#fileChk").val());
}

function fileCheck1(elem){
	console.log(elem.value);
	if(elem.value == ""){
		console.log("없어");
		$("#fileChks").val(2);//파일 첨부 안함
	}else{
		console.log("있어");
		$("#fileChks").val(5);//파일 첨부 함
	}
	console.log($("#fileChks").val());
}
  //미리보기 하는거
	 var sel_files1 = [];
	 var sel_files2 = [];
	 
    function handleImgsFilesSelect1(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
		
        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
			
            sel_files1.push(f);

	       	 var reader = new FileReader();
	         reader.onload = function(e) {
	             var img_html = "<img src=\"" + e.target.result + "\" />";
	             $("#imgs_wrap1").append(img_html);
	         }
	         reader.readAsDataURL(f);
        });
    } 
    
    function handleImgsFilesSelect2(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
		
        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
			
            sel_files2.push(f);

	       	 var reader = new FileReader();
	         reader.onload = function(e) {
	             var img_html = "<img src=\"" + e.target.result + "\" />";
	             $("#imgs_wrap2").append(img_html);
	         }
	         reader.readAsDataURL(f);
        });
    } 
    
    //미리보기 이미지 삭제하는 함수
    function cancel(num){
    	if(num==1){
    		$("#imgs_wrap1").empty();
    	}else{
    		$("#imgs_wrap2").empty();
    	}
    }
    
    //유효성 검사
    function evUpdateCheck(){
 	   if($("input[name='b_subject']").val() == ""){
		   alert("이벤트 제목을 입력해주세요.");
	   }else if($("textarea[name='b_content']").val() == ""){
		   alert("내용을 입력해주세요.");
	   }else if( $("#fileChk").val() == "0" ){
		   alert('대표 이미지를 골라 주세요');
	   }else if( $("#fileChks").val() == "0" ){
		   alert('매장 사진을 골라 주세요');
	   }else{
		   $("#evForm").submit();
	   }
    }
    
    
    $(document).ready(function() {
 	 $("#input_img").on("change", handleImgsFilesSelect1);
	 $("#input_imgs").on("change", handleImgsFilesSelect2);
	 defaultCreateDate();
    }); 
	
	</script>
</html>