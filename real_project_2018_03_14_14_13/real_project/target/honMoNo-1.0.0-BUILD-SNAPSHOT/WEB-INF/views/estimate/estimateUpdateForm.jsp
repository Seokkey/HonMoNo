<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
		</style>
		<title>견적 수정하기</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	</head>
	<body>
		<jsp:include page="../memberLoginBox.jsp"/>
	    <jsp:include page="../mdgroupSideBar.jsp"/>	    
		<p>견적문의 수정하기<p>			
		<form action="./estiBoardUpdate?c_idx=${param.c_idx}&c_num=${param.c_num}&b_idx=${boardDto.b_idx}" method="post" enctype="multipart/form-data" id="estiForm" >
		<table>
			<tr>
				<td><input type="text" readonly="readonly" name="em_brand" value="${boardDto.em_brand}"/><b>견적 문의하기</b></td>
			</tr>
			<tr>
				<td> 
					작성자 : <input type="text" readonly="readonly" name="b_nick" value="${boardDto.b_nick}"/>
				</td>
			</tr>			
			<tr>				
				<td>제품 분류 : 
					<select name="em_product">
						<option value="">가구선택</option>
					    <option value="침대">침대</option>
					    <option value="쇼파">쇼파</option>
					    <option value="장롱">장롱</option>
					    <option value="식탁">식탁</option>
					    <option value="의자">의자</option>
					    <option value="책상">책상</option>
					    <option value="서랍장">서랍장</option>
					    <option value="화장대">화장대</option>
					    <option value="기타">기타</option>				    
			</select>	
				</td>					
			</tr>
			<tr>
				<td>제목 : <input type="text" name="b_subject" value="${boardDto.b_content}"/></td>
			</tr>
			<tr>
				<td>사진 첨부 : 
					<div>
								        
				        <p class="title">다중 이미지 업로드</p>
				        <input type="file" id="input_imgs" multiple accept=".jpg,.png,.gif,.tif,.tiff" name="imgfile" onchange="fileCheck(this)" />
				        <input type="hidden" id="fileChk" name="filechk" value="0"/>
				        <input type="button" value="취소" onclick="javascript:cancel()" id="imgclean"/>
				    </div>
				 
				    <div>
				        <div class="imgs_wrap">
				            <c:choose>
						<c:when test="${!empty photo}">
							<c:forEach var="photo" items="${photo}">
								<img src ="${photo.p_path}${photo.p_newname}"/>
							</c:forEach>						
						</c:when>
						<c:otherwise>
							<h2><b>이미지가 표현되는 곳입니다.</b></h2>
						</c:otherwise>
						</c:choose>		
				        </div>
				    </div>
				</td>		
			</tr>
			<tr>
				<td>내용 : <br/>
					<textarea name="b_content"  rows="10" cols="30">${boardDto.b_content}</textarea> 
	            </td>
			</tr>
			<tr>
				<td>배송희망일 : <input type="date" name="em_date" value="${boardDto.em_date}"/> </td><!-- <a href="#">달력 버튼이나 기능</a> -->				
			</tr>
			<tr>
				<td>배송지역 : 
					<select name="d_area">
						<option value="">지역 선택</option>
					    <option value="서울">서울</option>
					    <option value="인천">인천</option>
					    <option value="경기">경기</option>
					    <option value="광주">광주</option>
					    <option value="대전">대전</option>
					    <option value="대구">대구</option>
					    <option value="부산">부산</option>
					    <option value="울산">울산</option>
					    <option value="강원도">강원도</option>					    
					    <option value="충북">충북</option>
					    <option value="충남">충남</option>
					    <option value="경북">경북</option>
					    <option value="경남">경남</option>
					    <option value="전북">전북</option>
					    <option value="전남">전남</option>
					    <option value="제주">제주</option>
					    <option value="기타">기타</option>
			</select>														
				</td>
			</tr>			
		</table>
		</form>
		<input type="button" value="등록" onclick="javascript:estiBoardUpdate()">
		<button onclick="location.href='./listCall?c_idx=${param.c_idx}&c_num=${param.c_num}'">취소</button>			
	</body>
	<script>
	/* input 태그에만 적용하기(jQuery를 사용) */
	$('input[type="text"]').keydown(function() {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	    }
	});		
	 var sel_files = [];
	 
	    $(document).ready(function() {
	        $("#input_imgs").on("change", handleImgsFilesSelect);
	    }); 

	    function handleImgsFilesSelect(e) {
	        var files = e.target.files;
	        var filesArr = Array.prototype.slice.call(files);

	        filesArr.forEach(function(f) {
	            if(!f.type.match("image.*")) {
	                alert("확장자는 이미지 확장자만 가능합니다.");
	                return;
	            }

	            sel_files.push(f);

	       	 var reader = new FileReader();
	         reader.onload = function(e) {
	             var img_html = "<img src=\"" + e.target.result + "\" />";
	             $(".imgs_wrap").append(img_html);
	         }
	         reader.readAsDataURL(f);
	        });
	    } 
	    function cancel(){
	    	$(".imgs_wrap").empty();
	    }
	    
	    function fileCheck(elem){
	    	console.log(elem.value);
	    	if(elem.value == ""){
				console.log("파일 없음");
				$("#fileChk").val(2);//파일 첨부 안함
			}else{
				console.log("파일 있음");
				$("#fileChk").val(1);//파일 첨부 함
			}
	    	console.log($("#fileChk").val());
	    }
	    
	   function estiBoardUpdate(){
		   
		   /* $("select[name=name]").val(); */
		   
		   if($("select[name=em_product]").val() == ""){
			   alert('제품 분류를 선택해주세요');
		   }else if($("input[name=b_subject]").val() == "" ){
			   alert('제목을 작성해주세요');				   
		   }else if($('textarea[name="b_content"]').attr('value') == ""){
			   alert('내용을 입력해주세요');
		   }else if($("input[name=em_date]").val() == "" || null){
			   alert('배송 희망일을 선택해 주세요');
		   }else if( $("select[name=d_area]").val() == "" ){
			   alert('지역을 선택해주세요');
		   }else{
			   $("#estiForm").submit();
		   }		   
	   }
	   
	 	$(document).ready(function(){			
			$("select[name=em_product]").val("${boardDto.em_product}").attr("selected", "selected");
			$("select[name=d_area]").val("${boardDto.d_area}").attr("selected", "selected");
		});
	   
	</script>
</html>