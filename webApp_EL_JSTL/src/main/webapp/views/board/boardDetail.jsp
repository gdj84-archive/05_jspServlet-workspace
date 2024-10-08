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
	#reply-area span{
		color: gray;
		cursor: pointer;
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

        <h2 class="m-4">일반게시글 상세조회</h2>

        <div class="d-flex justify-content-end">
        	<c:if test="${ loginUser.userId eq map.b.boardWriter }">
	          <a href="${ contextPath }/modify.bo?no=${ map.b.boardNo }" class="btn btn-secondary btn-sm">수정하기 페이지로</a> &nbsp;
	          <button type="button" class="btn btn-danger btn-sm">삭제하기</button> &nbsp;
          </c:if>
          <a href="${ contextPath }/list.bo" class="btn btn-warning btn-sm">목록가기</a>
        </div>

				<br>
        <table class="table">
          <tr>
            <th width="100px">카테고리</th>
            <td>${ map.b.category }</td>
          </tr>
          <tr>
            <th>제목</th>
            <td>${ map.b.boardTitle }</td>
          </tr>
          <tr>
            <th>내용</th>
            <td><p style="min-height:200px; white-space:pre;">${ map.b.boardContent }</p></td>
          </tr>
          <tr>
            <th>첨부파일</th>
            <td>
            	<c:choose>
            		<c:when test="${ empty map.at }"> 
		              <!-- case1. 첨부파일이 존재하지 않을 경우 -->
		              첨부파일이 없음
								</c:when>
								<c:otherwise>
		              <!-- case2. 첨부파일이 존재할 경우 -->
		              <a download="${ map.at.originName }" href="${contextPath}${map.at.filePath}${map.at.changeName}" style="color: black">${ map.at.originName }</a>
								</c:otherwise>
              </c:choose>
            </td>
          </tr>
        </table>
        <br><br>
        
        <table id="reply-area" class="table">
        	<thead>
        		<tr>
        			<th style="vertical-align:middle">댓글작성</th>
        			
        			<c:choose>
        				<c:when test="${ empty loginUser }">
		        			<th width="650px"><textarea rows="3" class="form-control" style="resize:none;" readonly>로그인 후 이용가능한 서비스입니다.</textarea></th>
	  	      			<th style="vertical-align:middle"><button class="btn btn-secondary" disabled>댓글등록</button></th>
								</c:when>
								<c:otherwise>
		        			<th width="650px"><textarea rows="3" class="form-control" style="resize:none;" id="reply-content"></textarea></th>
		        			<th style="vertical-align:middle"><button class="btn btn-secondary" onclick="fnReplyInsert();">댓글등록</button></th>
								</c:otherwise>
							</c:choose>
        		</tr>
        	</thead>
        	<tbody>
        	</tbody>
        </table>
        
        <script>
        	$(function() {
        		fnReplyList(); // 페이지 로드시 초기 댓글 목록 조회를 위해서
        		//setInterval(fnReplyList, 2000); // 2초간격마다 매번 조회 요청 (실시간으로 보여지게 처리가능)
        		
        		// 삭제버튼 클릭시 댓글 삭제요청용 ajax 호출
        		//$('#reply-area span').on('click', function(){ // 이벤트 제대로 안걸림
        		$('#reply-area').on('click', 'span', function() {
        			$.ajax({
        				url: '${ contextPath }/delete.re',
        				data: {no: $(this).data('no')},
        				success: function(res){
        					if(res > 0){
        						fnReplyList();
        					}
        				},
        				error: function() {
        					console.log('댓글 삭제용 ajax 통신 실패');
        				}
        			})
        			
        		})
        		
        	})
        	
        	// 댓글 작성용 함수 (ajax요청)
        	function fnReplyInsert() {
        		$.ajax({
        			url: '${ contextPath }/insert.re',
        			data: {
        				no: ${ map.b.boardNo },
        				content: $("#reply-content").val()
        			},
        			type: "post",
        			success: function(res){
        				if(res > 0){ // 댓글작성성공
        					$("#reply-content").val(""); // 텍스트상자 초기화
        					fnReplyList(); // 갱신된 댓글 목록 조회해서 다시 화면에 뿌리기
        				}
        			},
        			error: function() {
        				console.log('댓글 작성용 ajax 통신 실패');
        			}
        		})
        	}
        	
        	// 현재 게시글의 댓글 목록 조회용 함수 (ajax요청)
        	function fnReplyList() {
        		
        		$.ajax({
        			url: '${ contextPath }/list.re',
        			data: {no: ${ map.b.boardNo }},
        			success: function(res){
        				console.log(res); // [{Reply객체}, {Reply객체}, {Reply객체}]
        			
        				let trEl = "";
        				if(res.length == 0){ // 댓글이 없을 경우
        					trEl += '<tr><td colspan="3">존재하는 댓글이 없습니다.</td></tr>';
        				}else{ // 댓글이 있을 경우
        					
        					for(let i=0; i<res.length; i++){
        						
        						trEl += '<tr>'
        								  + 	'<th>' + res[i].replyWriter + '</th>'
        								  +		'<td>' + res[i].replyContent;
        								  
        					  if(res[i].replyWriter == '${ loginUser.userId }'){
        						  trEl += ' <span data-no="' + res[i].replyNo + '">x</span>';
        					  }
        					  
        					  trEl += 	'</td>'
        					  			+ 	'<td>' + res[i].registDt + '</td>'
        					  			+ '</tr>';        					  
        						
        					}
        				
        				}
        				
        				$('#reply-area tbody').html(trEl);    
        			
        			},
        			error: function(){
        				console.log('댓글 목록 조회용 ajax 통신 실패');
        			}
        		})
        		
        	}
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