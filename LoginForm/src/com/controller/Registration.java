package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DbConnection;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Registration extends HttpServlet{
	Connection connect=null;
	PreparedStatement statement=null;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("mail");
		String password = req.getParameter("pwd");
		String name=req.getParameter("name");
		String contactString = req.getParameter("number");
		
		PrintWriter out=resp.getWriter();
		new DbConnection();
		connect = DbConnection.connect();
		
		try {
			 statement = (PreparedStatement) connect.prepareStatement("insert into Registration values(?,?,?,?)");
			 statement.setString(1, email);
			 statement.setString(2, password);
			 statement.setString(3, name);
			 statement.setString(4, contactString);
			 statement.executeUpdate();
			 out.println("<html><body><h1>Registered Sucessfully</h1></body></html>");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
