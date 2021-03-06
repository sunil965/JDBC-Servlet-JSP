package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DbConnection;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	Connection connect = null;
	PreparedStatement statement = null;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Login Called");

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String email = request.getParameter("user");
		String password = request.getParameter("pwd");

		new DbConnection();
		connect = DbConnection.connect();
		try {
			String query = "select * from Registration where email=? and password=?";
			statement = (PreparedStatement) connect.prepareStatement(query);
			statement.setString(1, email);
			statement.setString(2, password);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				out.print("Welcome, " + email);
				HttpSession session = request.getSession();
				session.setAttribute("mailid", email);
				response.sendRedirect("profile");

				// request.getRequestDispatcher("/profile").forward(request,
				// response);
			} else {
				out.print("Sorry, Incorrect Emai_ID or Password.");
				request.getRequestDispatcher("/index.html").include(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			connect.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
