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
	num1값(구분자유) : <fmt:formatNumber value="${ num1 }" /> <br>
	
	num2값(백분율) : <fmt:formatNumber value="${ num2 }" type="percent" /> <br>
	
	num3값(원화 통화기호, 구분자무) : 
	<fmt:formatNumber value="${ num3 }" type="currency" groupingUsed="false"/><br>
	num3값(달러 통화기호, 구분자유) :
	<fmt:formatNumber value="${ num3 }" type="currency" currencySymbol="$" />
	
	<hr>
	
	<h3>2. 날짜 및 시간 데이터 포맷(형식) 지정</h3>
	<%-- 
		* <fmt:formatDate>
		  1. 날짜 및 시간 데이터의 출력형식을 지정하는 구문
		  2. 기본적으로 제공하는 포맷 종류 다양함, 본인이 원하는 형식으로 지정도 가능
		  3. 형식
		     <fmt:formatDate value="" [type=""] [dateStyle=""] [timeStyle=""] [pattern=""] />
		  4. 주요 속성
		     1) * value   : 출력시킬 날짜 및 시간데이터 (단, java.util.Date 객체여야됨)
		     2)   type    : 날짜 및 시간 중 출력할 타입 지정
		     			  ㄴ date : 날짜만 출력, 생략시 기본값
		     			  ㄴ time : 시간만 출력
		     			  ㄴ both : 둘 다 출력
		     3)   dateStyle, timeStyle : 기본적으로 제공하고 있는 날짜 및 시간 스타일 지정
		     				ㄴ full, long, medium(생략시 기본값), short
		     4)   pattern : 기본적으로 제공하는 스타일 중에 원하는 스타일이 없을 경우 
		     								따로 패턴 제시 가능 
	--%>
	
	<c:set var="current" value="<%= new java.util.Date() %>"/>
	
	<ul>
		<li>현재 날짜 : <fmt:formatDate value="${ current }" /></li>
		<li>현재 시간 : <fmt:formatDate value="${ current }" type="time"/></li>
		<li>둘 다 : <fmt:formatDate value="${ current }" type="both" /></li>
		<li>medium : <fmt:formatDate value="${ current }" type="both" dateStyle="medium" timeStyle="medium"/></li>
		<li>long : <fmt:formatDate value="${ current }" type="both" dateStyle="long" timeStyle="long"/></li>
		<li>full : <fmt:formatDate value="${ current }" type="both" dateStyle="full" timeStyle="full"/></li>
		<li>short : <fmt:formatDate value="${ current }" type="both" dateStyle="short" timeStyle="short"/></li>
		<li>내패턴 : <fmt:formatDate value="${ current }" type="both" pattern="yyyy-MM-dd(E) hh:mm:ss(a)" /></li>
		<!-- HH : 24시간형식 / hh : 12시간형식 -->
	</ul>
	
	
	
	
	
	
	
	
	

</body>
</html>