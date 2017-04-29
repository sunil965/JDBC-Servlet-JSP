package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet(urlPatterns="/profile")
public class ProfileServlet extends HttpServlet {
	
	@Override
	public void init() throws ServletException {
		super.init();
	}
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if( request.getSession().getAttribute("mailid") == null)
		{
			// redirec to login
			return;
		}
		
		/*String email = request.getParameter("user");
		String password = request.getParameter("pwd");
		System.out.println("=============");
		System.out.println(email);
		System.out.println(password);
		System.out.println("=============");
		*/
		
		response.setContentType("text/Html");
		PrintWriter out  = response.getWriter();
		request.getRequestDispatcher("logout.html").include(request, response);
	
		System.out.println("bcjkdbvjdbvik");
		
		HttpSession session=request.getSession(false);  
		
        if(session!=null){  
        String user=(String)session.getAttribute("mailid");  
        out.print("Hello, "+user+" Welcome to Profile");  
        
        }  
        else{  
            out.print("Please login first");  
            request.getRequestDispatcher("login.html").include(request, response);  
        }  
        out.close();  
	}

}
