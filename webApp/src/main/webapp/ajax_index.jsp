<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>AJAX</h1>
	
	<%--
		* 동기식 방식 
		  1. 페이지 전체가 응답되는 방식 (포워딩시 jsp로 이동==jsp전체구문이 응답)
		     ㄴ 응답페이지가 전체 로드되면서 보여짐
		     ㄴ 페이지 깜박거림 발생, 스크롤 상단으로 올라감
		  2. 사용자의 요청 처리 후 그에 해당하는 응답페이지가 돌아와야만 이어서 요청 가능
		     ㄴ 요청 처리까지 시간이 지연되면 무작정 계속 기다려야됨 
		     ㄴ A 요청 ==> A 응답페이지 ==> B요청 ==> B 응답페이지
		  3. 동기식 방식 경우
		     1) a
		     2) form submit 
		     3) location.href 
		     4) redirect
		     
		     즉, 요청 후 다른 페이지로 이동하는 경우는 동기식으로 진행 
		     
		
		* 비동기식 방식
		  1. 응답데이터만 응답되는 방식
		     ㄴ 페이지 자체가 응답되지 않음 (다른 페이지로 이동되는 개념이 아님)
		     ㄴ 현재 페이지가 유지되어있음
		     ㄴ 페이지 깜박거림 없음, 스크롤 상단으로 올라가지 않음 
		  2. 현재페이지를 그대로 유지하면서 필요한 요청을 보낼 수 있음 
		     ㄴ A 요청 ==> A 응답데이터 돌아옴
		        B 요청 ==> B 응답데이터 돌아옴 
		  3. 돌려받은 응답데이터로 화면 내의 특정 영역만 리로드 시킬 수 있음 
		  
		     즉, 요청 후에도 현재 페이지를 그대로 유지시키고자 할 때 비동기식으로 진행 
		     ex) 아이디 중복체크, 찜하기/해제하기, 댓글, 추천, 무한스크롤링(페이징 대체) 등등...
		     
		 * AJAX
		   1. Asynchronous JavaScript And XML
		   2. 비동기식 요청 기술
		   3. 서버로부터 데이터를 가져와서 전체 페이지를 새로 고치지 않고 일부 영역만 리로드 할 수 있음
		   4. 구현방식 : JavaScript 방식 / jQuery 방식 (코드 간결 사용 쉬움) 
		   
		 * jQuery 방식으로 AJAX 통신
		   1. $.ajax() 호출시 통신에 필요한 정보들을 객체에 정의해서 전달 
		   2. 사용법
		      $.ajax({
		      	속성: 속성값,
		      	속성: 속성값,
		      	...
		      })
		   3. 주요 속성
		      1) url				 : 요청할 url (필수)
		      2) type|method : 요청전송방식 (get|post)
		      3) data				 : 요청시 전달할 데이터
		      4) success		 : ajax 통신 성공시 실행할 함수 정의
		      5) error			 : ajax 통신 실패시 실행할 함수 정의
		      6) complete		 : ajax 통신 성공여부와 상관 없이 실행할 함수 정의
		      7) async			 : 비동기 처리 방식 설정 여부 (기본값 true)
		      								 ajax 요청을 연달아서 실행해야될 때 
		      								 순차적으로 실행시키고자 할 경우 async를 false로 지정
		   4. 부수적인 속성
		       1) contentType : request의 데이터 인코딩 방식 정의(보내는 측의 데이터 인코딩)
					 2) dataType 		: 서버에서 response로 오는 데이터의 데이터 형 설정, 값이 없다면 스마트하게 판단함
														 ㄴ xml 	- 트리 형태의 데이터 구조
														 ㄴ json 	- 맵 형식의 데이터 구조(일반적인 데이터 구조)
														 ㄴ script- javascript 및 일반 String 형태 데이터
														 ㄴ html 	- html 태그 자체를 return 하는 방식
														 ㄴ text 	- String 데이터
					 3) accept 			: 파라미터의 타입을 설정(사용자 특화 된 파라미터 타입 설정 가능)
					 4) beforeSend 	: ajax 요청을 하기 전 실행되는 이벤트 callback 함수(데이터 가공 및 header 관련 설정)
					 5) cache 			: 요청 및 결과값을 scope에서 갖고 있지 않도록 하는 것 (기본값 true)
					 6) contents 		: JQuery에서 response의 데이터를 파싱하는 방식 정의
					 7) context 		: ajax 메소드 내 모든 영역에서 파싱 방식 정의
					 8) crossDomain : 타 도메인 호출 가능 여부 설정(기본값 false)
					 9) dataFilter 	: response를 받았을 때 정상적인 값을 return 할 수 있도록 데이터와 데이터 타입 설정
					10) global 			: 기본 이벤트 사용 여부(ajaxStart, ajaxStop)(버퍼링 같이 시작과 끝을 나타낼 때, 선처리 작업)
					11) password 		: 서버에 접속 권한(비밀번호)이 필요한 경우
					12) processData : 서버로 보내는 값에 대한 형태 설정 여부(기본 데이터를 원하는 경우 false설정)
			 	  13) timeout 		: 서버 요청 시 응답 대기 시간(milisecond)	  
		      								 
		
	--%>
	
	
	
	
	
	
	
	
	
	
</body>
</html>