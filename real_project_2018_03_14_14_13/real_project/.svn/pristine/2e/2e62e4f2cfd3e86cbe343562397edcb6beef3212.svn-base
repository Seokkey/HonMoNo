<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
			<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
			<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<style>
		#bbslist{
			   margin-left: 37%;
   				position: absolute;
   				top:30%;
		}
		</style>
	</head>
	<body>
		
		<jsp:include page="../memberLoginBox.jsp"/>
		
		<jsp:include page="../mdgroupSideBar.jsp"/>
		
		<div id="bbslist">
		<h1>공지사항 테스트</h1>
		  
          <br/><br/>            
          <br/><br/>    
          <table>
              <thead>
              	<tr>
	                  <td>글번호</td>
	                  <td> 제목 &nbsp;</td>	
	                  <td> &nbsp; 작성자 &nbsp;</td>
	                  <td> &nbsp; 작성일 &nbsp;</td>
	                  <td>조회수</td>
                  </tr>
              </thead>  
              <tbody>
				${blist }
              </tbody>  
          </table>         
      <br/>	<div style="text-align: center;">${paging}</div>
		<br/>
		<br/>	
			<!-- <input type="button" id = "meetSearchBtn" value = "검색"> -->
			<select id = "keyword">
				<option value="">키워드 선택</option> 
				<option value="writer">작성자</option>
				<option value="sub">제목</option>
	  			<option value="subcon">제목 + 내용</option>
			</select>
			<input type="text" id = "searchtxt"/>
			<a href = "javascript:searchBtn()" id = "searchBtn"> 검색</a>
			<c:if test="${sessionScope.loginRating == 9 }">
				<a href = "./noticeWriteForm?c_idx=${param.c_idx}&c_num=${param.c_num}"> 글쓰기</a>	
			</c:if>
		</div>
	
	</body>
	<script>
/*  		var c_num = "${categorydto.c_num}";
 		var c_name = "${categorydto.c_name}";
 		var c_idxSt = "${c_idx}";
 		var c_idx = parseInt(c_idxSt);
 		
 		console.log("c_num : "+c_num);
 		console.log("c_name : "+c_name);
 		console.log("c_idx : "+c_idx); */
 		
 		
		
	</script>
</html>