<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<title>Insert title here</title>
	<style>
		* {
			   box-sizing: border-box;
			}
			
			body {
			   font-family: Verdana, sans-serif;
			}
			
			.mySlides {
			   display: none;
			}
			
			img {
			   vertical-align: middle;
			}
			
			/* Slideshow container */
			.slideshow-container {
			   max-width: 80%;
			   max-height: 40%;
			   position: relative;
			   margin: auto;
			}
			
			/* Caption text */
			.text {
			   color: #f2f2f2;
			   font-size: 15px;
			   padding: 8px 12px;
			   position: absolute;
			   bottom: 8px;
			   width: 100%;
			   text-align: center;
			}
			
			/* Number text (1/3 etc) */
			.numbertext {
			   color: #f2f2f2;
			   font-size: 12px;
			   padding: 8px 12px;
			   position: absolute;
			   top: 0;
			}
			
			/* The dots/bullets/indicators */
			.dot {
			   height: 15px;
			   width: 15px;
			   margin: 0 2px;
			   background-color: #bbb;
			   border-radius: 50%;
			   display: inline-block;
			   transition: background-color 0.6s ease;
			}
			
			.active {
			   background-color: #717171;
			}
			
			/* Fading animation */
			.fade {
			   -webkit-animation-name: fade;
			   -webkit-animation-duration: 1.5s;
			   animation-name: fade;
			   animation-duration: 1.5s;
			}
			
			@
			-webkit-keyframes fade {
			   from {opacity: .4
			}
			
			to {
			   opacity: 1
			}
			
			}
			@
			keyframes fade {
			   from {opacity: .4
			}
			
			to {
			   opacity: 1
			}
			
			}
			
			/* On smaller screens, decrease text size */
			@media only screen and (max-width: 300px) {
			   .text {
			      font-size: 11px
			   }
			}
	
	</style>
	</head>
	<body>
	
    
	<div>
			<c:forEach items="${photo }" var="photo">
				<c:if test="${photo.p_thum == 'N' }">
					<div  class="mySlides fade">
						<img class="image" height="30%" src="${photo.p_path}${photo.p_newname}" width="40%"/>
					</div>
				</c:if>
			</c:forEach>
		
		<table>
			<tr>
				<td>이벤트 이름 : ${boarddto.b_subject}</td>
			</tr>
			<tr>
				<td> 기간 : ${boarddto.ev_start } ~ ${boarddto.ev_end }	</td>
			</tr>
			<tr>
				<td>이벤트 내용 : ${boarddto.b_content}</td>
			</tr>
		
		
		
		</table>
		
		
		<c:if test="${sessionScope.loginNick ==  boarddto.b_nick}">
						<button onclick="location.href='javascript:evUpdateForm()'">수정</button>
						
		</c:if>
		<c:choose>
			<c:when test="${sessionScope.loginNick ==  boarddto.b_nick}">
				<button onclick="location.href='javascript:evDel()'">삭제</button>
			</c:when>
			<c:when test="${sessionScope. loginRating == 9}">
				<button onclick="location.href='javascript:evDel()'">삭제</button>
			</c:when>
		</c:choose>
		<c:if test="${sessionScope.loginNick !=  boarddto.b_nick}">
			<button onclick="location.href='#'">신고</button>
		</c:if>	
			<button onclick="location.href='./listCall?c_idx=${param.c_idx}&c_num=${param.c_num}'">목록</button>
	</div>
	
	</body>
	<script>
		
		
	
	
	//게시글 수정
	function evUpdateForm(){
		location.href="./evUpdateForm?c_idx="+${param.c_idx}+"&c_num="+${param.c_num}+"&b_idx="+${boarddto.b_idx}+"";
	}
	//게시글 삭제
	function evDel(){
		location.href="./evDel?c_idx="+${param.c_idx}+"&c_num="+${param.c_num}+"&b_idx="+${boarddto.b_idx}+"";
	}
	
	  var slideIndex = 0;
      showSlides();
   
      function showSlides() {
         var i;
         var slides = document.getElementsByClassName("mySlides");
         var dots = document.getElementsByClassName("dot");
         for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
         }
         slideIndex++;
         if (slideIndex > slides.length) {
            slideIndex = 1
         }
         for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
         }
         slides[slideIndex - 1].style.display = "block";
         /* dots[slideIndex - 1].className += " active"; */
         setTimeout(showSlides, 2000); // Change image every 2 seconds
      }
      
	</script>
</html>