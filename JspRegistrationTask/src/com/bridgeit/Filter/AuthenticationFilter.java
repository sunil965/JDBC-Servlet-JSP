package com.bridgeit.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/authenticationFilter")
public class AuthenticationFilter implements Filter {

	public void destroy() {
		
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request2 = (HttpServletRequest) request;
		HttpServletResponse response2 = (HttpServletResponse) response;
		HttpSession session = request2.getSession();
		Integer uid = (Integer) session.getAttribute("userid");
		
		if(uid==null){
			response2.sendRedirect("preServlet");
		}
		else{
			response2.sendRedirect("employeeDetails");
		}
		// pass the request along the filter chain
		/*chain.doFilter(request, response);*/
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
