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
	#img-content {
		width: 500px;
		height:300px;
		margin:auto;
	}
	#img-content img{
		width: 500px;
		height: 300px;
	}
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

        <h2 class="m-4">사진게시글 상세조회</h2>

				<!-- 해당 게시글에 딸려있는 첨부파일 목록 필요 -->
        <div id="img-content" class="carousel slide" data-ride="carousel">

				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				  	<c:forEach var="at" items="${ map.list }" varStatus="atStatus">
				    	<li data-target="#img-content" data-slide-to="${ atStatus.index }" class='${ atStatus.index eq 0 ? "active" : ""}'></li>
				    </c:forEach>
				  </ul>
				
				  <!-- The slideshow -->
				  <div class="carousel-inner">
				  
				  	<c:forEach var="at" items="${ map.list }" varStatus="atStatus">
				    <div class="carousel-item ${ atStatus.index eq 0 ? 'active' : '' }">
				      <img src="${ contextPath }${ at.filePath }${ at.changeName }">
				    </div>
				    </c:forEach>
				    
				  </div>
				
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#img-content" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#img-content" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
				
				</div>
				
				<!-- 해당 게시글의 게시글 정보 -->
				<table class="table m-4">
					<tr>
						<th>제목</th>
						<td>${ map.b.boardTitle }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${ map.b.boardWriter }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><p style="min-height:200px; white-space:pre;">${ map.b.boardContent }</p></td>
					</tr>
				</table>

      </div>
    </section>
    <!-- Section end -->

    <!-- Footer start -->
    <jsp:include page="/views/common/footer.jsp"/>
    <!-- Footer end -->

  </div>

</body>
</html>