package com.br.elJstl.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.elJstl.model.vo.Person;

/**
 * Servlet implementation class ElBasic
 */
@WebServlet("/el.do")
public class ElBasic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElBasic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		/*
		 * * 데이터들을 담을 수 있는 JSP 내장객체 종류 
		 *   1. ServletContext (application Scope)
		 *      1) 한 애플리케이션당 단 1개 존재하는 객체
		 *      2) 애플리케이션에 유지할 데이터 담기 
		 *      3) 애플리케이션 종료 전까지 애플리케이션 전역에서 사용 가능 
		 *   2. HttpSession (session Scope)
		 *      1) 한 브라우저당 1개 존재하는 객체
		 *      2) 브라우저에 유지할 데이터 담기 
		 *      3) 브라우저 종료 전|서버 종료 전까지 jsp/servlet 단에서 데이터 사용 가능
		 *   3. HttpServletRequest (request Scope)
		 *      1) 한 요청당 1개 존재하는 객체
		 *      2) 해당 요청에 대한 응답페이지에 사용할 데이터 담기
		 *      3) forward에 의해 해당 request가 전달된 jsp, servlet에서만 데이터 사용 가능 
		 *   4. PageContext (page Scope)
		 *      1) 한 jsp당 1개 존재하는 객체
		 *      2) 해당 페이지에 필요한 데이터를 담기
		 *      3) jsp에서 담고 해당 jsp에서만 사용 가능
		 *   
		 * * Serlvet에서 해당 객체 접근 방법
		 *   1. ServletContext 	   : request.getServletContext()
		 *   2. HttpSession    	   : request.getSession()
		 *   3. HttpServletRequest : 매개변수로 이미 존재 
		 *   4. PageContext	       : 접근 불가
		 *   
		 * * 해당 객체들의 공통메소드
		 *   1. Attribute 담기	   : .setAttribute("키", 담고자하는데이터);
		 *   2. Attribute 꺼내기   : .getAttribute("키");
		 *   3. Attribute 제거하기 : .removeAttribute("키");
		 */
		
		// request Scope에 담기
		request.setAttribute("classRoom", "A강의장");
		request.setAttribute("student", new Person("홍길동", 20, "남자"));
		
		// session Scope에 담기
		HttpSession session = request.getSession();
		session.setAttribute("teacher", new Person("김말순", 35, "여자"));
		
		// application Scope에 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("academy", "구디아카데미");
		
		// request,session,application 에 동일한 attribute담기
		request.setAttribute("scope", "request에 담긴데이터");
		session.setAttribute("scope", "session에 담긴데이터");
		application.setAttribute("scope", "application에 담긴데이터");
		
		request.getRequestDispatcher("/01_el/elBasic.jsp").forward(request, response);
	
		// webapp => 01_el 폴더 => elBasic.jsp 파일 만들기
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
