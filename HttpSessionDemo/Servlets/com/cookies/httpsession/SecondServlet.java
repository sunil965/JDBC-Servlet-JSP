package com.cookies.httpsession;

import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/*@WebServlet("/SecondServlet")*/
public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	public void doPost(HttpServletRequest request, HttpServletResponse response){  
	    try{  
	  
	    response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	      
	    Cookie ck[]=request.getCookies();  
	    out.print("Hello from Cookie : "+ck[0].getValue());
	    
	    String name=request.getParameter("uname");  
        out.print("Hello from Hidden Form : "+name);  
	  
	    out.close();  
	  
	         }catch(Exception e){System.out.println(e);}  
	    }  

}
