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
	<a href=""></a>
	
	
	
	
	
</body>
</html>