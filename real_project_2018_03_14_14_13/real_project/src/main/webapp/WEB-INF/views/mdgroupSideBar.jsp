<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<style>
		#hak2{
			margin: 167px 37px;
			width: 168px;
		}
		
		#hak3{
			margin: 167px 37px;
			width: 168px;
		}
		
		#hak4{
			margin: 94px 37px;
			width: 168px;
		}
</style>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<body>
		<!-- 대분류별로 선택되는 사이드바  -->
	 	<c:choose>
	 		<c:when test="${categorydto.c_num==0 }">
		 		<div class='zeta-menu-bar' id="hak2">
					<ul class="zeta-menu">	
				 	<li><div id="highName">공지&이벤트</div></li>
				    <li><a href="#0">0</a></li>
				    <li><a href="#1">1</a></li>
				  	</ul>
				</div>
	 		</c:when>
	 		<c:when test="${categorydto.c_num==1 }">
		 		<div class='zeta-menu-bar' id="hak2">
				  	<ul class="zeta-menu">
				    <li><div id="highName">견적문의</div></li>
				    <li><a href="#0">0</a></li>
				    <li>
				    	<a href="#1">1</a>
					    <ul>
					        <li><a href="#10">#1A</a></li>
					        <li><a href="#11">#1B</a></li>
					        <li><a href="#12">#1C</a></li>
					        <li><a href="#13">#1D</a></li>
					        <li><a href="#14">#1E</a></li>
					        <li><a href="#15">#1F</a></li>
					        <li><a href="#16">#1G</a></li>
					     </ul>
				    </li>
				    <li>
				    	<a href="#2">2</a>
				        <ul>
					        <li><a href="#20">#2A</a></li>
					        <li><a href="#21">#2B</a></li>
					        <li><a href="#22">#2C</a></li>
					        <li><a href="#23">#2D</a></li>
					        <li><a href="#24">#2E</a></li>
					        <li><a href="#25">#2F</a></li>
					        <li><a href="#26">#2G</a></li>
						</ul>
				    </li> 
				    <li>
				    	<a href="#3">3</a>
				    	<ul>
					        <li><a href="#30">#3A</a></li>
					        <li><a href="#31">#3B</a></li>
					        <li><a href="#32">#3C</a></li>
					        <li><a href="#33">#3B</a></li>
					        <li><a href="#34">#3C</a></li>
				    	</ul>
				    </li> 
				  </ul>
				</div>
	 		</c:when>
	 		<c:when test="${categorydto.c_num==2 }">
			 	<div class='zeta-menu-bar' id="hak3">
					<ul class="zeta-menu">
						<li><div id="highName">중고거래</div></li>
					    <li><a href="#0">0</a></li>
					    <li>
						    <a href="#1">1</a>
							<ul>
								<li><a href="#10">#1A</a></li>
							    <li><a href="#11">#1B</a></li>
							    <li><a href="#12">#1C</a></li>
							    <li><a href="#13">#1D</a></li>
							    <li><a href="#14">#1E</a></li>
							    <li><a href="#15">#1F</a></li>
							    <li><a href="#16">#1G</a></li>
							    <li><a href="#17">#1H</a></li>
							    <li><a href="#18">#1I</a></li>
							</ul>
					    </li>
					    <li>
					    	<a href="#2">2</a>
					    	<ul>
						        <li><a href="#20">#2A</a></li>
						        <li><a href="#21">#2B</a></li>
						        <li><a href="#22">#2C</a></li>
						        <li><a href="#23">#2D</a></li>
						        <li><a href="#24">#2E</a></li>
						        <li><a href="#25">#2F</a></li>
						        <li><a href="#26">#2G</a></li>
						        <li><a href="#27">#2H</a></li>
						        <li><a href="#28">#2I</a></li>
						    </ul>
					    </li> 
					    <li>
					    	<a href="#3">3</a>
					    	<ul>
						        <li><a href="#30">#3A</a></li>
						        <li><a href="#31">#3B</a></li>
						        <li><a href="#32">#3C</a></li>
					    	</ul>
					    </li> 
					</ul>
				</div>   
	 		</c:when>
	 		<c:when test="${categorydto.c_num==3 }">
	 			<div class='zeta-menu-bar' id="hak3">
				  	<ul class="zeta-menu">
				    <li><div id="highName">매장소개</div></li>
				    <li><a href="#0">0</a></li>
				    <li>
				    	<a href="#1">1</a>
					    <ul>
					        <li><a href="#10">#1A</a></li>
					        <li><a href="#11">#1B</a></li>
					        <li><a href="#12">#1C</a></li>
					        <li><a href="#13">#1D</a></li>
					        <li><a href="#14">#1E</a></li>
					        <li><a href="#15">#1F</a></li>
					        <li><a href="#16">#1G</a></li>
					     </ul>
				    </li>
				    <li>
				    	<a href="#2">2</a>
				        <ul>
					        <li><a href="#20">#2A</a></li>
					        <li><a href="#21">#2B</a></li>
					        <li><a href="#22">#2C</a></li>
					        <li><a href="#23">#2D</a></li>
					        <li><a href="#24">#2E</a></li>
					        <li><a href="#25">#2F</a></li>
					        <li><a href="#26">#2G</a></li>
						</ul>
				    </li> 
				    <li>
				    	<a href="#3">3</a>
				    	<ul>
					        <li><a href="#30">#3A</a></li>
					        <li><a href="#31">#3B</a></li>
					        <li><a href="#32">#3C</a></li>
					        <li><a href="#33">#3B</a></li>
					        <li><a href="#34">#3C</a></li>
				    	</ul>
				    </li> 
				  </ul>
				</div>
	 		</c:when>
	 		<c:when test="${categorydto.c_num==4 }">
	 			<div class='zeta-menu-bar' id="hak4">
					<ul class="zeta-menu">	
				 	<li><div id="highName" >고객문의</div></li>
				    <li><a href="#0">0</a></li>
				    <c:if test="${sessionScope.loginRating != 9 }">
				    	<li><a href="#1">1</a></li>
				    </c:if>
				    <li><a href="#2">2</a></li>
				  	</ul>
				</div>
	 		</c:when>
	 		
	 	</c:choose>
	 
    	  
    	</body>   
    	<script>
			//var c_num="${categorydto.c_num}";
			//var c_name="${categorydto.c_name}";
			
			var c_num = "${categorydto.c_num}";
	 		var c_name = "${categorydto.c_name}";
	 		var c_idx = "${param.c_idx}";
			var b_nick = "${sessionScope.loginNick}";
			//$("#highName").html(c_name);//사이드바에 대분류 이름 넣기
			
	    	//중분류 카테고리 클릭시 소분류 카테고리 슬라이드바 나오게 하는 장치(클래스에 expand를 주고 뺏어서 css 조절함)
	    	$(function(){
				$(document).mouseup(function(e) {
					if ($(e.target).parents('.zeta-menu').length == 0) {					
						$('.zeta-menu li').removeClass('expand');
						$('.zeta-menu ul').hide();
					}
				});
				
				$(".zeta-menu>li:has(ul)>a").each( function() {
					$(this).html( $(this).html()+' &or;' );
				});
				
				 $(".zeta-menu ul li:has(ul)")
					.find("a:first")
					.append("<p style='float:right;margin:-3px'>&#9656;</p>"); 
			
				 $(".zeta-menu li>a").click(function(){
					var li = $(this).parent();
					var ul = li.parent();
					ul.find('li').removeClass('expand');
					ul.find('ul').not(li.find('ul')).hide();
					li.children('ul').toggle();
					if( li.children('ul').is(':visible') || li.has('ul')) {
						li.addClass('expand');
					} 
					});	
				});
	
			 //중분류, 소분류 카테고리 띄우기
 	    	$(document).ready(function(){
	    		
 	    		$.ajax({
	    			url:'subcategorylist',
	    			data:{c_name:c_name,c_num:c_num},
	    			dataType:'json',
	    			success:function(data){
	    				
	    				console.log(data);				
	    				
	    				var highCategory = [];//중분류에서 대분류 카테고리 담을때 사용할 배열 선언
	    				var highIdx = [];//중분류 idx를 담을 배열 선언
	    				var highCnt = 0;//중분류 배열에 담을때 사용할 카운트 변수
	    				var k =0;//바디영역의 요소에 데이터를 넣을때 사용할 카운트 변수
	    				
	    				//중분류 카테고리 들어갈 위치에 데이터 삽입
	    				for(var i =0;i<data.subList.length;i++){
	    					 if(data.subList[i].c_group == 'middle'){
	    						 
	    						 highIdx.push(data.subList[i].c_idx);
	    						 
	    						 highCategory.push(data.subList[i].c_name);
	    						 
	    						 $("a[href='#"+k+"']").html(highCategory[k]+"<input type='hidden'  id='high"+k+"' value='^"+highIdx[highCnt]+"^'/>");
	    						 k++;
	    						 highCnt++;
	    					 }
	    				}
	    				
	    				var mdCategory1 = [];//소분류 카테고리 이름 데이터를 담을 배열1
	    				var mdCategory2 = [];//소분류 카테고리 이름 데이터를 담을 배열2
	    				var mdCategory3 = [];//소분류 카테고리 이름 데이터를 담을 배열3
	    				
	    				var mdIdx1 = [];//소분류 카테고리 인덱스 데이터를 담을 배열1
	    				var mdIdx2 = [];//소분류 카테고리 인덱스 데이터를 담을 배열2
	    				var mdIdx3 = [];//소분류 카테고리 인덱스 데이터를 담을 배열3
	    				
	    				var mdCnt1 = 0;//소분류 카테고리 데이터를 담을 때 사용할 카운트 변수1
	    				var mdCnt2 = 0;//소분류 카테고리 데이터를 담을 때 사용할 카운트 변수2
	    				var mdCnt3 = 0;//소분류 카테고리 데이터를 담을 때 사용할 카운트 변수3
	    				
	    				//소분류 카테고리 데이터 삽입
	    				for(var j = 0;j<data.subList.length;j++){
	    					
							switch (data.subList[j].c_mdgroup) {
				 						
								case highCategory[1]:
									mdCategory1.push(data.subList[j].c_name);
									mdIdx1.push(data.subList[j].c_idx);
									$("a[href='#1"+mdCnt1+"']").html(mdCategory1[mdCnt1]+"<input type='hidden' value='^"+mdIdx1[mdCnt1]+"^'/>");
									$("#high1").val("^#^");
									mdCnt1++;
									break;
								
								case highCategory[2]:
									mdCategory2.push(data.subList[j].c_name);
									mdIdx2.push(data.subList[j].c_idx);
									$("a[href='#2"+mdCnt2+"']").html(mdCategory2[mdCnt2]+"<input type='hidden' value='^"+mdIdx2[mdCnt2]+"^'/>");
									$("#high2").val("^#^");
									mdCnt2++;
									break;
								
								case highCategory[3]:
									mdCategory3.push(data.subList[j].c_name);
									mdIdx3.push(data.subList[j].c_idx);
									$("a[href='#3"+mdCnt3+"']").html(mdCategory3[mdCnt3]+"<input type='hidden' value='^"+mdIdx3[mdCnt3]+"^'/>");
									$("#high3").val("^#^");
									mdCnt3++;
									break;
								
								default:
									break;
								}
	    						
	    				}
	    				console.log(mdCategory1);
	    				console.log(mdCategory2);
	    				console.log(mdCategory3);
		    			 
	    			},
	    			error:function(error){
	    				console.log(error);
	    			}   		
	    		});
	    		
	    	});
			 
			 //각 카테고리 클릭시 소분류 카테고리 idx, 대분류 c_num, 대분류 c_name을 전송
			 $("a").click(function(e){
	    		
				var cIdxHtml = e.target.innerHTML;
				
	    		var cIdxSplit = cIdxHtml.split("^");
	    		
	    		if(cIdxSplit[1] != "#"){
	    			location.href="./listCall?c_idx="+cIdxSplit[1]+"&c_num="+c_num+"&c_name="+encodeURIComponent(c_name)+"";
	    		}
	    		
	    	});
	    
    </script>
</html>
