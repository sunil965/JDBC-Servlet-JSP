package com.bridgeit.jsptask;

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

/*@WebServlet("/employeeDetails")*/
public class EmployeeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("userid");
		Connection conn = DataBase.connect();
		PreparedStatement statement = null;

		try {
			statement = conn.prepareStatement("Select * from EmployeeTable where uid =?");
			statement.setInt(1, uid);
			ResultSet resultSet = statement.executeQuery();
			out.println("<html><body>");
			out.println("<div align='right'><a href='employee.jsp'>Back</a></div>");
			out.println("<div align='center'>");
			out.println("<h1>EMPLOYEES DETAILS</h1>");
			out.println("<table border=1 width=50% height=50%>");
			out.println(
					"<tr><th>UId</th><th>EmployeeName</th><th>Address</th><th>Email_ID</th><th>Company</th><th>Age</th><th>Gender</th><th>Specialized</th><th>Language</th></tr>");

			while (resultSet.next()) {
				out.println("<tr><td>" + resultSet.getInt(1) + "</td><td>" + resultSet.getString(2) + "</td><td>"
						+ resultSet.getString(3) + "</td><td>" + resultSet.getString(4) + "</td><td>"
						+ resultSet.getString(5) + "</td><td>" + resultSet.getInt(6) + "</td><td>"
						+ resultSet.getString(7) + "</td><td>" + resultSet.getString(8) + "</td><td>"
						+ resultSet.getString(9) + "</td></tr>");

			}
			out.println("</table>");
			out.println("</div></body></html>");
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
