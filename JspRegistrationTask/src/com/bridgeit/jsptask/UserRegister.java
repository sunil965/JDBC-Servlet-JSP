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

public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("User Register Servlet Called.");
		String name = request.getParameter("user");
		String email = request.getParameter("mail");
		String password = request.getParameter("pwd");
		int uid = Integer.parseInt(request.getParameter("uid"));

		Connection connect = DataBase.connect();
		try {
			PreparedStatement pstate = connect.prepareStatement("insert into Usertable values(?,?,?,?)");
			pstate.setString(1, name);
			pstate.setString(2, email);
			pstate.setString(3, password);
			pstate.setInt(4, uid);
			pstate.executeUpdate();
			connect.close();
			response.sendRedirect("userlogin.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
