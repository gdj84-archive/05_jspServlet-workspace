<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>jsp:include</h3>
	<p>또 다른 페이지를 포함하고자 할 때 사용하는 태그</p>
	
	<%-- 
	<h4>기존 include 지시어 방식 (정적 include 방식)</h4>
	<%@ include file="footer.jsp" %>
	<br>
	
	특징 : include 하는 jsp 상에 선언된 변수를 현재 이 페이지에서도 사용 가능 <br>
	currentYear : <%= currentYear %> <br><br>
	
	단, 현재 이 페이지에서 동일한 이름의 변수를 재선언할 수 없음 <br>
	<% int currentYear = 2024; %>
	--%>
	
	<h4>include 표준액션태그 방식 (동적 include 방식)</h4>
	<%-- 액션태그 사용시 유의사항 : 반드시 종료태그까지 존재해야됨 --%>
	<%--<jsp:include page="footer.jsp"></jsp:include> // 직접 종료태그까지 기술--%>
	<jsp:include page="footer.jsp"/> <%-- 시작태그 마지막위치에 / 그어서 바로 종결시키는 방법 --%>
	
	<br>
	
	특징1 : include 하는 jsp 상에 선언된 변수는 현재 페이지에서 사용 불가능 (따라서 재선언 가능) <br>
	<%-- currentYear : <%= currentYear %> --%>
	
	특징2 : include시 해당 jsp로 값을 전달해서 동적으로 표현할 수 있음 <br>
	<jsp:include page="footer.jsp">
		<jsp:param name="test" value="hello"/>
	</jsp:include>
	<br>
	
	<% request.setCharacterEncoding("utf-8"); // 한글데이터 전달시 %>
	<jsp:include page="footer.jsp">
		<jsp:param name="test" value="잘가"/>
	</jsp:include>
	
	
	
	
	
	
	
	

</body>
</html>