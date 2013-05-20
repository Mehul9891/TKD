package com.nb.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.nb.entity.Vendor;
import com.nb.form.SelectVendorForm;
import com.nb.form.VendorForm;
import com.nb.util.SessionFactoryUtil;

public class SelectVendorController extends SimpleFormController {

	private SelectVendorForm selectvendorform =  new SelectVendorForm();
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		// TODO Auto-generated method stub
		
		return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		
		/*SessionFactory factory = null; */
		List results;
			 
		 Session session= null;
			try{
		        /* factory = new Configuration().configure().buildSessionFactory();
		          session = factory.openSession();*/
				session = SessionFactoryUtil.getSessionInstance();
		         session.beginTransaction();
		         Criteria cr = session.createCriteria(Vendor.class);
		          results = cr.list();
		          List vendorList = new ArrayList();
		          int i =0;
		          for(;i<results.size();i++)
		          {
		        	 vendorList.add((Vendor)results.get(i)) ;
		        	  
		          }
		          request.setAttribute("size", results.size());
		          selectvendorform.setLstVendor(vendorList);
		          session.getTransaction().commit();
		             session.close();
		             /*factory.close();*/
		      }catch (Throwable ex) { 
		         System.err.println("Failed to create sessionFactory object." + ex);
		         session.getTransaction().rollback();
	             session.close();
	            /* factory.close();*/
		         throw new ExceptionInInitializerError(ex); 
		      }
		
		// TODO Auto-generated method stub
		return selectvendorform;
	}
}
