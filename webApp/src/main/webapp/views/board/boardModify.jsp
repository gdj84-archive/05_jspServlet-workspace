<%@ page import="java.util.*" %>
<%@ page import="com.br.web.board.model.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Category> list = (List<Category>)request.getAttribute("list");
	Map<String, Object> map = (Map<String, Object>)request.getAttribute("map");
	Board b = (Board)map.get("b"); // 게시글번호, 제목, 내용, 작성자, 카테고리명
	Attachment at = (Attachment)map.get("at"); // null | 파일번호, 원본명, 수정명, 저장경로
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container p-3">

    <!-- Header, Nav start -->
    <%@ include file="/views/common/header.jsp" %>
    <!-- Header, Nav end -->

    <!-- Section start -->
    <section class="row m-3" style="min-height: 500px;">
      <div class="container border m-4 p-5 rounded">

        <h2 class="m-4">일반게시글 수정</h2>
        
        <form action="" method="" class="m-4">
          <table class="table">
            <tr>
              <th width="100">카테고리</th>
              <td>
                <select name="" class="form-control">
                	<% for(Category c : list){ %>
                  <option value="<%= c.getCategoryNo() %>" <%= c.getCategoryName().equals(b.getCategory()) ? "selected" : "" %>><%= c.getCategoryName() %></option>
                  <% } %>
                </select>
              </td>
            </tr>
            <tr>
              <th>제목</th>
              <td><input type="text" class="form-control" required value="기존 게시글 제목"></td>
            </tr>
            <tr>
              <th>내용</th>
              <td><textarea rows="10" class="form-control" style="resize:none;" required>기존 게시글 내용</textarea></td>
            </tr>
            <tr>
              <th>첨부파일</th>
              <td>
                <!-- 기존에 첨부파일이 있었을 경우 보여지는 기존 첨부파일명 -->
                기존첨부파일명.확장자 <br>

                <!-- 새로이 첨부파일 업로드 해서 수정 가능 -->
                <input type="file">
              </td>
            </tr>
            <tr>
              <td colspan="2" align="center">
                <button type="submit" class="btn btn-outline-secondary btn-sm">수정하기</button>
                <button type="reset" class="btn btn-outline-danger btn-sm">초기화</button>
                <button type="button" class="btn btn-outline-warning btn-sm" onclick="history.back();">뒤로가기</button>
              </td>
            </tr>
          </table>
        </form>
        
      </div>
    </section>
    <!-- Section end -->

    <!-- Footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- Footer end -->

  </div>
</body>
</html>