package com.website.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.website.dao.UserDao;
import com.website.entities.User;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID =1L;
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		
		User person = new User();
		person.setName((String)request.getParameter("name"));
                    person.setEmail((String)request.getParameter("email"));
                    person.setPassword((String)request.getParameter("password"));
                    person.setPhone((String)request.getParameter("phone"));
                    person.setAddress((String)request.getParameter("address"));
                    
                    if(person.getEmail().contains("@admin")) {
                    	person.setRole("admin");
                    }else {
                    	person.setRole("customer");
                    }
                    

                    UserDao user = new UserDao();
        boolean userAdditionSuccess = user.data(person);
		System.out.println("Registration servlet invoked****");
		
		if(userAdditionSuccess) {
			request.setAttribute("success", "userSuccess");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			//response.sendRedirect("register.jsp");
		}
		
		
	}

}
