<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>JSTL Functions Library</h2>
	
	<c:set var="str" value="How Are You?"/>
	
	str값 : ${ str } <br>
	
	문자열의 길이 : ${ str.length() } 또는 ${ fn:length(str) } <br><br>
	<!-- List 또는 배열도 제시가능함 => 리스트의 size() 또는 배열의 length 출력 -->
	
	모두 대문자로 출력 : ${ str.toUpperCase() } 또는 ${ fn:toUpperCase(str) } <br>
	모두 소문자로 출력 : ${ str.toLowerCase() } 또는 ${ fn:toLowerCase(str) } <br><br>
	
	Are의 시작인덱스 : ${ str.indexOf("Are") } 또는 ${ fn:indexOf(str, "Are") } <br><br>
	
	Are => Were 변경 : ${ str.replace("Are", "Were") } 또는 ${ fn:replace(str, "Are", "Were") } <br><br>
	
	문자열 추출 : ${ str.substring(1, 5) } 또는 ${ fn:substring(str, 1, 5) } <br><br>
	
	<c:if test="${ fn:contains(str, 'Are') }">
		<b>포함되어있음</b> <br>
	</c:if>
	
	<c:if test="${ fn:containsIgnoreCase(str, 'are') }">
		<b>대소문자 가리지 않고 포함되어있음</b> <br>
	</c:if>
	
	
	
	
	
	

</body>
</html>