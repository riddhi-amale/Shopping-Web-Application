package com.website.dao;


import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.website.entities.Category;
import com.website.entities.Product;
import com.website.entities.User;
import com.website.util.HibernateHelper;

public class CategoryDao {
	
	/*
	 * public static void main(String args[]) { Category categoryDetails = new
	 * Category(); categoryDetails.setTitle("Electronics");
	 * categoryDetails.setDescription("Has all electronic items");
	 * 
	 * Session session =HibernateHelper.getInstance().openSession(); Transaction trx
	 * = session.beginTransaction(); session.save(categoryDetails); trx.commit(); }
	 */
	
	public boolean saveCategory(Category obj) {
		boolean addCategorySuccessful = false;
		try {
			Session session =HibernateHelper.getInstance().openSession(); 
			Transaction trx= session.beginTransaction(); 
			session.save(obj); 
			trx.commit();
			addCategorySuccessful = true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			
		}
		return addCategorySuccessful;
	}
	
	public List<Category> getAllCategories(){
		List<Category> categoryList = null;
		try {
			  
			  Session hibSession = HibernateHelper.getInstance().openSession();
			  CriteriaBuilder criteriaBuilder = hibSession.getCriteriaBuilder();
			  CriteriaQuery<Category> criteriaQuery = criteriaBuilder.createQuery(Category.class);
			  Root<Category> rootCategory = criteriaQuery.from(Category.class);
			  criteriaQuery.select(rootCategory);
			  Query<Category>hibQuery =	  hibSession.createQuery(criteriaQuery);
			  categoryList = hibQuery.getResultList();
		}catch(Exception ex){
			System.out.println("Exception while fetching a list of categories"+ex.getMessage());
		}
		return categoryList;	  
	}
	
	public List<Product> getProductListForCategory(int CategoryId){
		List<Product> productListForCat = null;
		try {Session hibSession = HibernateHelper.getInstance().openSession();
		  	CriteriaBuilder criteriaBuilder = hibSession.getCriteriaBuilder();
		  	CriteriaQuery<Category> criteriaQuery = criteriaBuilder.createQuery(Category.class);
			Root<Category> rootUser = criteriaQuery.from(Category.class);
			criteriaQuery.select(rootUser).where(criteriaBuilder.equal(rootUser.get("id"),CategoryId));
			Query<Category>hibQuery =hibSession.createQuery(criteriaQuery);
			Category category= hibQuery.getSingleResult();
			productListForCat= category.getProductList(); //from the mapping part in Category.java
			System.out.println(productListForCat);
		}catch(Exception ex){
			System.out.println("Exception while fetching a list of products"+ex.getMessage());
		}
		return productListForCat;
	}	
	}


