package com.website.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.website.dao.UserDao;
import com.website.entities.User;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID =1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
	String email = (String)request.getParameter("email");
	String password = (String)request.getParameter("password");
	
	UserDao userDao = new UserDao();
	User authenticatedUser = userDao.getUserAuthenticated(email, password);
	
	if(null != authenticatedUser)
	{
		request.getSession().setAttribute("userDetails", authenticatedUser);
		
		if(authenticatedUser.getRole().contentEquals("admin")) {
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}else if ("customer".equalsIgnoreCase(authenticatedUser.getRole())) {
			request.getRequestDispatcher("/HomeServlet").forward(request, response);
		}else {
		request.getRequestDispatcher("index.jsp").forward(request, response);
		}	
	}else {
		request.setAttribute("failure", "User Details Not Matching");
		request.getRequestDispatcher("login.jsp").forward(request, response);

		
	}
	

	
	
	}
	
}
	
