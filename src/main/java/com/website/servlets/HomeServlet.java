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
 * Servlet implementation class HomeServlet
 */
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDao categoryDao = new CategoryDao();
		ProductDao productDao = new ProductDao();
		List<Product> prdListForCategory = null;
		if(null != request.getParameter("category")) {
			prdListForCategory = categoryDao.getProductListForCategory(Integer.parseInt(request.getParameter("category")));
		}
		List<Category> allCategoriesList = categoryDao.getAllCategories();
		List<Product> allProductsList = productDao.getAllProducts();
		
		request.setAttribute("catIdPrdList", prdListForCategory);
		request.setAttribute("allCategories", allCategoriesList);
		request.setAttribute("allProducts", allProductsList);
		request.getRequestDispatcher("homepage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
