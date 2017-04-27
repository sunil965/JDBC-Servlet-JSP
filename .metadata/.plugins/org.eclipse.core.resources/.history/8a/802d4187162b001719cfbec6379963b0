package com.bridge.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void init(){
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();  
		    	// Demo of servletConfig() and servletContext().
		    out.println("sevrletConfig() Value: "+this.getInitParameter("driver")+"<br>");
		    out.println("servletContext() Value: "+this.getServletContext().getInitParameter("admin"));
		          
		    out.close();  

	}
}
