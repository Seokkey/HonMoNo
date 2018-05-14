<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style>
		table, td, th{
            border: 1px solid;
            padding: 5px;
            border-collapse: collapse;
            margin: 8px;
            text-align: center;
        }
        #sidaBarTop{
        	background-color: green;
        }
        #sideBar{
        	float: left;
        }
	</style>
</head>
	<body>
		<br/><br/><br/>
		<jsp:include page="../memberLoginBox.jsp"/>
		<br/>
		
		<h1>회원 관리</h1>
		<br/><br/>
		
		<div id="sideBar">
			<table>
			<tr>
				<th id="sidaBarTop">회원 관리</th>
			</tr>
			<tr>
				<td>가입대기 업체</td>
			</tr>
			<tr>
				<td><a href="./adminUserList2">소비자</a></td>
			</tr>
			<tr>
				<td><a href="./adminUserList3">업체</a></td>
			</tr>	
			</table>
		</div>
		
		<br/><br/>
		<h3>가입대기 업체</h3>
		<table>
            <tr>
                <th>NO</th>
                <th>아이디</th>
                <th>닉네임</th>
				<th>가입자 이름</th>
                <th>휴대폰</th>
                <th>우편번호</th>
                <th>기본주소</th>
                <th>상세주소</th>
                <th>사업자 대표명</th>
                <th>업체 전화번호</th>
                <th>사업자 번호</th>
                <th>가입 날짜</th>
                <th>상태</th>
                <th>승인</th>
            </tr>
            <tbody id="memberShopWait">
            	<tr>
            		<td colspan="14">가입대기중인 회원이 없습니다.</td>
            	</tr>
            </tbody>
		</table>
		<input id="toMainBtn" type="button" value="메인으로"/>
		
	</body>
	<script>
		var blank ="";//append 전에 붙여줄때 사용할 공백 변수
		
		//메인페이지로 이동
		$("#toMainBtn").click(function() {
			location.href="./"
		});

		//가입대기업체 데이터 불러오는 ajax
		function mListCall(){
			
			$.ajax({
				type:"get",
				url:"./mList1",
				dataType:"json",
				success:function(data){
					console.log(data);
					
					makeMemberList(data);
					
					for(var i=0;i<data.mList1.length;i++){
						if(data.mList1[i].m_rating==3){
							$("#rating"+i+"").html("가입대기");
							
						}
					}
				},
				error:function(error){
					console.log(error);
				}
			});
			
		}
		 
		//리스트 모양 만드는 함수
		function makeMemberList(data){
			
			var contents ="";//리스트 모양을 담을 변수
			
			if(data.mList1.length>0){//회원 리스트가 있을 때
				
				for(var i=0;i<data.mList1.length;i++){
					
					contents += "<tr id='rmv"+i+"'>";
					contents += "<td>"+data.mList1[i].rnum+"</td>";
					contents += "<td>"+data.mList1[i].m_id+"</td>";
					contents += "<td id='m_nick"+i+"'>"+data.mList1[i].m_nick+"</td>";
					contents += "<td>"+data.mList1[i].m_name+"</td>";
					contents += "<td>"+data.mList1[i].m_phone+"</td>";
					contents += "<td>"+data.mList1[i].m_address1+"</td>";
					contents += "<td>"+data.mList1[i].m_address2+"</td>";
					contents += "<td>"+data.mList1[i].m_address3+"</td>";
					contents += "<td>"+data.mList1[i].ms_ceoname+"</td>";
					contents += "<td>"+data.mList1[i].ms_phone+"</td>";
					contents += "<td>"+data.mList1[i].ms_conum+"</td>";
					contents += "<td>"+data.mList1[i].m_date+"</td>";
					contents += "<td id='rating"+i+"'></td>";
					contents += "<td><input type='button' value='승인' id='"+i+"' onclick='javascript:listRemove(this)'/></td></tr>";
					
				}
			
			}else{//회원 리스트가 없을 때
				contents = "<tr><td colspan='14'>가입대기중인 회원이 없습니다.</td></tr>";
			}
			$("#memberShopWait").html(blank);
			$("#memberShopWait").append(contents);
		}
		
		//가입승인 시키며 리스트 지우는 함수
		function listRemove(e){
			var rmvNum = 0;
			console.log(e);
			console.log(e.getAttribute("id"));
			rmvNum = e.getAttribute("id");

			console.log($("#m_nick"+rmvNum+"").html());
			
 			ratingUp($("#m_nick"+rmvNum+"").html(), rmvNum);
			
		}
		
		//가입대기업체 승인하는 ajax
	 	function ratingUp(m_nick, rmvNum){
			
			$.ajax({
				type:"get",
				url:"./memberRatingUp",
				data:{
					m_nick:m_nick
				},
				dataType:"json",
				success:function(data){
					console.log(data);
					
					if(data==0){
						alert("승인에 실패했습니다");
					}else{
						alert("승인이 완료되었습니다");
		 				$("#memberShopWait > #rmv"+rmvNum+"").remove();
		 				mListCall()
					}
					
				},
				error:function(error){
					console.log(error);
				}
			}); 
			
		}
		
		//페이지 시작시 실행
		$(document).ready(function(){
			
			mListCall();
			
		});
	 	
		</script>
</html>
