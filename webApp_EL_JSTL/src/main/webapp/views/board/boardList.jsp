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

        <h2 class="m-4">일반게시글 목록</h2>

				<c:if test="${ not empty loginUser }">
	        <div class="d-flex justify-content-end">
	          <a href="${ contextPath }/write.bo" class="btn btn-secondary btn-sm">등록하기</a>
	        </div>
				</c:if>
				
        <br>
        <table class="table table-hover" id="board-list">
          <thead>
            <tr>
              <th width="100px">번호</th>
              <th width="100px">카테고리</th>
              <th width="400px">글제목</th>
              <th width="120px">작성자</th>
              <th>조회수</th>
              <th>작성일</th>
            </tr>
          </thead>
          <tbody>
          	<!-- 사용자가 요청한 페이지에 뿌려줄 게시글 데이터 조회해와야됨 -->
          
          	<c:choose>
          		<c:when test="${ empty list }">
		            <!-- case1. 조회된 게시글이 없을 경우 -->
		            <tr>
		              <td colspan="6" style="text-align: center;">존재하는 게시글이 없습니다.</td>
	  	          </tr>
	            </c:when>
							<c:otherwise>
		            <!-- case2. 조회된 게시글이 있을 경우 -->
		            <c:forEach var="b" items="${ list }">
			            <tr>
			              <td>${ b.boardNo }</td>
			              <td>${ b.category }</td>
			              <td>${ b.boardTitle }</td>
			              <td>${ b.boardWriter }</td>
			              <td>${ b.boardCount }</td>
			              <td>${ b.registDt }</td>
			            </tr>
		            </c:forEach>
            	</c:otherwise>
            </c:choose>
          </tbody>
        </table>
        <script>
        	$(function() {
        		$('#board-list tbody>tr').on('click', function() {
        			
        			// 현재 클릭한 게시글 번호
        			let no = $(this).children().eq(0).text();
        			// 현재 클릭한 게시글 작성자 아이디
        			let writer = $(this).children().eq(3).text();
        			// 현재 로그인한 회원 아이디
        			let loginUserId = '${ loginUser.userId }';
        			
        			if(writer == loginUserId) {
        				// 현재 내가 쓴 글일 경우 => 조회수증가없이 상세페이지로 바로 이동
        				location.href = "${ contextPath }/detail.bo?no=" + no;
        			}else{
        				// 내가 쓴 글이 아닐 경우 => 조회수증가하면서 상세페이지로 이동
        				location.href = "${ contextPath }/increase.bo?no=" + no;
        			}
        		})
        	})
        </script>
				
				<!-- 사용자가 현재보고있는 페이지가 뭐냐에 따라서 다르게 보여질 페이징바 -->
        <ul class="pagination d-flex justify-content-center text-dark">
        
          <li class='page-item ${pi.currentPage eq 1 ? "disabled" : ""}'>
          	<a class="page-link" href="${ contextPath }/list.bo?page=${pi.currentPage - 1}">Previous</a>
          </li>
          
          <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
          	<li class='page-item ${p eq pi.currentPage ? "active" : ""}'>
          		<a class="page-link" href="${ contextPath }/list.bo?page=${p}">${p}</a>
          	</li>
					</c:forEach>
          
          <li class='page-item ${pi.currentPage eq pi.maxPage ? "disabled" : ""}'>
          	<a class="page-link" href="${ contextPath }/list.bo?page=${pi.currentPage + 1}">Next</a>
          </li>
          
        </ul>
        
      </div>
    </section>
    <!-- Section end -->

    <!-- Footer start -->
    <jsp:include page="/views/common/footer.jsp"/>
    <!-- Footer end -->

</body>
</html>