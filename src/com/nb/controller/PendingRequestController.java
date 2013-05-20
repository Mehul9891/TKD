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

import com.nb.entity.PendingRequest;
import com.nb.entity.Vendor;
import com.nb.form.PendingRequestForm;
import com.nb.form.VendorForm;
import com.nb.util.SessionFactoryUtil;

public class PendingRequestController extends SimpleFormController {

	private PendingRequestForm  pendingRequestForm= new PendingRequestForm();
	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		// TODO Auto-generated method stub
	return super.onSubmit(request, response, command, errors);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		
		/*SessionFactory factory; */
		List results;
		Session session = null;	 
			 
			try{
		       /*  factory = new Configuration().configure().buildSessionFactory();
		         Session session = factory.openSession();
		       */
				session = SessionFactoryUtil.getSessionInstance();
				Criteria cr = session.createCriteria(PendingRequest.class);
				cr.setCacheable(true);
		          results = cr.list();
		          session.close();
		          List lstPendingRequest = new ArrayList();
		          int i =0;
		          for(;i<results.size();i++)
		          {
		        	  lstPendingRequest.add((PendingRequest)results.get(i)) ;
		        	  
		          }
		          request.setAttribute("size", results.size());
		          pendingRequestForm.setLstPendingRequest(lstPendingRequest);
		      }catch (Throwable ex) { 
		         System.err.println("Failed to create sessionFactory object." + ex);
		         throw new ExceptionInInitializerError(ex); 
		      }
		// TODO Auto-generated method stub
		return pendingRequestForm ;
	}
}

