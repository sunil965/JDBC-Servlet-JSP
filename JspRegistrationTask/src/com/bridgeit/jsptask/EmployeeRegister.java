package com.bridgeit.jsptask;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/employeeRegister")
public class EmployeeRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}*/

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		System.out.println("Employee Registration Servlet Called");
		HttpSession session = request.getSession();
		
		int uid = (int) session.getAttribute("userid");
		String employeeName = request.getParameter("uname");
		String employeeEmail = request.getParameter("mail");
		String address = request.getParameter("address");
		String company = request.getParameter("company");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String domain = request.getParameter("specialized");
		String language = request.getParameter("language");
		
		Connection connect = DataBase.connect();
		try {
			PreparedStatement pstate = connect.prepareStatement("insert into EmployeeTable values(?,?,?,?,?,?,?,?,?)");
			pstate.setInt(1, uid);
			pstate.setString(2, employeeName);
			pstate.setString(3, address);
			pstate.setString(4, employeeEmail);
			pstate.setString(5, company);
			pstate.setInt(6, age);
			pstate.setString(7, gender);
			pstate.setString(8, domain);
			pstate.setString(9, language);
			pstate.executeUpdate();
			connect.close();
			response.sendRedirect("employeeDetails");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}