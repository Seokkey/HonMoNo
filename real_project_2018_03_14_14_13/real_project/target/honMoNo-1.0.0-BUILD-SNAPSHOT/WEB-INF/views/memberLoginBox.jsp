<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script src="http://minimar0.dothome.co.kr/js/jquery.simple-sidebar.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" type="text/css" href="./resources/css/loginBoxCss.css">
   <style>
       #loginOn{
         display: none;
      }
      
       ul, li, ol{
       	
	      list-style-type: none;
	      position: relative;
	   	  left: 8%;
	      top: 114%;
      
      }
            
     #logo {
       width: 250px;
       height: 150px;
       position: absolute;
       top: 2%;
       }
       
      #toplist{  
      
      
       position: relative;
       rtight: 150px;
       top: 150px;

      }
         
      h3{
      
      
      }
        .login {
       border: 6px solid white;
       padding: 6px;
       border-collapse: collapse;
       background-color: #999999;
      }
      
      .logout {
      position: absolute;
      left: 30%;
      }
   
      #blank{
      height: 30px;
      }
	
	  #msgcount{
	   		color: red;
	  }
	  
	  #main-navbar{
	  	left:13%;
	  }

   </style>

</head>
   <body>
   		<a href="./">
           		 <img id= "logo" src = "./resources/image/logo.png">
         </a>
        <div id="main-navbar">
           <ul id="topMenuList">
                 <li class="">
                    
                 </li>
                 
           </ul>
     
         <!-- 메뉴 사이드바 온오프 버튼 -->
           <div id="toggle-sidebar"><img src="./resources/image/slide.png" width="50px" alt="메뉴 전체보기" /></div>
        </div>
        
        
        
        <div id="main-sidebar">
           <!-- 로그인이 안되어있을때 로그인 창 -->
           <div id="loginOff">           
              
                 <table>
                     <tr>
                         <th>
                            ID : 
                         </th>
                         <td>
                             <input type="text" id="m_id"/>
                         </td>
                         <td rowspan="2">
                            <input type="button" value="로그인" onclick="javascript:login()"/>
                         </td>
                     </tr>
                     <tr>
                         <th>
                            PW : 
                         </th>
                         <td>
                             <input type="password" id="m_pass"/>
                         </td>
                     </tr>
                     <tr>
                         <td colspan="3" align="center">   
                             <a href="./memberJoinChoice">회원가입</a>
                             <a href="./memberMyIdFind">아이디 찾기</a>
                             <a href="./memberMyPwFind">비밀번호 찾기</a>
                         </td>
                     </tr>
                 </table>

            </div> 
            
            <!-- 로그인이 되어 있을때 환영멘트 -->
            <div id="loginOn">  
                  <div id = "blank" >
      	 		 </div> 
               <h3>   ${sessionScope.loginNick}님 환영합니다.</h3>
               <div id = "blank" >
      	 		 </div> 
            </div> 
            
            <!-- 마이페이지 리스트 세션으로 구분 -->
         <c:choose>
            <c:when test="${sessionScope.loginRating==9 }">
               <nav>
                      <table>
                          <tr>
                              <td><a href="./messageList?msg_category=0">
                              			<img height="80px" src = "./resources/image/letter.png">
                              		  </a>[NEW]<span id="msgcount"></span></td>
                              <td><a href="./adminUserList1"><img height="80px" src = "./resources/image/peo.png"></a></td>
                              <td><a href="./directQList?c_num=4&c_idx=22"><img height="80px" src = "./resources/image/talk.png"></a></td>
                              <!-- <td><a href="./adminDeliveryList"><img height="80px" src = "./resources/image/dele.png"></a></td> -->
                          </tr>
                          <tr>
                             <td><a href="./myEstimate"><img height="80px" src = "./resources/image/deal.png"></a></td>
                              <!-- <td><a href="./adminReport"><img height="80px" src = "./resources/image/siren.png"></a></td> -->
                        	
                        	<td><a href="./boardCategory"><img height="80px" src = "./resources/image/board.png"></a></td>
                          </tr>
                      </table>
                  </nav>
            </c:when>         
            
            <c:when test="${sessionScope.loginRating==1 || sessionScope.loginRating==2 }">
               <nav>
                      <table>
                          <tr>
                              <td><a href="./messageList?msg_category=0">
                              			<img height="80px" src = "./resources/image/letter.png">
                              		  </a>[NEW]<span id="msgcount"></span>
                              </td>
                              <td><a href="./myFavoriteMove"><img height="80px" src = "./resources/image/fa.png"></a></td>
                              <!-- <td><a href="./adminDeliveryForm"><img height="80px" src = "./resources/image/dele.png"></a></td> -->
                          </tr>
                          <tr>
                              <td><a href="./myEstimate"><img height="80px" src = "./resources/image/deal.png"></a></td>
                              <!-- <td><a href="./planDrawingList">내 도면</a></td> -->
                        <td><a href="javascript:mypage()"><img height="80px" src = "./resources/image/int.png"></a></td>
                          </tr>
                      </table>
                  </nav>
            </c:when>

            <c:otherwise>
               로그인이 필요한 서비스 입니다.
            </c:otherwise>
         </c:choose>
            <hr/>
         <c:choose>
            <c:when test="${sessionScope.loginNick==null }">
               
            </c:when>
            <c:otherwise>
                  <a href="#" onclick="logout()"><img id = "logut" height="80px" src = "./resources/image/logout.png"></a>
              </c:otherwise>
         </c:choose>
            
        </div>
        <br/><br/><br/><br/>
	</body>
   <script>
        var session = "${sessionScope.loginNick}";//세션을 담음
        var m_rating = "${sessionScope.loginRating}";
        var c_num="${param.c_num}";
        var c_name="";
        var c_idx = "${param.c_idx}";
        
        //회원가입 소비자 || 판매자 폼 분기
        function mypage(){
    		console.log("mypage() 진입");
    		if(m_rating == 1){
    			location.href="./myInfoPage1"
    		}else{
    			location.href="./myInfoPage2"
    		}
    	} 
        
        //세션에 따른 로그인 창 체크
        if(session==""){
           $("#loginOn").css("display", "none");
           $("#loginOff").css("display", "block");
        }else{
           $("#loginOn").css("display", "block");
           $("#loginOff").css("display", "none");
        }
        
        //비정상적인 접근시 페이지 이동
        function pageOut(){
			if(c_idx!=""){
				location.href="./listCall?c_idx="+c_idx+"&c_num="+c_num+"";
			}else{
				location.href="./";
			}
        }
        
        //웹소켓 메시지 체크
        $('#toggle-sidebar').click(function(){
       		if(session =! null){ //로그인 시
            	send_message(); //웹소켓에 메시지 보내기	
            }
       	});
        
 	   var wsUri = "ws://localhost:8090/honMoNo/count";
 	   function send_message() { //페이지 로드시 호출되는 함수
 	       websocket = new WebSocket(wsUri); //웹소켓 객체 생성
 	       
 	       websocket.onopen = function(evt) { //domready시 최초 실행
 	           onOpen(evt);
 	       };
 	
 	       websocket.onmessage = function(evt) { //선공시 메시지 반환
 	           onMessage(evt);
 	       };
 	
 	       websocket.onerror = function(evt) {
 	           onError(evt);
 	       };
 	   }
 		
 	   function onOpen(evt){ //웹소켓에 세션닉네임 전송
 		   var nick = "${sessionScope.loginNick}";
 		   websocket.send(nick);
 	   }
 	
 	   function onMessage(evt) {
 	   		$('#msgcount').html(evt.data);
 	   }
 	
 	   function onError(evt) { //에러시 동작
 		   console.log("웹소켓 에러"+evt.data);
 	   }
        
        //ajax를 이용한 로그인
        function login(){
        	$.ajax({
        		type:"post",
        		url:"./login",
        		data:{
        			m_id:$("#m_id").val(),
        			m_pass:$("#m_pass").val()
        		},
        		dataType:"json",
        		success:function(data){
        			console.log(data);
        			
        			if(data==1){
        				alert("로그인이 성공했습니다");
        				pageOut();
        			}else{
        				alert("아이디 또는 비밀번호가 맞지 않거나 이메일 인증이 되어있지 않습니다.");
        			}
        		},
        		error:function(error){
        			console.log(error);
        			alert("아이디 또는 비밀번호가 맞지 않거나 이메일 인증이 되어있지 않습니다.");
        		},
        	});
        }
        
        //엔터키를 이용한 로그인
        $("#m_id").keyup(function(e){        
            if(e.keyCode == 13){
                login();
            }
        });
        $("#m_pass").keyup(function(e){        
            if(e.keyCode == 13){
                login();
            }
        });
        
      	//ajax를 이용한 로그아웃
        function logout(){
      		console.log("ajax를 이용한 로그아웃");
        	$.ajax({
        		type:"get",
        		url:"./logout",
        		dataType:"json",
        		success:function(data){
        			console.log(data);
        			
        			if(data==1){
            			alert("로그아웃 되었습니다");
            			pageOut();
        			}
        		},
        		error:function(error){
        			console.log(error);
        		},
        	});
        }
        
        
        //대분류 메뉴의 페이지 이동 링크
        function hak(e){
			c_num=e.getAttribute("id");
			c_name=e.getAttribute("value");
			console.log(c_num);
			console.log(c_name);
			
			if(c_num==0){
				console.log("case 0 도달");
				location.href="./subCateList?c_num="+c_num+"&c_name="+encodeURIComponent(c_name)+"&c_idx=6";
			}else if(c_num ==4){
				location.href="./subCateList?c_num="+c_num+"&c_name="+encodeURIComponent(c_name)+"&c_idx=20";
			}else{
				location.href="./subCateList?c_num="+c_num+"&c_name="+encodeURIComponent(c_name)+"";
			}
			
       }
        
        //마이페이지가 자꾸 페이지 넘어올때마다 번쩍하면서 나왔다 사라져서 none 걸어놨다가 三 클릭하면 block으로 보이게 했음
        $("#toggle-sidebar").click(function () {
           
           $("#main-sidebar").css("display","block");
        
	    });
        
        
        
		//메인페이지 맨 위 메뉴
       	function topMenuMake(){
			
       		$.ajax({
                url:'./maincategory',
                dataType:'json',
                success:function(data){
                   console.log(data);
                   console.log(data.clist.length);
                   var contents="";
                   for(var i =0;i<data.clist.length;i++){    
                      contents +="<li><input type='button' class='topMenu' id='"+data.clist[i].c_num+"' value='"+data.clist[i].c_name+"' onclick='javascript:hak(this)'/></li>";
                   }
                    $("#topMenuList").append(contents);
                },
                error:function(error){
                   alert('error')
                   console.log(error);
                }
           });
			
		}       	
        
        
        $(document).ready(function() {
           
        	topMenuMake();//상단 대분류 카테고리 만드는 함수
        	
	        //三 모양 클릭시 마이페이지 메뉴 나오게 하는 장치
	        $('#main-sidebar').simpleSidebar({
				opener: '#toggle-sidebar',
	         	wrapper: '#main',
	         	animation: {
	            	easing: "easeOutQuint"
	         	},
	         	sidebar: {
	            	align: 'right',
	            	closingLinks: '.close-sb',
	         	},
	         	sbWrapper: {
	            	display: true
	         	}
			});
         
        });
        
   </script>
</html>