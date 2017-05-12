package com.bridgeit.jsptask;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Connection connect = DataBase.connect();
		out.println("User Register Servlet Called.");

		String name = request.getParameter("user");
		if (name == null || name == "") {
			request.getRequestDispatcher("/index.jsp").include(request, response);
			out.println("<p>Name : MISSING</p>");
			return;
		}

		String email = request.getParameter("mail");
		if (email == null || email == "") {
			request.getRequestDispatcher("/index.jsp").include(request, response);
			out.println("<p>Email : MISSING</p>");
			return;
		}

		String password = request.getParameter("pwd");
		if (password == null || password.length() < 6) {
			request.getRequestDispatcher("/index.jsp").include(request, response);
			out.println("<p>Password : MISSING</p>");
			return;
		}

		int uid = Integer.parseInt(request.getParameter("uid"));
		if (uid == 0 || uid <= 100) {
			request.getRequestDispatcher("/index.jsp").include(request, response);
			out.println("<p>UID : Minimum 3 Digit</p>");
			return;
		}

		
		try {
			PreparedStatement pstate = connect.prepareStatement("insert into Usertable values(?,?,?,?)");
			pstate.setString(1, name);
			pstate.setString(2, email);
			pstate.setString(3, password);
			pstate.setInt(4, uid);
			pstate.executeUpdate();
			connect.close();
//			request.getRequestDispatcher("loginJspCall").forward(request, response);;
			response.sendRedirect("loginJspCall");
			return;
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
