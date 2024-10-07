<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>jsp:forward</h3>
	<p>jsp에서 또다른 jsp로 바로 포워딩하고자 할 때</p>
	
	<% if(10 < 3) { %>
		<jsp:forward page="/01_el/elBasic.jsp"/>
	<% } else { %>
		<jsp:forward page="/02_standardAction/footer.jsp">
			<jsp:param name="test" value="hello world"/>
		</jsp:forward>
	<% } %>

</body>
</html>