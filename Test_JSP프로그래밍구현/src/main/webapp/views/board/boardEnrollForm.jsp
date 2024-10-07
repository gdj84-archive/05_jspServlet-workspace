<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#enroll-form input, #enroll-form textarea{
		width:100%;
		box-sizing:border-box;
	}
	#enroll-form table{
		border:1px solid black;
	}
</style>
</head>
<body>

	<!-- 
		게시글 작성하는 폼임. 현재 이 jsp는 수정하지말것 
		이 페이지에서 작성하기 버튼 클릭시 요청되는 url은 /insert.bo 임. 
		
		/insert.bo 요청시 실행되는 BoardInsertController 서블릿 가서 구문 작성하기.
	 -->

	<form action="<%= request.getContextPath() %>/insert.bo" method="post" enctype="multipart/form-data" id="enroll-form">
		<table>
			<tr>
				<th width="70">카테고리</th>
				<td>
					<select name="category">
						<option>자유게시판</option>
						<option>질문게시판</option>
					</select>
				</td>
			</tr>
			<tr>
				<th width="70">제목</th>
				<td width="500"><input type="text" name="title" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" name="content" required style="resize:none"></textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="upfile"></td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="submit">작성하기</button>
				</th>
			</tr>
		</table>
	</form>

</body>
</html>