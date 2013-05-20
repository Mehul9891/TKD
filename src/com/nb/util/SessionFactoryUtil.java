package com.nb.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class SessionFactoryUtil {
	
	private SessionFactoryUtil(){
		
	}
	private static SessionFactory factory = new Configuration().configure().buildSessionFactory();
	Session session=null; 

	public static  Session  getSessionInstance()
	{
		return  factory.openSession();
		
	}
	
	public static void closeSessionFactory(){
		factory.close();
	}

}
