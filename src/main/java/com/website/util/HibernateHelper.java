package com.website.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateHelper {
	
		private static SessionFactory hibernateSession;
		
		public static SessionFactory getInstance() {
			
			if(hibernateSession == null)
				hibernateSession = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			return hibernateSession;
		}
}
