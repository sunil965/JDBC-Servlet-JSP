package com.bridgeit.loginApp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrationServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String mobile= req.getParameter("mobile");
		String password=req.getParameter("pass");
	
		PrintWriter out=resp.getWriter();
		out.println("<html><body><h1>"+email+","+password+"</h1></body></html>");
		
	}

}