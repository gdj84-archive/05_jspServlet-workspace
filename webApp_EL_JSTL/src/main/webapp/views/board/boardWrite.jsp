<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container p-3">

    <!-- Header, Nav start -->
    <jsp:include page="/views/common/header.jsp"/>
    <!-- Header, Nav end -->

    <!-- Section start -->
    <section class="row m-3" style="min-height: 500px;">
      <div class="container border m-4 p-5 rounded">

        <h2 class="m-4">일반게시글 작성</h2>
        
        <form action="${ contextPath }/insert.bo" method="post" enctype="multipart/form-data" class="m-4">
          <table class="table">
            <tr>
              <th width="100">카테고리</th>
              <td>
                <select name="category" class="form-control">
                	<c:forEach var="c" items="${ list }">
	                  <option value="${ c.categoryNo }">${ c.categoryName }</option>
                  </c:forEach>
                </select>
              </td>
            </tr>
            <tr>
              <th>제목</th>
              <td><input type="text" class="form-control" name="title" required></td>
            </tr>
            <tr>
              <th>내용</th>
              <td><textarea rows="10" class="form-control" name="content" style="resize:none;" required></textarea></td>
            </tr>
            <tr>
              <th>첨부파일</th>
              <td><input type="file" name="upfile"></td>
            </tr>
            <tr>
              <td colspan="2" align="center">
                <button type="submit" class="btn btn-outline-secondary btn-sm">등록하기</button>
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
    <jsp:include page="/views/common/footer.jsp"/>
    <!-- Footer end -->

  </div>

</body>
</html>