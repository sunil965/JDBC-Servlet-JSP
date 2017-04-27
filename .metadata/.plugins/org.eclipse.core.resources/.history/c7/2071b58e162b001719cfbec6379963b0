package com.bridge.servlet;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Todo",
					"root",
					"password");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String user = request.getParameter("user");
		String email = request.getParameter("user");
		String password = request.getParameter("user");
		String fname = request.getParameter("user");
		String lname = request.getParameter("user");
		String address = request.getParameter("user");
		String city = request.getParameter("user");
		String state = request.getParameter("user");
		String pinString = request.getParameter("pin");
			int pin = Integer.parseInt(pinString);
		String contactString = request.getParameter("contact");
			Long contact = Long.parseLong(contactString);
		
		
		try {
			String insertQuery = "insert into Registration values(?,?,?,?,?,?,?,?,?,?)"; 
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(insertQuery);
			ps.setString(1, user);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, fname);
			ps.setString(5, lname);
			ps.setString(6, address);
			ps.setString(7, city);
			ps.setString(8, state);
			ps.setInt(9, pin);
			ps.setLong(10, contact);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
