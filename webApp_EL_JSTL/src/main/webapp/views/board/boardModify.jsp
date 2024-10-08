<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>

<!-- map내의 Board객체, Attachment 객체를 꺼내서 b, at 이름으로 세팅해두기 -->
<c:set var="b" value="${ map.b }"/>
<c:set var="at" value="${ map.at }"/>
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

        <h2 class="m-4">일반게시글 수정</h2>
        
        <form action="${ contextPath }/update.bo" method="post" enctype="multipart/form-data" class="m-4">
          <input type="hidden" name="no" value="${ b.boardNo }">
          <table class="table">
            <tr>
              <th width="100">카테고리</th>
              <td>
              	<select name="category" class="form-control">
                	<c:forEach var="c" items="${ list }">
	                  <option value="${ c.categoryNo }" ${ c.categoryName eq b.category ? "selected" : "" }>${ c.categoryName }</option>
                  </c:forEach>
                </select>
              </td>
            </tr>
            <tr>
              <th>제목</th>
              <td><input type="text" class="form-control" required name="title" value="${ b.boardTitle }"></td>
            </tr>
            <tr>
              <th>내용</th>
              <td><textarea rows="10" class="form-control" style="resize:none;" name="content" required>${ b.boardContent }</textarea></td>
            </tr>
            <tr>
              <th>첨부파일</th>
              <td>
              	<c:if test="${ not empty at }">
                	${ at.originName } <br>
                	<input type="hidden" name="originFileNo" value="${ at.fileNo }">
								</c:if>
                <!-- 새로이 첨부파일 업로드 해서 수정 가능 -->
                <input type="file" name="upfile">
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
    <jsp:include page="/views/common/footer.jsp"/>
    <!-- Footer end -->

  </div>
</body>
</html>