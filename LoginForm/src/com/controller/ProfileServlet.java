package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DbConnection;

//@WebServlet(urlPatterns="/profile")
public class ProfileServlet extends HttpServlet {

	@Override
	public void init() throws ServletException {
		super.init();
	}

	private static final long serialVersionUID = 1L;

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection connect = null;
		PreparedStatement statement = null;
		/*
		 * if( request.getSession().getAttribute("mailid") == null) { return; }
		 */
		/*
		 * String email = request.getParameter("user"); String password =
		 * request.getParameter("pwd"); System.out.println("=============");
		 * System.out.println(email); System.out.println(password);
		 * System.out.println("=============");
		 */
		response.setContentType("text/Html");
		PrintWriter out = response.getWriter();
		request.getRequestDispatcher("logout.html").include(request, response);

		HttpSession session = request.getSession(false);
		connect = DbConnection.connect();

		if (session != null) {
			String emailid = (String) session.getAttribute("mailid");
			out.print("Welcome: " + emailid);
			try {
				
				statement = connect.prepareStatement("Select * from Registration where email = ?");
				statement.setString(1, emailid);
				ResultSet result = statement.executeQuery();
				out.println("<div align='center'><h1>" + "Your Profile Details Are" + "</h1>");
				// out.print("Welcome: "+emailid);
				while (result.next()) {
					out.println("<h4> EMAIL_ID " + result.getString(1) + "</h4>");
					out.println("<h4> PASSWORD " + result.getString(2) + "</h4>");
					out.println("<h4> USER " + result.getString(3) + "</h4>");
					out.println("<h4> CONTACT " + result.getLong(4) + "</h4>");
					out.println("</div>");
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

		} else {
			out.print("Please login first");
			request.getRequestDispatcher("login.html").include(request, response);
		}
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
