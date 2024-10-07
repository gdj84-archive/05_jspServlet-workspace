package com.br.elJstl.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.elJstl.model.vo.Person;

/**
 * Servlet implementation class ElOperator
 */
@WebServlet("/elOperator.do")
public class ElOperator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElOperator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("big", 10);
		request.setAttribute("small", 3);
		
		request.setAttribute("str1", "안녕");
		request.setAttribute("str2", "잘가");
		
		request.setAttribute("per1", new Person("홍길동", 20, "남자"));
		request.setAttribute("per2", null);
		
		List<String> list1 = new ArrayList<>();
		list1.add("안녕하세요");
		List<String> list2 = new ArrayList<>();
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2); // 텅빈 리스트
		
		request.getRequestDispatcher("/01_el/elOperator.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
