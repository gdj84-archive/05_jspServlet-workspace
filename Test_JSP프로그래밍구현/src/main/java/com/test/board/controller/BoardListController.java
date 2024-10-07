package com.test.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/list.bo")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Service측에 selectBoardAll 메소드 호출하면 TESTBOARD 테이블로부터 전체 글 정보를 조회해오도록 정의되어있음 
		
		// 해당 Service측 메소드 호출해서 db로부터 조회결과 받아올 것 
		
		// 조회된 데이터 담아서 응답페이지로 포워딩할 것 
		// (응답페이지는 /views/board/boardListView.jsp 임) 
		// 페이징 처리 필요 없음
		
		
		// boardListView.jsp 가서 이어서 구문 작성할 것
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
