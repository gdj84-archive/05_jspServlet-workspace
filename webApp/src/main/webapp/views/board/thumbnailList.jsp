<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        <h2 class="m-4">사진게시글 목록</h2>

        <% if(loginUser != null) { %>
        <div class="m-4 d-flex justify-content-end">
          <a href="<%= contextPath %>/write.th" class="btn btn-secondary">등록하기</a>
        </div>
        <% } %>

        <div class="board-list d-flex flex-wrap justify-content-center">

					<!-- 
          <div class="card m-3" style="width:270px">
            <img class="card-img-top" src="../../assets/image/city3.jpg">
            <div class="card-body">
              <p class="card-text">게시글 제목</p>
            </div>
          </div>

          <div class="card m-3" style="width:270px">
            <img class="card-img-top" src="../../assets/image/city3.jpg">
            <div class="card-body">
              <p class="card-text">게시글 제목</p>
            </div>
          </div>

          <div class="card m-3" style="width:270px">
            <img class="card-img-top" src="../../assets/image/city3.jpg">
            <div class="card-body">
              <p class="card-text">게시글 제목</p>
            </div>
          </div>

          <div class="card m-3" style="width:270px">
            <img class="card-img-top" src="../../assets/image/city3.jpg">
            <div class="card-body">
              <p class="card-text">게시글 제목</p>
            </div>
          </div>
          
          <div class="card m-3" style="width:270px">
            <img class="card-img-top" src="../../assets/image/city3.jpg">
            <div class="card-body">
              <p class="card-text">게시글 제목</p>
            </div>
          </div>
          <div class="card m-3" style="width:270px">
            <img class="card-img-top" src="../../assets/image/city3.jpg">
            <div class="card-body">
              <p class="card-text">게시글 제목</p>
            </div>
          </div>
					-->
					 
        </div>
        

      </div>
    </section>
    <!-- Section end -->

    <!-- Footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- Footer end -->

  </div>

</body>
</html>