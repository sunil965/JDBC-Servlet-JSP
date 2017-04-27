package com.controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletOne")
public class ServletOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/Html");
		
		PrintWriter out = response.getWriter();
		ServletConfig config = getServletConfig();
		String configName = config.getInitParameter("admin");
		String contextName = getServletContext().getInitParameter("company");
		out.println("servletConfig call : "+configName+ "<br>");
		out.println("servletContext call : "+contextName+ "<br>");
		
		String name = request.getParameter("name");
		String password = request.getParameter("pwd");
		out.println(name+" "+password);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}