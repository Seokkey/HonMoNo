<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			
			#hak{
			position: absolute;
                top:29%;
                margin-left: 37%;
			
			
			}
		</style>
		
	</head>
	<body>	
		<jsp:include page="../memberLoginBox.jsp"/>
    	<jsp:include page="../mdgroupSideBar.jsp"/> 
    	
    	<div id="hak">
    	<title>매장 상세보기</title>
		<p>매장 보기<p>	
		<c:forEach items="${shopPhotoList }" var="shopPhotoList">
			<c:if test="${shopPhotoList.p_thum == 'N' }">
				<div  class="mySlides fade">
					<img class="image" height="30%" src="${shopPhotoList.p_path}${shopPhotoList.p_newname}" width="40%"/>
				</div>
			</c:if>
		</c:forEach>
		
		<table>
			<tr>
				<td>매장명 : ${boarddto.sh_name }</td>
			</tr>
			<tr>				
				<td>브랜드 : ${boarddto.sh_brand} </td><td>주 제품군 : ${boarddto.sh_prproduct}</td>
			</tr>
			<tr>
				<td>연락처 : ${boarddto.sh_phone}</td><td>주소 : ${boarddto.sh_address}</td>				
			</tr>
			<tr>
				<td>휴무일 : ${boarddto.sh_close} </td><td>운영시간 : ${boarddto.sh_officehour }</td>				
			</tr>			
			<tr>
				<td>매장소개 : ${boarddto.sh_introduce}</td>				
			</tr>	
			<tr>
				<td>매장 전시 품목 : ${boarddto.sh_list}</td>
			</tr>		
			<tr>
				<td>
					<!-- <select name="point">구현해보기 
						<option value="">별점 주기</option>
					    <option value="1">★</option>
					    <option value="2">★★</option>
					    <option value="3">★★★</option>
					    <option value="4">★★★★</option>
					    <option value="5">★★★★★</option>
					</select>	 -->				
				<c:if test="${sessionScope.loginNick ==  boarddto.b_nick}">
					<button onclick="location.href='javascript:shopUpdateForm()'">수정</button>
					
				</c:if>
				<c:choose>
					<c:when test="${sessionScope.loginNick ==  boarddto.b_nick}">
						<button onclick="location.href='javascript:shopDel()'">삭제</button>
					</c:when>
					<c:when test="${sessionScope. loginRating == 9}">
						<button onclick="location.href='javascript:shopDel()'">삭제</button>
					</c:when>
				</c:choose>
				<c:if test="${sessionScope.loginNick !=  boarddto.b_nick}">
					<button onclick="location.href='#'">신고</button>
				</c:if>	
					<button onclick="location.href='./listCall?c_idx=${param.c_idx}&c_num=${param.c_num}'">목록</button>
				</td>
			</tr>
		</table>	
		</div>		
	</body>
	<script>
	
	//게시글 수정
	function shopUpdateForm(){
		location.href="./shopUpdateForm?c_idx="+${param.c_idx}+"&c_num="+${param.c_num}+"&b_idx="+${boarddto.b_idx}+"";
	}
	//게시글 삭제
	function shopDel(){
		location.href="./shopDel?c_idx="+${param.c_idx}+"&c_num="+${param.c_num}+"&b_idx="+${boarddto.b_idx}+"";
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