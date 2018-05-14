<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<style>
		</style>
		<title>중고 거래 폼</title>
	</head>
	<body>		
		<p>중고 거래하기<p>
		<form>	
		<table>			
			<tr>				
				<td>제품 분류 : 분류 자동입력 칸</td>
			</tr>
			<tr>
				<td>
					<input type="radio" name="a" value="bye">삽니다
					<input type="radio" name="a" value="sell">팝니다
				</td>
			</tr>			
			<tr>
				<td>브랜드 : 
					<select name="brandCategorize">
						<option value="">브랜드 선택</option>
					    <option value="시몬스">시몬스</option>
					    <option value="에이스">에이스</option>
					    <option value="템퍼">템퍼</option>
					    <option value="한샘">한샘</option>
					    <option value="리바트">리바트</option>
					    <option value="에몬스">에몬스</option>
					    <option value="기타 브랜드">기타 브랜드</option>
					</select>		
				</td>
			</tr>
			<tr>
				<td>제목 :  <input type="text"> </td>
			</tr>
			<tr>
				<td>사진 첨부 : 
					<button onclick="location.href='#'">첨부</button>
					<button onclick="location.href='#'">삭제</button>
				</td>		
			</tr>
			<tr>
				<td>└ 첨부한 사진1, 사진2, 사진3....</td>
			</tr>
			<tr>
				<td>내용 : 
					<textarea>
	                </textarea>
	            </td>
			</tr>			
			<tr>
				<td>지역 :
					<select name="area">
						<option value="">지역 선택</option>
					    <option value="서울">서울</option>
					    <option value="인천">인천</option>
					    <option value="대전">대전</option>
					    <option value="대구">대구</option>
					    <option value="부산">부산</option>
					    <option value="울산">울산</option>
					    <option value="광구">광주</option>
					    <option value="충북">충북</option>
					    <option value="충남">충남</option>
					    <option value="경북">경북</option>
					    <option value="경남">경남</option>
					    <option value="전북">전북</option>
					    <option value="전남">전남</option>
					    <option value="제주">제주</option>
					    <option value="도서산간">도서산간</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td>안전 거래 여부 : 
					<input type="radio" name="b" value="safe">안전거래
					<input type="radio" name="b" value="direct">직접거래
				</td>
		</table>
		</form>
		<input type="submit" value="등록">
		<button onclick="location.href='#'">취소</button>
	</body>
	<script>
	</script>
</html>