package com.bridgeit.jsptask;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet("/employeeDetails")*/
public class EmployeeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
	
		
		request.getRequestDispatcher("employeeDetail.jsp").forward(request, response);

//		HttpSession session = request.getSession();
	}


}
