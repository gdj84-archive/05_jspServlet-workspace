<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>El 내에 사용 가능한 연산자</h2>

	<h3>1. 산술 연산</h3>
	
	<h4>기존 방식 (JSP 표현식)</h4>
	+ : <%= (int)request.getAttribute("big") + (int)request.getAttribute("small") %>
	
	<h4>EL 방식</h4>
	+ : ${ big + small } <br>
	- : ${ big - small } <br>
	* : ${ big * small } <br>
	/ : ${ big / small } 또는 ${ big div small } <br>
	% : ${ big % small } 또는 ${ big mod small } <br>
	<%-- 기본적으로 EL 내에서 산술연산자 작성시 피연산자들을 숫자형으로 형변환해서 연산 --%>

	<h4>* 유의사항 : 문자열을 연이어주고자 할 때 + 연산 사용 불가!</h4>
	<%-- ${ str1 + str2 } => NumberFormatException 발생 : 숫자가 아닌 문자열을 숫자형으로 파싱 불가 --%>
	${ str1 }${ str2 }
	
	<hr>
	
	<h3>2. 대소 비교 연산</h3>
	&gt; : ${ big > small } 또는 ${ big gt small } <br>
	&lt; : ${ big < small } 또는 ${ big lt small } <br>
	&gt;= : ${ big >= small } 또는 ${ big ge small } <br>
	&lt;= : ${ big <= small } 또는 ${ big le small } <br>
	
	<hr>
	
	<h3>3. 동등 비교 연산</h3>
	<h4>일치</h4>
	${ big == 10 } 또는 ${ big eq 10 } <br>
	${ str1 == str2 } 또는 ${ str1 eq str2 } <br>
	<%-- EL 내에서의 == 는 자바에서의 equals와 동일하게 동작 --%>
	${ str1 == "안녕" } 또는 ${ str1 eq '안녕' } 
	<%-- EL 내에서 문자열 제시시 '' | "" 구분없음 --%>

	<h4>불일치</h4>
	${ big != 10 } 또는 ${ big ne 10 } <br>
	${ str1 != str2 } 또는 ${ str1 ne str2 } 
	
	<hr>
	
	<h3>4. 객체가 null인지 또는 리스트가 비어있는지 비교</h3>
	
	per1 이 null인지 : ${ per1 == null } 또는 ${ empty per1 } <br>
	per2 가 null인지 : ${ per2 == null } 또는 ${ empty per2 } <br>
	per1 이 null이 아닌지 : ${ per1 != null } 또는 ${ not empty per1 }<br>
	<%-- EL 내에서의 not == 자바에서의 !(논리부정연산자) --%>
	
	list1이 비어있는지 : ${ empty list1 } <br>
	list2가 비어있는지 : ${ empty list2 } 
	
	<hr>
	
	<h3>5. 논리 연산자</h3>
	&& : ${ true && true } 또는 ${ true and true } <br>
	|| : ${ false || true } 또는 ${ false or true } <br>
	
	big이 small보다 크고 list2가 비어있냐 : ${ big gt small and empty list2 }



</body>
</html>