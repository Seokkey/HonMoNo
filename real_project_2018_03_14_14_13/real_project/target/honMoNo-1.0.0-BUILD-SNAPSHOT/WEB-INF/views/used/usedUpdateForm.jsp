<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
				#hak1{
				position: absolute;
                top:27%;
                margin-left: 37%;
			}
		</style>
		<title>중고 거래 수정 폼</title>
	</head>
	<body>		
		<jsp:include page="../memberLoginBox.jsp"/>
   		<jsp:include page="../mdgroupSideBar.jsp"/> 
		<div id="hak1">
		<p>중고 거래하기<p>	
		
    
			<form action="./usedUpdate?c_idx=${param.c_idx }&c_num=${param.c_num}&b_idx=${boarddto.b_idx}" method="post" enctype="multipart/form-data"  id="check">
			<table>			
				<tr>	
				<td>			
					<input type="text" name="u_product"  readonly="readonly" value="제품 분류 : ${produc }"/>
				</td>
				</tr>
				<tr>
					<td>
						<input type="radio" name="u_bors" value="buy" >삽니다
						<input type="radio" name="u_bors" value="sell" >팝니다
					</td>
				</tr>			
				<tr>
					<td>브랜드 : 
						<select name="u_brand" id="brand" >
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
					<td>제목 :  <input type="text" name="b_subject"  id="subject" value="${boarddto.b_subject}"></td>
				</tr>
				<tr>
					<td>사진 첨부 : 
						<div>
					        <h2><b>이미지 미리보기</b></h2>
					        <p class="title">다중 이미지 업로드</p>
					        <input type="file" id="input_imgs" multiple accept=".jpg,.png,.gif,.tif,.tiff" name="imgfile" onchange="fileCheck(this)" />
					        <input type="hidden" id="fileChk" name="filechk" value="1"/>
					        <input type="button" value="취소" onclick="javascript:cancel()" id="imgclean"/>
					        
					    </div>
					 
					    <div>
					        <div class="imgs_wrap">
				            	<c:forEach  items="${usedpholist}" var="usedpholist">
				                	<c:if test="${usedpholist.p_newname == null}">
				                		제품 사진이 없습니다.			                		
					                </c:if>
					                <c:if test="${usedpholist.p_newname != null}">					               
						                <img width="5%" height="5%"   class="image" src="${usedpholist.p_path}${usedpholist.p_newname}"/>				                	
				                	</c:if>
	               				</c:forEach> 
					        </div>
					    </div>
					</td>	
				</tr>
				
				<tr>
					<td>내용 : 
						<textarea id="content" name="b_content"  rows="10" cols="30">${boarddto.b_subject}</textarea>
		            </td>
				</tr>			
				<tr>
					<td> 지역 :
					<select name="u_area" id="area">
							<option value="">지역 선택</option>
						    <option value="서울">서울</option>
						    <option value="인천">인천</option>
						    <option value="대전">대전</option>
						    <option value="대구">대구</option>
						    <option value="부산">부산</option>
						    <option value="울산">울산</option>
						    <option value="광구">광주</option>
						    <option value="충북">충북</option>
						    <option value="충남">충남</option>
						    <option value="경북">경북</option>
						    <option value="경남">경남</option>
						    <option value="전북">전북</option>
						    <option value="전남">전남</option>
						    <option value="제주">제주</option>
						    <option value="도서산간">도서산간</option>
						</select>					
					</td>
				</tr>
				<tr>
					<td>안전 거래 여부 : 
						<input type="radio" name="u_safety" value="safe" class="safety">안전거래
						<input type="radio" name="u_safety" value="direct" class="safety">직접거래
					</td>
				</tr>
				<tr>
					<td>	<input type="button" onclick="javascript:dealFinish()" value="거래 완료"/></td>
				</tr>
			
			</table>
				<input type="button" value="수정" onclick="javascript:usedUpdate()">
			</form>
			<button onclick="location.href='./listCall?c_idx=${param.c_idx}&c_num=${param.c_num}'">취소</button>
		</div>

	</body>
	<script>
	
			function dealFinish(){
				if(confirm("거래를 완료 하시겠습니까?")  == true){
					location.href="./dealFinish?b_idx="+${boarddto.b_idx}+"&c_idx=${param.c_idx}&c_num=${param.c_num}&u_bors=dealf";
				}else{
					return;
				}
			}
			//미리보기 한느거
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
					console.log("없어");
					$("#fileChk").val(2);//파일 첨부 안함
				}else{
					console.log("있어");
					$("#fileChk").val(3);//파일 첨부 함
				}
		   	console.log($("#fileChk").val());
		   }
		   
		  function usedUpdate(){
			    var bors = $(":input:radio[name=u_bors]:checked").val();
			    var safety = $(":input:radio[name=u_safety]:checked").val();
		
			   console.log(bors);
			   console.log($("#content").val() ==null);
			   console.log(safety);
			   if(bors == null){
				   alert('매매 유형 정해줘');
			   }else if($("#brand").val() == "" ){
				   alert('브랜드를 골라 주세요');
			   }else if($("#subject").val() == ""){
				   alert('제목을 작성해 주세용');
			   }else if($("#content").val() == ""){
				   alert('내용을 입력해주세여]');
			   }else if( $("#area").val() == "" ){
				   alert('지역을 골라 주세요');
			   }else if(safety == null){
				   alert('거래 유형을 골라주세요');
			   }else{
				   $("#check").submit();
			   }	   
		  }
			$(document).ready(function(){			
				$("select[name=u_brand]").val("${boarddto.u_brand}").attr("selected", "selected");
				$("select[name=u_area]").val("${boarddto.u_area}").attr("selected", "selected");
				$("input:radio[name=u_bors]").val("${boarddto.u_bors}").attr("checked", "checked");
				$("input:radio[name=u_safety]").val("${boarddto.u_safety}").attr("checked", "checked");
			});
		   
	</script>
</html>