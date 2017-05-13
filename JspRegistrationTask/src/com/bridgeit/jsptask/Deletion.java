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

@WebServlet("/deletion")
public class Deletion extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		/*out.println("Deletion called"+key);*/
		String key = request.getParameter("delkey");
		Connection connect = DataBase.connect();
		try {
			PreparedStatement pstate = connect.prepareStatement("delete from EmployeeTable where email=?");
			pstate.setString(1, key);
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
			/*pstate.executeUpdate();
			connect.close();
			response.sendRedirect("employeeDetails");*/
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
