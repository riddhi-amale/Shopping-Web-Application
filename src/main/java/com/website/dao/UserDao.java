package com.website.dao;


import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.website.entities.Product;
import com.website.entities.User;
import com.website.util.HibernateHelper;

public class UserDao {
		
	/*
	 * public static void main(String args[]) {
	 * 
	 * User userDetails = new User(); userDetails.setAddress("Sample Test1");
	 * userDetails.setEmail("Hai2@hai.com"); userDetails.setId(1);
	 * userDetails.setName("Sample Name2"); userDetails.setPassword("hai2");
	 * userDetails.setPhone("986754341"); userDetails.setPic("pic2");
	 * userDetails.setRole("simple2");
	 * 
	 * Session session =HibernateHelper.getInstance().openSession(); Transaction trx
	 * = session.beginTransaction(); session.save(userDetails); trx.commit();
	 * 
	 * }
	 */
	public boolean data(User obj) {
		
		boolean addUserSuccessful = false;
		try {
		Session session =HibernateHelper.getInstance().openSession(); 
		Transaction trx= session.beginTransaction(); 
		session.save(obj); 
		trx.commit();
		addUserSuccessful = true;
		}catch(Exception ex){
			System.out.println(ex.getMessage());
			
		}
		return addUserSuccessful;
		
	}
	public User getUserAuthenticated(String emailId, String password) {
		  
		  User singleUserDetail = null;
	  try {
	  
		  Session hibSession = HibernateHelper.getInstance().openSession();
		  CriteriaBuilder criteriaBuilder = hibSession.getCriteriaBuilder();
		  CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);
		  Root<User> rootUser = criteriaQuery.from(User.class);
		  criteriaQuery.select(rootUser).where(criteriaBuilder.equal(rootUser.get("email"), emailId)); 
		  Query<User>hibQuery =	  hibSession.createQuery(criteriaQuery);
		  singleUserDetail = hibQuery.getSingleResult();
	  
	  if(null != singleUserDetail) {
		  
		  if(password.contentEquals(singleUserDetail.getPassword())) {
			return   singleUserDetail;
		  }else {
			  singleUserDetail  = null;
		  }
		  
	  }

	  }catch(Exception ex) {
		  
		  System.out.println("Error message is ::"+ex.getMessage());
	  }
	  return singleUserDetail;
	}
	public List<User> getAllUsers(){
		List<User> UserList = null;
		try {
			Session hibSession =HibernateHelper.getInstance().openSession(); 
			CriteriaBuilder criteriaBuilder = hibSession.getCriteriaBuilder();
			CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);
			Root<User> rootUser = criteriaQuery.from(User.class);
			criteriaQuery.select(rootUser).where(criteriaBuilder.equal(rootUser.get("role"), "customer"));
			Query<User>hibQuery = hibSession.createQuery(criteriaQuery);
			UserList = hibQuery.getResultList();
		}catch(Exception ex) {
			System.out.println("Error while fetching User list"+ex.getMessage());
		}
		return UserList;	

		
	}

}
