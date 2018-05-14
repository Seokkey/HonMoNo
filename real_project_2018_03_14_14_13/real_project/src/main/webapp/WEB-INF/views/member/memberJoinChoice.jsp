<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>  
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>회원가입 선택 페이지</title>
		<style>
		
			.button {
			
			    background-color: white;
			    border: 3px solid;
			    color: black;
			    padding: 100px 50px;
			    right: 75px;
			    position: relative;
			    
			    text-align: center;
			    text-decoration: none;
			    display: inline-block;
			    font-size:40px;
			    margin: 119px 20px;
			    cursor: pointer;
			    left: 33.5%;
			    
			}
						
			.button1{
			
				 background-color: white;
			    border: 3px solid;
			    color: black;
			    padding: 15px 15px;
			    right: 100px;
			    position: relative;
			    
			    text-align: center;
			    text-decoration: none;
			    display: inline-block;
			    font-size:40px;
			    margin: -60px 20px;
			    cursor: pointer;
			    left: 42%;
			}
			#ha{
			
				position: absolute;
				top:19%;
				bottom: 44.5%;
				right:47%;
			}
			
			
			
						
		</style>
	</head>
	
	<body>
		<jsp:include page="../memberLoginBox.jsp"></jsp:include>
		<br>
		<br>
		<br>
		
		<div id="ha">
			<h2>회원가입 선택</h2>
		</div>
		
		
		<a href="./memberJoinAgree" class="button" id="bb">소비자</a>
		<a href="./memberJoinAgree2" class="button" id="bb">사업자</a><br/>
		<input type="button" class="button1" id="toMainBtn" value="뒤로가기"/>
	
	</body>		
	
	<script>
	
	 $("#toMainBtn").click(function(){
			location.href="./"
		}); 
	</script>
</html>