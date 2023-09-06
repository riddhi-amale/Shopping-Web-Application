package com.website.dao;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.website.entities.Product;
import com.website.util.HibernateHelper;

public class ProductDao {
	public boolean saveProduct(Product obj) {
		boolean addProductSuccessful = false;
		try {
			Session session =HibernateHelper.getInstance().openSession(); 
			Transaction trx= session.beginTransaction(); 
			session.save(obj); 
			trx.commit();
			addProductSuccessful = true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			
		}
		return addProductSuccessful;
	}
	public List<Product> getAllProducts(){
		List<Product> productList = null;
		try {
			Session hibSession =HibernateHelper.getInstance().openSession(); 
			CriteriaBuilder criteriaBuilder = hibSession.getCriteriaBuilder();
			CriteriaQuery<Product> criteriaQuery = criteriaBuilder.createQuery(Product.class);
			Root<Product> rootCategory = criteriaQuery.from(Product.class);
			criteriaQuery.select(rootCategory);
			Query<Product>hibQuery = hibSession.createQuery(criteriaQuery);
			productList = hibQuery.getResultList();
		}catch(Exception ex) {
			System.out.println("Error while fetching product list"+ex.getMessage());
		}
		return productList;	

		
	}
}
