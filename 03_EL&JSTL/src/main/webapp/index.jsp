<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%--
		* EL 
		  1. Expression Language (표현언어)
		  2. 기존에 JSP에서 사용했던 표현식(<%= %>)의 대안 
		  3. JSP 내장객체(Scope)에 담겨있는 attribute를 출력하는 표현법
		  4. 예시 
		     request.setAttribute("str", "안녕하세요");
		     request.setAttribute("b", Board객체);
		     위와 같다는 가정하에 
		     
		     1) JSP 표현식
		        ㄴ str값 : <%= request.getAttribute("str") %>
		        ㄴ b의 boardTitle 필드값 : <%= ((Board)request.getAttribute("b")).getBoardTitle() %>
		        
		     2) EL 
		     	  ㄴ str값 : ${ str }
		     	  ㄴ b의 boardTitle 필드값 : ${ b.boardTitle }
	--%>
	
	<h3>* EL</h3>
	<a href="<%= request.getContextPath() %>/el.do">1) EL 기본 구문</a> <br>
	<a href="<%= request.getContextPath() %>/elOperator.do">2) EL 연산자</a>
	
	<hr>
	
	<h3>* JSP Action Tag</h3>
	<%--
		* JSP 를 이루는 구성인자
		  1. 스크립트 원소 
		     1) 스크립틀릿(<% %>) : 자바코드 작성 (변수 선언, 제어문 등)
		     2) 표현식(<%= %>)    : 자바 값 출력 
		     3) 선언식(<%! %>)    : 메소드 및 멤버변수 정의 
		  
		  2. 지시어
		     1) page 지시어    : jsp에 대한 정보 기술 
		     2) include 지시어 : 다른 jsp 포함시키는 기술
		     3) taglib 지시어  : 외부 라이브러리를 해당 jsp에서 사용할 수 있게 하는 기술 
		  
		  3. 액션 태그 : xml 태그 방식을 이용해서 기존의 jsp 문법을 확장하는 기술 
		     1) 표준 액션 태그
		        ㄴ 별도의 라이브러리 필요없이 바로 작성 가능 
		        ㄴ 태그명에 jsp: 접두어가 기술 
		     2) 커스텀 액션 태그      
		     	  ㄴ 별도의 라이브러리 등록을 통해 사용 가능 
		     	  ㄴ 태그명에 라이브러리 종류별 접두어가 기술
	--%>
	
	<h4>1. 표준 액션 태그 (Standard Action Tag)</h4>
	<a href="<%=request.getContextPath()%>/02_standardAction/include.jsp">1) jsp:include</a> <br>
	<a href="<%=request.getContextPath()%>/02_standardAction/forward.jsp">2) jsp:forward</a>
	
	<h4>2. 커스텀 액션 태그 (JSTL)</h4>
	<%--
		* JSTL
		  1. JSP Standard Tag Library
		  2. 자주 쓰는 자바 코드를 보다 쉽게 사용할 수 있도록 태그화 시킨 대표적인 라이브러리
		  3. 라이브러리 연동 
		     1) jstl 라이브러리(jar) 다운 받기 => lib 폴더에 넣기 
		     2) jstl 구문을 작성하기 위한 jsp 상단에 taglib 지시어로 라이브러리 연동하기
		  4. 대표적인 라이브러리 종류
		     1) Core Library			 : 변수와 제어문 등의 로직과 관련된 문법 제공
		     2) Formatting Library : 숫자, 날짜 및 시간 데이터의 출력 형식 관련 문법 제공 
		     3) Function Library   : EL 구문 내에서 사용 가능하는 함수 제공 
	--%>
	<a href="${ pageContext.request.contextPath }/03_customAction/core.jsp">1) JSTL Core Library ****</a> <br>
	<a href="">2) JSTL Formatting Library</a> <br>
	<a href="">3) JSTL Function Library</a>
	
	
</body>
</html>