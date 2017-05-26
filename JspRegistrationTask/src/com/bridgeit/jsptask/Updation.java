package com.bridgeit.jsptask;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updation")
public class Updation extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		String address=request.getParameter("addr");
		String email=request.getParameter("email");
		String company=request.getParameter("company");
		int age=Integer.parseInt(request.getParameter("age"));
		String gender=request.getParameter("gender");
		String domain=request.getParameter("spec").trim();
		String language=request.getParameter("lang");
		PrintWriter out = response.getWriter();
		/*out.println(name +" "+address+" "+email+" "+company+" "+age+" "+gender+" "+domain+" "+language);*/
		
		Connection connect = DataBase.connect();
		try {
			PreparedStatement pstate = connect.prepareStatement("update EmployeeTable set name=?, address=?, company=?, age=?, gender=?,specialized=?, language=? where email=?");
			pstate.setString(1, name);
			pstate.setString(2, address);
			pstate.setString(3, company);
			pstate.setInt(4, age);
			pstate.setString(5, gender);
			pstate.setString(6, domain);
			pstate.setString(7, language);
			pstate.setString(8, email);
			 int count = pstate.executeUpdate();
			 if(count>0){
				 response.sendRedirect("employeeDetails");
				 connect.close();
			 }
			 else {
				 out.println("Updation Failed");
				 request.getRequestDispatcher("employeeDetails.jsp").include(request, response);
				 connect.close();
			 }
		/*	response.sendRedirect("employeeDetails");*/
		} catch (SQLException e) {
			e.printStackTrace();
		}

		
	}

}
