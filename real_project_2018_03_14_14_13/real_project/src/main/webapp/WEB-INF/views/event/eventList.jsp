<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <style>
        	
        	#bbslist{
        		position: absolute;
                top:37%;
                margin-left: 37%
        	}
        	.arti1{
			width: 140%;
			height: 100%;
			/* border: 1px solid black; */
		}
		.arti2{
			width: 18%;
			height: 40%;
			/* border: 1px solid black; */
			display: inline-block;
			float: left;
		}
		.arti3{
			width: 50%;
			height: 50%;
		/* 	border: 1px solid black; */
		}
		
		.arti3 img{
			width: 100%;
			height: auto;
		}
        </style>
    </head>
    <body>
		
		<jsp:include page="../memberLoginBox.jsp"/>
		<h1>이벤트</h1>
		<jsp:include page="../mdgroupSideBar.jsp"/>

		<br/><br/><br/>
		<div id="bbslist">		  	
		<div >
			<div class="arti1">
				<c:forEach items="${blist }" var="blist">
					<div class="arti2">
					
						<div  >
							<a href="./evDetail?b_idx=${blist.b_idx}&c_idx=${c_idx}&c_num=${c_num}">${blist.b_subject }</a>
						</div>
						
						<div class="arti3">					
							<c:forEach items="${photoList }" var="photoList">
								<c:if test="${blist.b_idx == photoList.b_idx }">
										<a href="./evDetail?b_idx=${blist.b_idx}&c_idx=${c_idx}&c_num=${c_num}"><img class="image" src="${photoList.p_path}${photoList.p_newname}"/></a>
								</c:if>		
							</c:forEach>										
						</div>
						
						<div  style="width: 100%">
							<div>${blist.ev_end}</div>
						</div>
						
					</div>	
				</c:forEach>	
			</div>		
			</div>      
      <br/>	
      <div style="text-align: center;">${paging}</div>
		<br/>
		<br/>	
		<c:if test="${sessionScope.loginRating == 9 }">
			<a href = "./evWriteForm?c_idx=${param.c_idx}&c_num=${param.c_num}"> 등록하기</a>
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
