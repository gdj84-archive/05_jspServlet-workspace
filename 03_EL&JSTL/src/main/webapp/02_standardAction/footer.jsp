<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String currentYear = new java.text.SimpleDateFormat("yyyy").format(new java.util.Date());
	%>

	<div style="border:1px solid gray; padding:10px;">
		Copyright ⓒ 2000-<%= currentYear %> GooDee Academy. All rights reserved.
		<br>
		jsp:include로 해당 페이지 포함시 전달된 데이터 : ${ param.test }
	</div>

</body>
</html>