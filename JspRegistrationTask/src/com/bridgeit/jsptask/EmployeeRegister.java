package com.bridgeit.jsptask;

import java.io.IOException;
import java.io.PrintWriter;
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		System.out.println("Employee Registration Servlet Called");
		HttpSession session = request.getSession();
		Integer uid = (Integer) session.getAttribute("userid");
		if(uid!=null){
			String employeeName = request.getParameter("uname");
			if (employeeName == null) {
				request.getRequestDispatcher("employee.jsp").include(request, response);
				out.println("<p>Name : MISSING</p>");
				return;
			}
			String employeeEmail = request.getParameter("mail");

			String address = request.getParameter("address");
			if (address == null) {
				request.getRequestDispatcher("employee.jsp").include(request, response);
				out.println("<p>ADDRESS : MISSING</p>");
				return;
			}

			String company = request.getParameter("company");
			if (company == null) {
				request.getRequestDispatcher("employee.jsp").include(request, response);
				out.println("<p>COMPANY : MISSING</p>");
				return;
			}

			int age = Integer.parseInt(request.getParameter("age"));
			if (age < 18 || age > 110) {
				request.getRequestDispatcher("employee.jsp").include(request, response);
				out.println("<p> AGE : BETWEEN 18 AND 99");
				return;
			}
			String gender = request.getParameter("gender");
			if (gender == null) {
				request.getRequestDispatcher("employee.jsp").include(request, response);
				out.println("Gender Not Selected");
				return;
			}
			String domain = request.getParameter("specialized").trim();
			if (domain == null) {
				request.getRequestDispatcher("employee.jsp").include(request, response);
				out.println("Specialization Tech Not Selected");
				return;
			}
			String language = request.getParameter("language");
			if (language == null) {
				request.getRequestDispatcher("employee.jsp").include(request, response);
				out.println("Language Not Selected");
				return;
			}

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
		else{
			response.sendRedirect("userlogin.jsp");
		}

	}

}
