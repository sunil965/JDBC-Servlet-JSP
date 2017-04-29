package com.database;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public class DbConnection {

	static Connection connector=null;
	
	static public Connection connect() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			connector = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Todo",
					"root",
					"password");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connector;
	}
}
