<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
            table,th,td{                
                border-collapse: collapse;
                padding: 5px;
                text-align: center;
            }
            #bbslist{
            	position: absolute;
                top:29%;
                right: 31%;
            }
            
            #hak{
            		position: absolute;
            		left: 34%;
            		bottom: 28%;
            }
            
            #hak1{
            	position:absolute;
            	right:50%;
            	bottom: 32%;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    </head>
    <body>
    <jsp:include page="../memberLoginBox.jsp"/>
    <jsp:include page="../mdgroupSideBar.jsp"/>      
        <div id="bbslist">
		  		
		<c:choose>
    		<c:when test="${faEx == 0}">    		
    					 <h1>${boardName}</h1><input type="button" onclick="javascript:favoriteBbs(this)" value="☆(관심게시판 등록)" id="${faEx}"/>
    		</c:when>
    		<c:otherwise>
    					<h1>${boardName}</h1><input type="button" onclick="javascript:favoriteBbs(this)" value="★(관심게시판 해제)" id="${faEx}"/>
    		</c:otherwise>   	
    	</c:choose>
          <br/><br/>            
          <br/><br/>    
          <table>
              <thead>
              	<tr>
	                  <td>글번호</td>
	                  <td> 제품분류 </td>
	                  <td> 제목 &nbsp;</td>
	                  <td> &nbsp; 작성자 &nbsp;</td>
	                  <td> &nbsp; 배송 희망일 &nbsp;</td>
	                  <td> &nbsp; 지역 &nbsp;</td>
	                  <td> &nbsp; 작성일 &nbsp;</td>
	                  <td>조회수</td>
                  </tr>
              </thead>  
              <tbody>
				${blist }
              </tbody>  
          </table>         
      </div>
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>	
      <div style="text-align: center;" id="hak1">${paging}</div>
		<br/>
		<br/>
		
		
		<div id="hak">
			<select id="area">
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
			<select id="furnitureCategory">
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
			<!-- <input type="button" id = "meetSearchBtn" value = "검색"> -->
			<select id = "keyword">
				<option value="">키워드 선택</option> 
				<option value="writer">작성자</option>
				<option value="sub">제목</option>
	  			<option value="subcon">제목 + 내용</option>
			</select>
			<input type="text" id = "searchtxt" onkeypress="if( event.keyCode==13 ){searchBtn();}"/>
			<a href = "javascript:searchBtn()" id = "searchBtn"> 검색</a>
			<a href = "javascript:estiWriteForm()"> 글쓰기</a>		
			</div>
			
			
	</body>
	<script>
	
	//삭제 확인 메세지
	if("${param.msg}" == ""){								
	}else{
		alert("${param.msg}");
	}
	
	var nick= "${sessionScope.loginNick}"; //세션 닉네임
	var rating = "${sessionScope.loginRating}"; //세션 레이팅
	
	//글쓰기 버튼
	function estiWriteForm(){
		if(nick == ""){
			alert("로그인이 필요한 서비스 입니다.");
			$("#toggle-sidebar").trigger("click");
		}else{
			if(rating == 1 || rating == 9){
				location.href="./estiWriteForm?c_idx=${param.c_idx}&c_num=${param.c_num}";	
			}else{
				alert("소비자 회원만 등록이 가능합니다");
			}			
		}		
	}	
	
	//검색 버튼	
	function searchBtn(){			
		var area = $("#area option:selected").val();
		var furnitureCategory = $("#furnitureCategory option:selected").val();
		var keyword = $("#keyword option:selected").val();
		var searchtxt = $("#searchtxt").val();
		if(furnitureCategory == "" && area == "" && keyword == "" && searchtxt == ""){
			alert("키워드를 선택해주세요");
		}else if(keyword != "" && searchtxt == ""){
			alert("검색내용을 입력해주세요");
		}else{
			location.href="./listCall?c_idx=${param.c_idx}&c_num=${param.c_num}&area="+area+"&furnitureCategory="+furnitureCategory+"&keyword="+keyword+"&searchtxt="+searchtxt;
		}
	}
	
	/* 즐겨찾기 추가 삭제 => catecontroller */
	function favoriteBbs(d){
		console.log(d);
		console.log(d.getAttribute('id'));
		if(nick == ""){
			alert("로그인이 필요한 서비스 입니다.");
			$("#toggle-sidebar").trigger("click");
		}else{
			var faId = d.getAttribute('id');
			console.log(faId==0);
			if(faId == 0){
				$.ajax({
					url:'faAdd',
					type:'get',
					data:{c_idx:"${c_idx}"},
					dataType:'json',
					success:function(data){						
						console.log(data);
						alert(data.msg);
						location.reload();
					},
					error:function(e){
						console.log(error);
					}			
				});	
			}else{
				$.ajax({
					url:'faDel',
					type:'get',
					data:{c_idx:"${c_idx}"},
					dataType:'json',
					success:function(data){						
						console.log(data);
						alert(data.msg);
						location.reload();
					},
					error:function(e){
						console.log(error);
					}			
				});
			}	
		}						
	}
	</script>
</html>