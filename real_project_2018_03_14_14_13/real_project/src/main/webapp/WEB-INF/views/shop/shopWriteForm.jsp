<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
			#hak{
				position: absolute;
                top:29%;
                right: 40%;
			}
		
		</style>
		<title>매장 등록 폼</title>
	</head>
	<body>	
		<jsp:include page="../memberLoginBox.jsp"/>
    	<jsp:include page="../mdgroupSideBar.jsp"/>
    	<br>
    	<br>
    	<div id="hak">
		<h2>매장 등록 하기</h2>
		<form action="./shopWrite?c_idx=${c_idx }&c_num=${c_num}" method="post" enctype="multipart/form-data" id="check" >	
		<table>			
			<tr>
				<td>브랜드 : 
					<select name="sh_brand" id="brand">
						<option value="">브랜드 선택</option>
					    <option value="시몬스">시몬스</option>
					    <option value="에이스">에이스</option>
					    <option value="템퍼">템퍼</option>
					    <option value="한샘">한샘</option>
					    <option value="리바트">리바트</option>
					    <option value="에몬스">에몬스</option>
					    <option value="기타브랜드">기타 브랜드</option>
					</select>	
				</td>
			</tr>
			<tr>
			<tr>
				<td>매장명 :  <input type="text" name="sh_name"  id="name" placeholder="제목을 입력해주세요"> </td>
			</tr>
			<tr>
				<td>주소 :  <input type="text" name="sh_address" id="address"> </td>
			</tr>
			<tr>
				<td>연락처 :  <input type="text" name="sh_phone" id="phone"> </td>				
			</tr>
			<tr>
				<td>운영시간 :  <input type="text" name="sh_officehour" id="officehour"> </td>				
			</tr>
			<tr>
				<td>휴무일 : <input type="text" name="sh_close" id="close"></td>			
			</tr>
			<tr>
				<td>주 제품군 : <input type="text" name="sh_prproduct" id="prproduct"> </td>
			</tr>
			<tr>
				<td>매장 소개 : 
					<textarea id="content" name="sh_introduce" id="introduce"  rows="10" cols="30"></textarea>
	            </td>
			</tr>
			<tr>
				<td>매장 전시 제품 목록 :
					 <textarea name="sh_list" id="list"  rows="10" cols="30"></textarea> 
	            </td>
			</tr>
			<tr>
				<td>매장 대표 사진 : 
					
					<div>
				        <h2><b>대표 이미지 미리보기</b></h2>
				        <p class="title">다중 이미지 업로드</p>
				        <input type="file" id="input_img"  accept=".jpg,.png,.gif,.tif,.tiff" name="imgfile" onchange="fileCheck(this)" />
				        <input type="hidden" id="fileChk" name="filechk" value="0"/>
				        <input type="button" value="취소" onclick="javascript:cancel(1)" id="imgclean"/>
				    </div>
				 
				    <div>
				        <div id="imgs_wrap1">
				            
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
				        <input type="hidden" id="fileChks" name="filechks" value="0"/>
				        <input type="button" value="취소" onclick="javascript:cancel(2)" id="imgclean2"/>
				    </div>
				 
				    <div>
				        <div id="imgs_wrap2">
				            
				        </div>
				    </div>
				
				</td>			
			</tr>
		</table>
			<input type="button" value="등록" onclick="javascript:shopWrite()">		
		</form>	

		<button onclick="location.href='./listCall?c_idx=${param.c_idx}&c_num=${param.c_num}'">취소</button>
	

	</div>

	</body>
	<script>
	
	
	function shopWrite(){
	   if($("#brand").val() == "" ){
		   alert('브랜드를 골라 주세요');
	   }else if($("#name").val() == ""){
		   alert("매장명을 입력해주세요")
	   } else if($("#address").val() == ""){
		   alert('주소를 입력해 주세요');
	   }else if($("#phone").val() == ""){
		   alert('번호를 입력해 주세용');
	   }else if($("#officehour").val() == ""){
		   alert('운영시간을 입력해주세여]');
	   }else if( $("#close").val() == "" ){
		   alert('휴무일을 작성 주세요');
	   }else if( $("#prproduct").val() == "" ){
		   alert('제품군을 작성 주세요');
	   }else if( $("#introduce").val() == "" ){
		   alert('매장소개을 작성 주세요');
	   }else if( $("#fileChk").val() == "0" ){
		   alert('대표 이미지를 골라 주세요');
	   }else if( $("#fileChks").val() == "0" ){
		   alert('매장 사진을 골라 주세요');
	   }else{
		   $("#check").submit();
	   }
	   
   }
	

	function fileCheck(elem){
    	console.log(elem.value);
    	if(elem.value == ""){
			console.log("없어");
			$("#fileChk").val(2);//파일 첨부 안함
		}else{
			console.log("있어");
			$("#fileChk").val(1);//파일 첨부 함
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
			$("#fileChks").val(3);//파일 첨부 함
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
   
   $(document).ready(function() {
	 $("#input_img").on("change", handleImgsFilesSelect1);
   	$("#input_imgs").on("change", handleImgsFilesSelect2);
   }); 
   
    function cancel(num){
    	if(num==1){
    		$("#imgs_wrap1").empty();
    	}else{
    		$("#imgs_wrap2").empty();
    	}
    }
	</script>
</html>