   <%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   
   <html>
   <head>
   <title>Main</title>
   <link rel="stylesheet" type="text/css" href="./resources/css/sli.css">
   <script type="text/javascript" src="./resources/js/sli.js"></script>
   
   
   <style type="text/css">
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}





/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

   #use {
      position: absolute;
      bottom: 0;
      background-color: #999999;
      width: 100%;
      height: 90px;
      left: 0;
   }
   </style>
   </head>
   <body>
      <br />
      <br />
      <br />
   
      <%-- <c:if test="${sessionScope.loginId==admin1 }"></c:if> --%>
   
      <jsp:include page="memberLoginBox.jsp" />
   
      <br />
      <br />
   
      <br>
   
   
      <div class="slideshow-container">
   
         <div class="mySlides fade">
            <img src="./resources/image/slide_img_1.png" style="width: 100%">
         </div>
   
         <div class="mySlides fade">
            <img src="./resources/image/slide_img_2.png" style="width: 100%">
   
         </div>
   
         <div class="mySlides fade">
            <img src="./resources/image/slide_img_3.png" style="width: 100%">
         </div>
		   <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			<a class="next" onclick="plusSlides(1)">&#10095;</a>
		   
      </div>
      <br>
   
   
   
      <div style="text-align:center">
		  <span class="dot" onclick="currentSlide(1)"></span> 
		  <span class="dot" onclick="currentSlide(2)"></span> 
		  <span class="dot" onclick="currentSlide(3)"></span> 
	</div>
   
      <div id="use">
   
         <h1>이용약관</h1>
   
      </div>
      ${msg}
   </body>
   
   <script type="text/javascript">
	  var inter;
      var slideIndex = 0;
      showSlides(slideIndex);
      
      function plusSlides(n) {
    	  showSlides(slideIndex += n);
    	}

    	function currentSlide(n) {
    	  showSlides(slideIndex = n);
    	}
   
      function showSlides(n) {
  
    	 clearInterval(inter);
         var i;
         var slides = document.getElementsByClassName("mySlides");
         var dots = document.getElementsByClassName("dot");
         if (n > slides.length) {slideIndex = 1}    
         if (n < 1) {slideIndex = slides.length}
         for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
         }
         if (slideIndex > slides.length) {slideIndex = 1}  
         for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
         }
         slides[slideIndex - 1].style.display = "block";
         dots[slideIndex - 1].className += " active";
        
         inter = setInterval(function(){
            slideIndex++;
            showSlides(slideIndex);
              },3000);
      }
   </script>
   </html>