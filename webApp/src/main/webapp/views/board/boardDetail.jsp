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

        <h2 class="m-4">일반게시글 상세조회</h2>

        <div class="d-flex justify-content-end">
          <!-- 현재 로그인되어있는 회원이 해당 게시글의 작성자 본인일 경우 보여지는 요소 -->
          <button type="button" class="btn btn-secondary btn-sm">수정하기 페이지로</button> &nbsp;
          <button type="button" class="btn btn-danger btn-sm">삭제하기</button> &nbsp;
          <!-- ------------------------------------------------------------------------- -->
          <button type="button" class="btn btn-warning btn-sm">목록가기</button>
        </div>

        <table class="table m-4">
          <tr>
            <th width="100px">카테고리</th>
            <td>게임</td>
          </tr>
          <tr>
            <th>제목</th>
            <td>기존 일반게시글 제목</td>
          </tr>
          <tr>
            <th>내용</th>
            <td><p style="min-height:200px;">기존 일반게시글 내용</p></td>
          </tr>
          <tr>
            <th>첨부파일</th>
            <td>
              <!-- case1. 첨부파일이 존재하지 않을 경우 
              첨부파일이 없음
              -->

              <!-- case2. 첨부파일이 존재할 경우 -->
              <a href="" style="color: black">첨부파일원본명</a>
            </td>
          </tr>
        </table>

      </div>
    </section>
    <!-- Section end -->

    <!-- Footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- Footer end -->

  </div>
</body>
</html>