package com.bridgeit.jsptask;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Userlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("User Login Servlet Called");

		PrintWriter out = response.getWriter();
		String mailid = request.getParameter("mail");
		String password = request.getParameter("pwd");

		Connection connect = DataBase.connect();
		PreparedStatement statement;
		try {
			String query = "select * from Usertable where email=? and password=?";
			statement = (PreparedStatement) connect.prepareStatement(query);
			statement.setString(1, mailid);
			statement.setString(2, password);
			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("userid", resultSet.getInt(4));
				response.sendRedirect("employeeDetailCall");
				return;
			} else {
//				request.getRequestDispatcher("userlogin.jsp").include(request, response);
//				out.println("Incorrect Email_ID or Password.");
				HttpSession session = request.getSession();
//				ServletContext context = request.getServletContext();
				session.setAttribute("invalid","Invalid Email Id or Password");
				response.sendRedirect("loginJspCall");
				out.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
