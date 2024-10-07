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
	<h3>기존 방식 (JSP 표현식 활용)</h3>
	<%@ page import="com.br.elJstl.model.vo.Person" %>
	<%
		String cRoom = (String)request.getAttribute("classRoom");
		Person stu = (Person)request.getAttribute("student");
		Person tea = (Person)session.getAttribute("teacher");
		String aca = (String)application.getAttribute("academy");
	%>
	<p>
		학원명 : <%= aca %> <br>
		강의장 : <%= cRoom %> <br>
		강사 : <%= tea.getName() %>, <%= tea.getAge() %>, <%= tea.getGender() %> <br>
		학생 : <%= stu.getName() %>, <%= stu.getAge() %>, <%= stu.getGender() %>
	</p>
	--%>
	
	<h3>EL 방식</h3>
	<%--
		* EL 사용법
		  1. JSP 내장객체에 Attribute를 꺼내기 
		     ${ attribute명(==키값) }   =>   attribute값(==데이터값) 출력
		  2. vo 객체의 필드값 꺼내기 
		     ${ vo객체.필드명 }         =>   필드값 출력 (내부적으로 getter메소드 호출됨)
	--%>
	<p>
		학원명 : ${ academy } <br>
		강의장 : ${ classRoom } <br>
		강사 : ${ teacher.name }, ${ teacher.age }, ${ teacher.gender } <br>
		학생 : ${ student.name }, ${ student.age }, ${ student.gender }
	</p>
	
	<hr>
	
	<h3>EL의 추가적인 특징</h3>
	<%--
		* EL의 특징
		  1. EL 구문 내에 별도로 scope를 지정하지 않을 경우 
		     기본적으로 공유범위가 작은 Scope에서부터 탐색함 
		     page => request => session => application
		  2. 직접 scope 지정하는 방법
		     1) ${ pageScope.attribute명 }
		     2) ${ requestScope.attribute명 }
		     3) ${ sessionScope.attribute명 }
		     4) ${ applicationScope.attribute명 }
		  3. 해당 attribute가 존재하지 않을 경우 아무것도 출력안됨 (오류발생x, null출력x)  
	--%>
	중복되어있는 scope : ${ scope } <br> <!-- request에 담겨있는 데이터가 최초로 찾아져서 출력 -->
	
	pageSocpe에 접근 : ${ pageScope.scope } <br>
	requestScope에 접근 : ${ requestScope.scope } <br>
	sessionScope에 접근 : ${ sessionScope.scope } <br>
	applicationScope에 접근 : ${ applicationScope.scope } <br>
	
	존재하지않는 test : ${ test }
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>