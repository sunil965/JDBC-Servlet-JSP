package com.controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletThree")
public class ServletThree extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/Html");
		PrintWriter out = response.getWriter();
		
	    ServletContext context = getServletContext();
		String contextValue = (String) context.getAttribute("reference");
		
		out.println("This value is from servletContext.getParameter() : "+contextValue);
	    out.close();
	}

}
