<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.thumbnail{cursor:pointer;}
</style>
</head>
<body>

	<div class="container p-3">

    <!-- Header, Nav start -->
    <jsp:include page="/views/common/header.jsp"/>
    <!-- Header, Nav end -->


    <!-- Section start -->
    <section class="row m-3" style="min-height: 500px;">
      <div class="container border m-4 p-5 rounded">

        <h2 class="m-4">사진게시글 목록</h2>

				<c:if test="${ not empty loginUser }">
	        <div class="m-4 d-flex justify-content-end">
	          <a href="${ contextPath }/write.th" class="btn btn-secondary">등록하기</a>
	        </div>
				</c:if>
				
        <div class="board-list d-flex flex-wrap">
					<c:forEach var="b" items="${ list }">
	          <div class="thumbnail card m-3" style="width:270px" data-no="${ b.boardNo }">
	            <img class="card-img-top" style="width: 270px; height: 200px;" src="${ contextPath }${ b.titleImgURL }">
	            <div class="card-body">
	              <p class="card-text">${ b.boardTitle }</p>
	            </div>
	          </div>
					</c:forEach>					 
        </div>
        
        <script>
        	$(function() {
        		$('.thumbnail').on('click', function() {
        			location.href = '${ contextPath }/detail.th?no=' + $(this).data('no');
        		})
        	})
        </script>
        

      </div>
    </section>
    <!-- Section end -->

    <!-- Footer start -->
    <jsp:include page="/views/common/footer.jsp"/>
    <!-- Footer end -->

  </div>

</body>
</html>