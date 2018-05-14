<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<style>
		
			#bbslist{
				position: absolute;
                top:22%;
                right: 43%;
			}
		</style>
	</head>
	<body>
		<jsp:include page="../memberLoginBox.jsp"/>
		
		<jsp:include page="../mdgroupSideBar.jsp"/>
		<br>
		<br>
		<div id="bbslist">
			<h1>매장정보 이용안내</h1>
		</div>
		<div style="margin-left: 20%">
			<img src="./resources/image/shopinfo.png" width="1200" height="1200"/>
		</div>
	</body>
	<script>
		var c_num="${categorydto.c_num}";
		var c_name="${categorydto.c_name}";
		console.log(c_num);
		console.log(c_name);
	</script>
</html>