package com.website.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.website.dao.CategoryDao;
import com.website.dao.ProductDao;
import com.website.entities.Category;
import com.website.entities.Product;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Category retrieveData = new Category();
		boolean categoryAdditionSuccess = false;
		List<Category> categoriesList = null;
		retrieveData.setTitle((String)request.getParameter("catTitle"));
		retrieveData.setDescription((String)request.getParameter("catDescription"));
		CategoryDao categoryDao = new CategoryDao();
		categoryAdditionSuccess = categoryDao.saveCategory(retrieveData);
		System.out.println("Admin servlet invoked****");
		
		if(categoryAdditionSuccess) {
			request.setAttribute("catAdded", "CategoryAdded");
			categoriesList = categoryDao.getAllCategories();
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}else {
			request.setAttribute("failure", retrieveData);
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("operation") != null && "addCategory".equalsIgnoreCase(request.getParameter("operation"))) {
			doGet(request, response);
		}else {
			processProduct(request, response);
		}
	}
	
	protected void processProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product productinput = new Product();
		
		productinput.setProductName((String)request.getParameter("productName"));
		productinput.setProductDesc((String)request.getParameter("productDescription"));
		productinput.setProductPrice(Integer.parseInt((String)(request.getParameter("productPrice"))));
		productinput.setProductDiscount(Integer.parseInt((String)(request.getParameter("productDiscount"))));
		productinput.setProductQuantity(Integer.parseInt((String)(request.getParameter("productQty"))));
		productinput.getProdCategory().setId(Integer.parseInt(request.getParameter("catId")));
		productinput.setProductImage((String)request.getParameter("productImage"));
		
		ProductDao productDao =new ProductDao();
		productDao.saveProduct(productinput);
		request.setAttribute("productSuccess", productinput);
		request.getRequestDispatcher("admin.jsp").forward(request, response);
	
		
	}
	}


