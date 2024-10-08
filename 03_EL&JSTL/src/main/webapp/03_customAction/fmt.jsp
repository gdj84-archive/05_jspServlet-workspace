<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>JSTL Formatting Library</h2>
	
	<h3>1. 숫자데이터 포맷(형식) 지정</h3>
	<%-- 
		* <fmt:formatNumber>
		  1. 숫자데이터의 출력형식을 지정하는 구문
		  2. 통화기호, 백분율 등 쓰임에 맞게 지정 가능 
		  3. 형식
		     <fmt:formatNumber value="" [groupingUsed=""] [type=""] [currencySymbol=""]/>
		  4. 주요 속성
		     1) * value         : 출력시킬 숫자 데이터 (숫자 아닌 값 제시시 NumberFormatException발생)
		     2)   groupingUsed  : 세자리마다 구분자(,) 표시 여부 지정
		     						ㄴ true : 구분자 유, 생략시 기본값
		     						ㄴ false: 구분자 무
		     3)   type          : 출력형식 지정 
		     				ㄴ percent  : 백분율 (%)
		     				ㄴ currency : 통화기호 (\)
		     4)   currencySymbol: 통화기호문자, 생략시 현재 로케일에 맞는 통화기호
	--%>
	
	<c:set var="num1" value="123456789" />
	<c:set var="num2" value="0.75" />
	<c:set var="num3" value="50000" />
	
	num1값(그냥출력) : ${ num1 } <br>
	num1값(구분자유) : <fmt:formatNumber value="${ num1 }" />
	

</body>
</html>