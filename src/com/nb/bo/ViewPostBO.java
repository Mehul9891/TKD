package com.nb.bo;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.nb.entity.PropertyAdd;



public class ViewPostBO  {
	public SessionFactory factory; 
	public List getPostListDetails(){
		List results;
		 
		 
		try{
	         factory = new Configuration().configure().buildSessionFactory();
	         Session session = factory.openSession();
	         Criteria cr = session.createCriteria(PropertyAdd.class);
	          results = cr.list();
	      }catch (Throwable ex) { 
	         System.err.println("Failed to create sessionFactory object." + ex);
	         throw new ExceptionInInitializerError(ex); 
	      }
		
		
		
		return results;
	}

}
