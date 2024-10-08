package com.Registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
		
		DatabaseConnection connection = new DatabaseConnection();
		if(connection.SearchByUsername(username)){
			String password = connection.getPassword(username);
			if(pass.equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("isLoggedIn", true);
				response.sendRedirect("details.jsp");
				
			}
			else {
				response.sendRedirect("wrongPassword.jsp");
			}
			
		}
		else {
			response.sendRedirect("wrongUsername.jsp");
		}
	}

}
