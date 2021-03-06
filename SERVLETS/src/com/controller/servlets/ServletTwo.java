package com.controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ServletTwo")
public class ServletTwo extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 	response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();  
		          
		    String name=request.getParameter("name");  
		    out.print("Welcome "+name+"<br><br>");  

		    ServletConfig config = getServletConfig();
			String configName = config.getInitParameter("admin");
			String contextName = getServletContext().getInitParameter("company");
			out.println("servletConfig call : "+configName+ "<br>");
			out.println("servletContext call : "+contextName+ "<br>");
			
	 		 
			// ServletContext DEMO.
		     ServletContext context = getServletContext();
			 context.setAttribute("reference", "Servlet Context Value");
		
			 out.println("This is second Servlet<br>");
			 out.println("<a href = 'servlet3'>Visit Here For 3rd Servlet</a>");
			
			/*		// SendREdirect DEMO.
			 String search=request.getParameter("name");  
		     response.sendRedirect("https://www.google.co.in/#q="+search);  */
		     
		    out.close();
	}

}
