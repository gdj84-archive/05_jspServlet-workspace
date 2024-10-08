<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>JSTL Core Library</h2>
	
	<h3>1. 변수(== 속성 == JSP 내장객체 내의 attribute)</h3>
	<%--
		* <c:set>
		  1. JSP 내장객체에 데이터(attribute)를 담는(binding) 구문 
		     쉽게 변수 선언 및 초기화 하는 구문이라고 생각 
		  2. 형식
		     <c:set var="" value="" [scope=""]/>   
		     <c:set var="" [scope=""]>value값</c:set>
		  3. 주요 속성
		     1) * var   : 바인딩할 Attribute명 (변수명)
		     2) * value : 바인딩할 데이터값
		     3)   scope : 저장시킬영역 (page, request, session, application), 생략시 page
		     
		  4. 내부적으로 scope로 지정한 JSP내장객체.setAttribute("var명", value값); 가 실행됨 
		  
		  5. EL 구문으로 꺼내서 출력 
		     ${ var명 } => value 값 출력
	--%>
	
	<c:set var="num1">10</c:set>										<!-- pageContext.setAttribute("num1", 10); -->
	<c:set var="num2" value="20" scope="request"/>  <!-- request.setAttribute("num2", 20); -->
	
	num1값 : ${ num1 } 또는 ${ pageScope.num1 } <br>
	num2값 : ${ num2 } 또는 ${ requestScope.num2 } <br>
	
	<c:set var="result" value="${ num1 + num2 }" scope="session"/>
	
	result값 : ${ result } 또는 ${ sessionScope.result } <br>
	
	<!-- 앞으로 자주 사용할 c:set 구문 -->
	<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
	
	contextPath값 : ${ contextPath } <br>
	
	<%--
		* <c:remove>
		  1. 바인딩 되어있는 Attribute 삭제하는 구문
		  2. 형식
		     <c:remove var="" [scope=""]/>
		  3. 주요 속성
		     1) * var   : 삭제할 Attribute명
		     2)   scope : 삭제시킬영역, 생략시 전체 scope에서 다 삭제
		  
		  4. 내부적으로 scope로 지정한 JSP내장객체.removeAttribute("var명"); 실행 
	--%>
	 
	<c:remove var="result"/>
	result값 : ${ result } <br>
	
	<%--
		* <c:out>
		  1. 특정 데이터를 출력하는 구문
		  2. 형식
		     <c:out value="" [default=""] [escapeXml=""]/>
		  3. 주요 속성
		     1) * value     : 출력할 데이터
		     2)   default   : 출력할 데이터가 존재하지 않을 경우 출력시킬 기본값 
		     3)   escapeXml : 출력할 데이터에 html태그가 존재할 경우 태그로써 해석시킬 껀지 여부 
		     				ㄴ true  : 태그로 해석안됨(문자열로 취급), 생략시 기본값
		     				ㄴ false : 태그로 해석됨
	--%>
	
	result값 : <c:out value="${ result }" default="없음"/> <br>
	
	<c:set var="outTest" value="<b>출력테스트</b>"/>
	
	outTest값 : <c:out value="${ outTest }"/> <br>
	outTest값 : <c:out value="${ outTest }" escapeXml="false"/> <br>
	
	<hr>
	
	<h3>2. 조건문</h3>
	<%--
		* <c:if>
		  1. 자바에서의 단일 if문을 대체하는 구문
		  2. 형식
		     <c:if test="조건식">
		     		해당 조건이 true일 경우 실행 또는 출력할 구문
		     </c:if>
		  3. 주요 속성
		     1) * test : 조건식 작성, 반드시 EL구문으로 작성할 것
	--%>
	
	<%-- 
	<% if(num1 <= num2){ %>
	
	<% } %>
	--%>
	
	<c:if test="${ num1 le num2 }">
		<b>num1이 num2보다 작거나 같습니다</b> <br>
	</c:if>
	
	<c:set var="str" value="안녕"/>
	
	<%-- 
	<% if(str.equals("안녕")) { %>
	
	<% } %>
	--%>
	
	<c:if test='${ str eq "안녕" }'>
		<b>Hello World</b> <br>
	</c:if>
	
	<%--
		* <c:choose>, <c:when>, <c:otherwise>
		  1. 자바에서의 else if문 또는 else문을 대체하는 구문
		  2. 형식
		     <c:choose>
		     		<c:when test="첫번째조건식">
		     			if 블럭
		     		</c:when>
		     		<c:when test="두번째조건식">
		     			else if 블럭
		     		</c:when>
		     		<c:otherwise>
		     			else 블럭
		     		</c:otherwise>
		     </c:choose>
	--%>
	
	<%-- 
	<% if(num1 > 20){ %>
	
	<% }else if(num1 >= 10) { %>
	
	<% }else { %>
	
	<% } %>
	--%>
	
	<c:choose>
		<c:when test="${ num1 > 20 }">
			<b>반갑습니다.</b>
		</c:when>
		<c:when test="${ num1 ge 10 }">
			<b>안녕하세요.</b>
		</c:when>
		<c:otherwise>
			<b>어서오세요.</b>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<h3>3. 반복문</h3>
	<%--
		* <c:forEach>
		  1. 자바에서의 for문을 대체하는 구문 
		  2. 형식
		     1) for loop문
		     		<c:forEach var="" begin="" end="" [step=""]> </c:forEach>
		     2) 향상된 for문
		     		<c:forEach var="" items="" [varStatus=""]> </c:forEach>
		  3. 주요 속성
		     1) * var   : 반복문 돌때 마다 순차적으로 증가된 값을 받기 위한 변수
		     2) * begin : 초기값
		     3) * end   : 최종값
		     4)   step  : 증가값, 생략시 기본값 1
		     --------------------------------------------------------------------
		     5) * var   : 반복문 돌 때 마다 접근되는 요소를 받기 위한 변수
		     6) * items : 순차적으로 접근하고자 하는 객체(배열|컬렉션)
		     7)   varStatus : 현재 접근된 요소의 상태값을 담기위한 변수 (count:순번, index:인덱스)
 	--%>
 	
 	<%-- 
 	<% for(int i=1; i<=10; i+=2){ %>
 	
 	<% } %>
	--%>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		반복확인 : ${ i } <br>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="6">
		<h${i}>태그안에도 적용 가능</h${i}>
	</c:forEach>
	
	
	<%@ page import="java.util.*, com.br.elJstl.model.vo.Person" %>
	<%
		String[] colorArr = {"red", "yellow", "green", "pink"};
		request.setAttribute("colors", colorArr);
		
		List<Person> personList = new ArrayList<>();
		personList.add(new Person("홍길동", 20, "남자"));
		personList.add(new Person("홍길녀", 30, "여자"));
		personList.add(new Person("홍길순", 40, "여자"));
		request.setAttribute("list", personList);
	%>
	
	<%-- 
	<% for(String c : colorArr) { %>
	
	<% } %>
	--%>
	
	<ul>
		<c:forEach var="c" items="${ colors }">
			<li style="color:${c}">${ c }</li>
		</c:forEach>
	</ul>
	
	<%-- 
	<% for(Person p : personList) { %>
	
	<% } %>
	--%>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	
	
	
	
	

</body>
</html>