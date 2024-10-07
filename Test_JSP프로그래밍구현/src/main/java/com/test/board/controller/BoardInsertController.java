package com.test.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/insert.bo")
public class BoardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 게시글 작성 요청시 실행해야되는 구문 작성하기. 
		
		// 넘어오는 첨부파일 "resources/upload_files" 폴더에 업로드 시키기
		// 이때 파일명 수정 작업해주는 MyFileRenamePolicy 클래스가서 코드 작성하기
			// 수정명은 앞에 "test_" 붙이고 그 뒤에 "xxxxxxxx"(년월일시분초), xxxxx(랜덤숫자5자리) 붙이도록 할 것 
		
		
		// 카테고리, 게시글제목, 게시글내용, 첨부파일원본명, 첨부파일경로(폴더경로+수정명 합쳐서 fileURL) 뽑아서 db에 insert 시키기 (Service쪽에 insertBoard 메소드 정의되어있음)
		
		// 작성 성공시 다시 게시글 목록페이지가 보여지도록 할 것 
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
