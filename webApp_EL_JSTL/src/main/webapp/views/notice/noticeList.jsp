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
   <section class="row m-3" style="min-height: 500px">

    <div class="container border p-5 m-4 rounded">

      <h2 class="m-4">공지사항 목록</h2>

			<c:if test="${ loginUser.status eq 'A' }">
	      <div align="right">
	        <a href="${ contextPath }/write.no" class="btn btn-secondary btn-sm">등록하기</a>
	      </div>
      </c:if>

      <br>
      <table id="notice-list" class="table">
        <thead>
          <tr>
            <th width="100px">번호</th>
            <th width="600px">글제목</th>
            <th width="120px">작성자</th>
            <th>작성일</th>
          </tr>
        </thead>
        <tbody>
        	<c:choose>
        		<c:when test="${ empty list }">
		          <!-- case1. 조회된 공지글이 없을 경우 -->
		          <tr>
		            <td colspan="4" style="text-align:center">존재하는 공지사항글이 없습니다.</td>
		          </tr>
	          </c:when>
	          <c:otherwise>
	          	<!-- case2. 조회된 공지글이 있을 경우 -->
	          	<c:forEach var="n" items="${ list }">
			          <tr class="board-title" data-toggle="collapse" data-target="#notice${ n.noticeNo }">
			            <td>${ n.noticeNo }</td>
			            <td>${ n.noticeTitle }</td>
			            <td>${ n.noticeWriter }</td>
			            <td>${ n.registDt }</td>
			          </tr>
			          <tr class="board-content collapse" id="notice${ n.noticeNo }">
			            <td colspan="4">
			              <p class="border rounded p-3 w-75 mx-auto" style="min-height: 150px; white-space:pre;">${ n.noticeContent }</p>
			              
			              <c:if test="${ loginUser.userId eq n.noticeWriter }">
				              <div align="center">
				                <a href="${ contextPath }/modify.no?no=${ n.noticeNo }" class="btn btn-secondary btn-sm">수정하기</a>
				                <a href="${ contextPath }/delete.no?no=${ n.noticeNo }" class="btn btn-danger btn-sm">삭제하기</a>
				              </div>
			              </c:if>
			            </td>
			          </tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
        </tbody>
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